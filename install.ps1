$VIM_HOME="$env:UserProfile\.vim"
$INSTALL_HOME="$VIM_HOME\install"
$APPDATA_LOCAL_HOME="$env:UserProfile\AppData\Local"
$NVIM_HOME="$APPDATA_LOCAL_HOME\nvim"
$TEMPLATE_HOME="$VIM_HOME\template"

$OPT_BASIC=$False
$OPT_FULL=$True # default mode
$OPT_WITHOUT_CXX=$False
$OPT_WITHOUT_PYTHON=$False
$OPT_WITHOUT_MARKDOWN=$False
$OPT_WITHOUT_JSON=$False
$OPT_WITHOUT_JAVASCRIPT=$False
$OPT_WITHOUT_POWERSHELL=$False
$OPT_WITHOUT_BASH=$False
$OPT_WITHOUT_HIGHLIGHT=$False
$OPT_WITHOUT_COLOR=$False
$OPT_WITHOUT_GIT=$False

function Message() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$message
    )
    Write-Host "[lin.vim] - $message"
}

function InstallOrSkip() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$command,
        [Parameter(Mandatory = $True)][String]$target
    )
    if (Get-Command -Name $target -ErrorAction SilentlyContinue) {
        Message "'${target}' already exist, skip..."
    } else {
        Message "install '${target}' with command: '${command}'"
        Invoke-Expression $command
    }
}

function TryBackup() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$target
    )
    if (Test-Path $target) {
        $now=Get-Date -Format "yyyy-MM-dd.HH-mm-ss.fffffff"
        $backup=-join($target, ".", $now)
        try {
            Copy-Item $target -Destination $backup
            (Get-Item $target).Delete()
            Message "backup '$target' to '$backup'"
        } catch {
            Message "error! failed to backup '$target' to '$backup', exception:$_"
        }
    }
}

function TryDelete() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$target
    )
    if (Test-Path $target) {
        Message "delete '$target'"
        (Get-Item $target).Delete()
    }
}

function RustDependency() {
    Message "install modern rust commands with cargo"
    InstallOrSkip -command "cargo install ripgrep" -target "rg"
    InstallOrSkip -command "cargo install fd-find" -target "fd"
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

function InstallTemplates() {
    Message "install configurations from templates"
    Copy-Item $TEMPLATE_HOME\plugin-template.vim -Destination $VIM_HOME\plugin.vim
    Copy-Item $TEMPLATE_HOME\coc-settings-template.json -Destination $VIM_HOME\coc-settings.json
    Copy-Item $TEMPLATE_HOME\setting-template.vim -Destination $VIM_HOME\setting.vim
}

function InstallVimrc() {
    Message "install .vimrc for vim"
    TryBackup "$env:UserProfile\_vimrc"
    cmd /c mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\lin.vim
}

function InstallNvimInit() {
    Message "install $APPDATA_LOCAL_HOME/nvim and $APPDATA_LOCAL_HOME/nvim/init.vim for neovim"
    TryBackup "$NVIM_HOME\init.vim"
    TryBackup "$NVIM_HOME"
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim %USERPROFILE%\.vim
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\.vim\lin.vim
}

function InstallVimPlugin() {
    Message "install vim plugins"
    gvim -E -c "PlugInstall" -c "qall"
}

function InstallNvimPlugin() {
    Message "install neovim plugins"
    nvim -E -c "PlugInstall" -c "qall"
}

function ShowHelp() {
    Get-Content $INSTALL_HOME/help_message.txt | Write-Host
}

function CheckNoBasicOption() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][Boolean]$hasBasicOption,
        [Parameter(Mandatory = $True)][String]$inputOption
    )
    if ($hasBasicOption) {
        Message "error! cannot use $inputOption along with -basic $True"
        Exit
    }
}

function CheckNoLimitOption() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][Boolean]$hasLimitOption,
        [Parameter(Mandatory = $True)][String]$inputOption
    )
    if ($hasLimitOption) {
        Message "error! cannot use $inputOption along with -limit $True"
        Exit
    }
}

function ParseOptions() {
    $help=$False
    $hasBasicOption=$False
    $hasLimitOption=$False
    for ($i = 0; $i -lt $args.Count; $i++) {
        $opt = $args[ $i ]
        if ($opt -eq "-h" || $opt -eq "--help") {
            $help=$True
                break
        } elseif ($opt -eq "-b" || $opt -eq "--basic") {
            $hasBasicOption=$true
            CheckNoLimitOption $hasLimitOption $opt
            $OPT_BASIC=$True
            $OPT_FULL=$False
        } elseif ($opt -eq "-l" || $opt -eq "--limit") {
            $hasLimitOption=$true
            CheckNoBasicOption $hasBasicOption $opt
            $OPT_BASIC=$False
            $OPT_FULL=$True
            $OPT_WITHOUT_CXX=$True
            $OPT_WITHOUT_PYTHON=$True
            $OPT_WITHOUT_MARKDOWN=$True
            $OPT_WITHOUT_JSON=$True
            $OPT_WITHOUT_JAVASCRIPT=$True
            $OPT_WITHOUT_POWERSHELL=$True
            $OPT_WITHOUT_BASH=$True
            $OPT_WITHOUT_HIGHLIGHT=$True
            $OPT_WITHOUT_COLOR=$True
        } else {
            Message "unknown options! please try .\install.ps1 --help for more information"
            Exit
        }
    }
    if ($help) {
        ShowHelp
        Exit
    }
}

function Main() {
    Message "install dependencies for windows"

    # install dependencies
    RustDependency
    Pip3Dependency
    NpmDependency

    # install files
    InstallTemplates
    InstallVimrc
    InstallNvimInit

    # install plugins
    InstallNvimPlugin
    InstallVimPlugin
}

# Get the ID and security principal of the current user account
$currentID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$currentPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentID);
# Get the security principal for the administrator role
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;

# If we are not running as an administrator, relaunch as administrator
if (!($currentPrincipal.IsInRole($adminRole)))
{
    # Create a new process that run as administrator
    $installer=$script:MyInvocation.MyCommand.Path
    Start-Process powershell "& '$installer' @args" -Verb RunAs

    # Exit from the current process
    Exit;
}

Main
