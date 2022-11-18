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

# third party dependency

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

function InstallDependency() {
    Message "install dependencies for windows"
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
$argsLength = $args.Length
$optStaticColor = $False
$optDisableColor = $False
for ($i = 0; $i -lt $argsLength; $i++) {
    $a = $args[ $i ];
    if (($a -eq "-h") -or ($a -eq "--help")) {
        ShowHelp
        exit 0
    }
    elseif (($a -eq "-b") -or ($a -eq "--basic")) {
        $MODE_NAME = "basic"
        $OPT_BASIC = $True
    }
    elseif (($a -eq "-l") -or ($a -eq "--basic")) {
        $MODE_NAME = "limit"
    }
    elseif (($a -eq "-s") -or ($a -eq "--static-color")) {
        $optStaticColor = $True
        $j = $i + 1
        if ($j -ge $argsLength) {
            ErrorMessage "option '$a' requires an argument"
            exit 1
        }
        $nextArg = $args[ $j ];
        if ( "$nextArg".Substring(0, 1) -eq "-") {
            ErrorMessage "option '$a' requires an argument"
            exit 1
        }
        if ($optStaticColor -and $optDisableColor) {
            ErrorMessage "cannot use '-s' or '--static-color' along with '--disable-color'"
            exit 1
        }
    }
    elseif ($a -eq "--disable-color") {
        $optDisableColor = $True
        if ($optStaticColor -and $optDisableColor) {
            ErrorMessage "cannot use '-s' or '--static-color' along with '--disable-color'"
            exit 1
        }
    }
    elseif ($a -eq "--disable-plugin") {
        $j = $i + 1
        if ($j -ge $argsLength) {
            ErrorMessage "option '$a' requires an argument"
            exit 1
        }
        $nextArg = $args[ $j ];
        if ( "$nextArg".Substring(0, 1) -eq "-") {
            ErrorMessage "option '$a' requires an argument"
            exit 1
        }
    }
    elseif (($a -eq "--disable-highlight") -or ($a -eq "--disable-language") -or ($a -eq "--disable-editing") -or ($a -eq "--disable-ctrl-keys")) {
        # Nothing here
    }
    elseif (($a -eq "--disable-vim")) {
        $OPT_DISABLE_VIM = $True
    }
    elseif (($a -eq "--disable-neovim")) {
        $OPT_DISABLE_NEOVIM = $True
    }
    else {
        ErrorMessage "unknown option, please try --help for help message."
        exit 1
    }
}

Message "install with $MODE_NAME mode"

if ($OPT_BASIC) {
    InstallBasic
}
else {
    InstallDependency
    Message "install configurations for vim"

    python3 $VIM_HOME\generator.py "$args"
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
