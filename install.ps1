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

function Message([string]$content) {
    Write-Host "[lin.vim] - $content"
}

function ErrorMessage([string] $content) {
    Message "error! $content"
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

function RequiresAnArgumentError([string]$name) {
    ErrorMessage "option '$name' requires an argument."
    exit 1
}

function UnknownOptionError() {
    ErrorMessage "unknown option, please try --help for more information."
    exit 1
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
    Message "install $tempFile($tag) from github"
    Invoke-WebRequest -Uri "https://github.com/$org/$repo/releases/download/$tag/$target" -OutFile $tempFile
    Start-Process -wait $tempFile
    Message "install $tempFile($tag) from github - done"
}

function VimDependency() {
    $org = "vim"
    $repo = "vim-win32-installer"
    $tag = GithubLatestReleaseTag -org $org -repo $repo
    $version = $tag.Split("v")[1]
    $target = "gvim_${version}_x64.exe"
    GithubInstaller -org $org -repo $repo -tag $tag -target $target
}

function NeovimDependency() {
    $org = "neovim"
    $repo = "neovim"
    $tag = GithubLatestReleaseTag -org $org -repo $repo
    $target = "nvim-win64.msi"
    GithubInstaller -org $org -repo $repo -tag $tag -target $target
}

function CmakeDependency() {
    $org = "Kitware"
    $repo = "CMake"
    $tag = GithubLatestReleaseTag -org $org -repo $repo
    $version = $tag.Split("v")[1]
    $target = "cmake-${version}-windows-x86_64.msi"
    GithubInstaller -org $org -repo $repo -tag $tag -target $target
}

function Python3Dependency() {
    $pythonUrl1 = "https://www.python.org/downloads/windows/"
    $pythonResponse1 = Invoke-WebRequest -Uri $pythonUrl1 -Method 'GET'
    $pythonUrl2 = $pythonResponse1.Links | where { $_.outerHTML -like "*Latest Python 3 Release*" } | Select-Object -first 1
    $pythonUrl3 = $pythonUrl2.href
    $pythonResponse2 = Invoke-WebRequest -Uri "https://www.python.org$pythonUrl3" -Method 'GET'
    $pythonUrl4 = $pythonResponse2.Links | where { $_.outerHTML -like "*Windows installer*" -and $_.outerHTML -like "*64-bit*" }
    $pythonDownloadUrl = $pythonUrl4.href
    $parts = $pythonDownloadUrl.Split("/")
    $target = $parts[ $parts.Length - 1 ]
    $tempFile = "$env:TEMP\$target"
    Message "install python3 from python.org"
    Invoke-WebRequest -Uri $pythonDownloadUrl -OutFile $tempFile
    Start-Process -wait $tempFile
    Message "install python3 from python.org - done"
}

function RustDependency() {
    $target = "rustup-init.exe"
    $tempFile = "$env:TEMP\$target"
    $rustInitUrl = "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/$target"
    Message "install rustc from rust-lang.org"
    Invoke-WebRequest -Uri $rustInitUrl -OutFile $tempFile
    Start-Process -wait $tempFile
    Message "install rustc from rust-lang.org - done"
}

function GoDependency() {
    $goUrl1 = "https://go.dev/dl/"
    $goResponse1 = Invoke-WebRequest -Uri $goUrl1 -Method 'GET'
    $goUrl2 = $goResponse1.Links | where { $_.outerHTML -like "*windows-amd64.msi*" } | Select-Object -first 1
    $goDownloadUrl = $goUrl2.href
    $parts = $goDownloadUrl.Split("/")
    $target = $parts[ $parts.Length - 1 ]
    $tempFile = "$env:TEMP\$target"
    Message "install go from go.dev"
    Invoke-WebRequest -Uri "https://go.dev$goDownloadUrl" -OutFile $tempFile
    Start-Process -wait $tempFile
    Message "install go from go.dev - done"
}

function NodejsDependency() {
    $nodeUrl1 = "https://nodejs.org/en/download/"
    $nodeResponse1 = Invoke-WebRequest -Uri $nodeUrl1 -Method 'GET'
    $nodeUrl2 = $nodeResponse1.Links | where { $_.outerHTML -like "*node*" -and $_.outerHTML -like "*x64.msi*" } | Select-Object -first 1
    $nodeDownloadUrl = $nodeUrl2.href
    $parts = $goDownloadUrl.Split("/")
    $target = $parts[ $parts.Length - 1 ]
    $tempFile = "$env:TEMP\$target"
    Message "install node from nodejs.org"
    Invoke-WebRequest -Uri $target -OutFile $tempFile
    Start-Process -wait $tempFile
    Message "install node from nodejs.org - done"
}

function CtagsDependency() {
    $org = "universal-ctags"
    $repo = "ctags-win32"
    $tag = GithubLatestReleaseTag -org $org -repo $repo
    $target = "ctags-${tag}-x64.zip"
    GithubInstaller -org $org -repo $repo -tag $tag -target $target
}

function DownloadAndInstallDependency([string]$option) {
    $parts = $option.Split("=")
    $name = $parts[ $parts.Length - 1]

    $runVim = $False
    $runNeovim = $False
    $runCmake = $False
    $runPython3 = $False
    $runRust = $False
    $runGo = $False
    $runNodejs = $False
    $runCtags = $False

    if ($name.ToLower().StartsWith("vim")) {
        $runVim = $True
    }
    elseif ($name.ToLower().StartsWith("neovim") -or $name.ToLower().StartsWith("nvim")) {
        $runNeovim = $True
    }
    elseif ($name.ToLower().StartsWith("cmake")) {
        $runCmake = $True
    }
    elseif ($name.ToLower().StartsWith("make")) {
        ErrorMessage "'make' is not support for now, exit..."
    }
    elseif ($name.ToLower().StartsWith("python")) {
        $runPython3 = $True
    }
    elseif ($name.ToLower().StartsWith("rust")) {
        $runRust = $True
    }
    elseif ($name.ToLower().StartsWith("go")) {
        $runGo = $True
    }
    elseif ($name.ToLower().StartsWith("node")) {
        $runNodejs = $True
    }
    elseif ($name.ToLower().StartsWith("ctags") -or $name.ToLower().StartsWith("universal-ctags")) {
        $runCtags = $True
    }
    elseif ($name.ToLower() -eq "all") {
        $runVim = $True
        $runNeovim = $True
        $runCmake = $True
        $runPython3 = $True
        $runRust = $True
        $runGo = $True
        $runNodejs = $True
        $runCtags = $True
    }
    else {
        UnknownOptionError
    }

    if ($runVim) {
        VimDependency
    }
    if ($runNeovim) {
        NeovimDependency 
    }
    if ($runCmake) {
        CmakeDependency
    }
    if ($runPython3) {
        Python3Dependency
    }
    if ($runRust) {
        RustDependency
    }
    if ($runGo) {
        GoDependency
    }
    if ($runNodejs) {
        NodejsDependency
    }
    if ($runCtags) {
        CtagsDependency
    }
}

function DownloadGuifontDependency([string]$option) {
    $parts = $option.Split("=")
    $name = $parts[ $parts.Length - 1]

    $org = "ryanoasis"
    $repo = "nerd-fonts"
    $target = "$name.zip"
    $tag = GithubLatestReleaseTag -org $org -repo $repo
    message "download $name($tag) nerd font from github"
    Invoke-WebRequest -Uri "https://github.com/$org/$repo/releases/download/$tag/$target" -OutFile $target
    message "download $name($tag) nerd font from github: $VIM_HOME\$target - done"
}

function CargoDependency() {
    Message "install modern rust commands with cargo"
    InstallOrSkip -command "cargo install ripgrep" -target "rg"
    InstallOrSkip -command "cargo install fd-find" -target "fd"
    # fzf preview syntax highlight
    InstallOrSkip -command "cargo install --locked bat" -target "bat"
}

function Pip3Dependency() {
    Message "install python packages with pip3"
    InstallOrSkip -command "pip3 install flake8" -target "flake8"
    InstallOrSkip -command "pip3 install pylint" -target "pylint"
    InstallOrSkip -command "pip3 install black" -target "black"
    pip3 install neovim pynvim cmakelang click
}

function NpmDependency() {
    Message "install node packages with npm"
    InstallOrSkip -command "npm install -g yarn" -target "yarn"
    InstallOrSkip -command "npm install -g prettier" -target "prettier"
    npm install -g neovim
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

$argsLength = $args.Length

for ($i = 0; $i -lt $argsLength; $i++) {
    $a = $args[ $i ];
    if ($a.StartsWith("-h") -or $a.StartsWith("--help")) {
        ShowHelp
        exit 0
    }
    elseif ($a.StartsWith("--depends=")) {
        DownloadAndInstallDependency $a
        exit 0
    }
    elseif ($a.StartsWith("--nerdfont=")) {
        DownloadGuifontDependency $a
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
    # dependency
    Message "install dependencies for windows"
    CargoDependency
    Pip3Dependency
    NpmDependency

    # vim settings
    Message "install settings for vim"
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
