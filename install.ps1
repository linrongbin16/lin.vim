#Requires -RunAsAdministrator

# Debug
# Set-PSDebug -Trace 1

$VIM_HOME = "$env:USERPROFILE\.vim"
$APPDATA_LOCAL_HOME = "$env:USERPROFILE\AppData\Local"
$NVIM_HOME = "$APPDATA_LOCAL_HOME\nvim"
$INSTALL_HOME = "$VIM_HOME\installer"

$MODE_NAME = "full" # default mode
$OPT_BASIC = $False
$OPT_DISABLE_VIM = $False
$OPT_DISABLE_NEOVIM = $False

# utils

function Message([string]$message) {
    Write-Host "[lin.vim] - $message"
}

function ErrorMessage([string] $message) {
    Message "error! $message"
}

function InstallOrSkip([string]$command, [string]$target) {
    if (Get-Command -Name $target -ErrorAction SilentlyContinue) {
        Message "'${target}' already exist, skip..."
    }
    else {
        Message "install '${target}' with command: '${command}'"
        Invoke-Expression $command
    }
}

# Test if symlink
function TestReparsePoint([string]$path) {
    $file = Get-Item $path -Force -ea SilentlyContinue
    return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

function TryBackup([string]$src) {
    if ((TestReparsePoint $src) -or (Test-Path $src)) {
        $now = Get-Date -Format "yyyy-MM-dd.HH-mm-ss.fffffff"
        $dest = -join ($src, ".", $now)
        Rename-Item $src $dest
        Message "backup '$src' to '$dest'"
    }
}

# function TryDelete([string]$src) {
#     if ((TestReparsePoint $src) -or (Test-Path $src)) {
#         (Get-Item $src).Delete()
#         Message "delete '$src'"
#     }
# }

# dependency

function GithubLatestReleaseTag([string]$org, [string]$repo) {
    $uri = "https://github.com/$org/$repo/releases/latest"
    $response = Invoke-WebRequest -Uri $uri -Method 'GET'
    return $response.Links.Href | where { $_ -like "*$org/$repo/releases/tag*" } | ForEach-Object { $parts = $_.Split("/"); $parts[$parts.Length - 1] } | Select-Object -first 1
}

function GithubInstaller([string]$org, [string]$repo, [string]$tag, [string]$target) {
    $tempFile = "$env:TEMP\$target"
    Message "install $tempFile from github"
    Invoke-WebRequest -Uri "https://github.com/$org/$repo/releases/download/$tag/$target" -OutFile $tempFile
    Message "download '$target' from github.com - done"
    Start-Process -wait $tempFile
    Message "install $tempFile from github - done"
}

function PlatformDependency() {
    # vim
    if (Get-Command -Name gvim -ErrorAction SilentlyContinue) {
        Message "'gvim' already exist, skip..."
    }
    else {
        $org = "vim"
        $repo = "vim-win32-installer"
        $tag = GithubLatestReleaseTag -org $org -repo $repo
        $version = $tag.Split("v")[1]
        $target = "gvim_${version}_x64.exe"
        GithubInstaller -org $org -repo $repo -tag $tag -target $target
    }
    # neovim
    if (Get-Command -Name nvim -ErrorAction SilentlyContinue) {
        Message "'nvim' already exist, skip..."
    }
    else {
        $org = "neovim"
        $repo = "neovim"
        $tag = GithubLatestReleaseTag -org $org -repo $repo
        $target = "nvim-win64.msi"
        GithubInstaller -org $org -repo $repo -tag $tag -target $target
    }
    # cmake
    if (Get-Command -Name cmake -ErrorAction SilentlyContinue) {
        Message "'cmake' already exist, skip..."
    }
    else {
        $org = "Kitware"
        $repo = "CMake"
        $tag = GithubLatestReleaseTag -org $org -repo $repo
        $version = $tag.Split("v")[1]
        $target = "cmake-${version}-windows-x86_64.msi"
        GithubInstaller -org $org -repo $repo -tag $tag -target $target
    }
    # universal-ctags
    if (Get-Command -Name ctags -ErrorAction SilentlyContinue) {
        Message "'ctags' already exist, skip..."
    }
    else {
        $org = "universal-ctags"
        $repo = "ctags-win32"
        $tag = GithubLatestReleaseTag -org $org -repo $repo
        $target = "ctags-${tag}-x64.zip"
        GithubInstaller -org $org -repo $repo -tag $tag -target $target
    }
}

function RustDependency() {
    Message "install modern rust commands with cargo"
    InstallOrSkip -command "cargo install ripgrep" -target "rg"
    InstallOrSkip -command "cargo install fd-find" -target "fd"
    # fzf preview syntax highlight
    InstallOrSkip -command "cargo install --locked bat" -target "bat"
}

function Pip3Dependency() {
    Message "install python packages with pip3"
    pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click
}

function NpmDependency() {
    Message "install node packages with npm"
    npm install -g yarn prettier neovim
}

function GuifontDependency() {
    $org = "ryanoasis"
    $repo = "nerd-fonts"
    $tag = "v2.2.2"
    $target = "Hack.zip"
    message "install hack nerd font from github"
    Invoke-WebRequest -Uri "https://github.com/$org/$repo/releases/download/$tag/$target" -OutFile $target

    # Extract Hack.zip and copy to C:\Windows\Fonts folder
    $tempFolder = "$VIM_HOME\Hack"
    TryBackup $tempFolder
    New-Item -Path $tempFolder -ItemType "directory"
    Set-Location $tempFolder
    &"$env:windir\System32\tar.exe" -xf "$VIM_HOME\$target"
    Get-ChildItem -Filter "Hack*" | ForEach-Object { Start-Process -wait $_ }
    Set-Location $VIM_HOME

    # Remove Hack.zip and temp folder
    Remove-Item -LiteralPath $tempFolder -Force -Recurse
    Remove-Item -LiteralPath "$VIM_HOME\$target" -Force -Recurse

    message "install hack nerd font from github - done"
}

function InstallDependency() {
    Message "install dependencies for windows"
    PlatformDependency
    RustDependency
    Pip3Dependency
    NpmDependency
}

# basic

function InstallBasicVimrc() {
    if (-not $OPT_DISABLE_VIM) {
        $BasicPath = "$env:USERPROFILE\.vim\standalone\basic.vim"
        $VimrcPath = "$env:USERPROFILE\_vimrc"

        TryBackup $VimrcPath
        Message "install $VimrcPath for vim on windows"
        cmd /c mklink $VimrcPath $BasicPath
    }
}

function InstallBasicNeovimInit() {
    if (-not $OPT_DISABLE_NEOVIM) {
        $BasicPath = "$env:USERPROFILE\.vim\standalone\basic.vim"
        $NvimInitVimPath = "$NVIM_HOME\init.vim"
        Message "install $APPDATA_LOCAL_HOME\nvim\init.vim for neovim on windows"
        TryBackup $NvimInitVimPath
        TryBackup $NVIM_HOME
        cmd /c mklink $NVIM_HOME $VIM_HOME
        cmd /c mklink $NvimInitVimPath $BasicPath
    }
}

function InstallBasic() {
    InstallBasicVimrc
    InstallBasicNeovimInit
}

function ShowHelp() {
    Get-Content -Path "$INSTALL_HOME\help.txt" | Write-Host
}

# # Get the ID and security principal of the current user account
# $currentID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
# $currentPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentID);
# # Get the security principal for the administrator role
# $adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;
#
# # If we are not running as an administrator, relaunch as administrator
# if (!($currentPrincipal.IsInRole($adminRole)))
# {
#     # Create a new process that run as administrator
#     $installer=$script:MyInvocation.MyCommand.Path
#     Start-Process powershell "& '$installer' $args" -Verb RunAs
#
#     # Exit from the current process
#     Exit;
# }

# parse options

function RequiresAnArgumentError([string]$name) {
    ErrorMessage "option '$name' requires an argument."
    exit 1
}

function UnknownOptionError() {
    ErrorMessage "unknown option, please try --help for more information."
    exit 1
}

$argsLength = $args.Length

for ($i = 0; $i -lt $argsLength; $i++) {
    $a = $args[ $i ];
    if ($a.StartsWith("-h") -or $a.StartsWith("--help")) {
        ShowHelp
        exit 0
    }
    elseif ($a.StartsWith("-b") -or $a.StartsWith("--basic")) {
        $MODE_NAME = "basic"
        $OPT_BASIC = $True
    }
    elseif ($a.StartsWith("-l") -or $a.StartsWith("--limit")) {
        $MODE_NAME = "limit"
    }
    elseif ($a.StartsWith("--static-color") -or $a.StartsWith("--disable-color") -or $a.StartsWith("--disable-highlight") -or $a.StartsWith("--disable-language") -or $a.StartsWith("--disable-editing") -or $a.StartsWith("--disable-ctrl-keys") -or $a.StartsWith("--disable-plugin")) {
        # Nothing here
    }
    elseif ($a.StartsWith("--disable-vim")) {
        $OPT_DISABLE_VIM = $True
    }
    elseif ($a.StartsWith("--disable-neovim")) {
        $OPT_DISABLE_NEOVIM = $True
    }
    else {
        UnknownOptionError
    }
}

Message "install with $MODE_NAME mode"

if ($OPT_BASIC) {
    InstallBasic
}
else {
    InstallDependency
    Message "install configurations for vim"

    python3 $VIM_HOME\generator.py $args
    if ($LastExitCode -ne 0) {
        exit 1
    }
    if (-not $OPT_DISABLE_VIM) {
        cmd /c gvim -E -c "PlugInstall" -c "qall" /wait
    }
    if (-not $OPT_DISABLE_NEOVIM) {
        cmd /c nvim -E -c "PlugInstall" -c "qall" /wait
    }
}

Message "install with $MODE_NAME mode - done"
