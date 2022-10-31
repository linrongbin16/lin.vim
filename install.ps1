param (
    [Parameter(HelpMessage="Show help message")][switch]$Help = $False,
    [Parameter(HelpMessage="Basic mode")][switch]$Basic = $False,
    [Parameter(HelpMessage="Limit mode")][switch]$Limit = $False,
    [Parameter(HelpMessage="Disable c/c++/cmake support")][switch]$WithoutCxx = $False,
    [Parameter(HelpMessage="Disable python support")][switch]$WithoutPython = $False,
    [Parameter(HelpMessage="Disable markdown support")][switch]$WithoutMarkdown = $False,
    [Parameter(HelpMessage="Disable json support")][switch]$WithoutJson = $False,
    [Parameter(HelpMessage="Disable javascript support")][switch]$WithoutJavascript = $False,
    [Parameter(HelpMessage="Disable powershell support")][switch]$WithoutPowershell = $False,
    [Parameter(HelpMessage="Disable bash support")][switch]$WithoutBash = $False,
    [Parameter(HelpMessage="Disable extra highlights")][switch]$WithoutHighlight = $False,
    [Parameter(HelpMessage="Disable extra colors")][switch]$WithoutColor = $False,
    [Parameter(HelpMessage="Disable git support")][switch]$WithoutGit = $False
)

$VIM_HOME="$env:USERPROFILE\.vim"
$INSTALL_HOME="$VIM_HOME\install"
$APPDATA_LOCAL_HOME="$env:USERPROFILE\AppData\Local"
$NVIM_HOME="$APPDATA_LOCAL_HOME\nvim"
$TEMPLATE_HOME="$VIM_HOME\template"

. $INSTALL_HOME\PluginInstaller.ps1
. $INSTALL_HOME\SettingInstaller.ps1

$OPT_FULL=$True # default mode
$MODE_NAME="full"

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

    if ($WithoutHighlight) {
        # fzf preview syntax highlight
        InstallOrSkip -command "cargo install --locked bat" -target "bat"
    }
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
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$vimrc
    )
    Message "install .vimrc for vim"
    TryBackup "$env:USERPROFILE\_vimrc"
    cmd /c mklink $env:USERPROFILE\_vimrc $vimrc
}

function InstallNvimInit() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$nvimHome,
        [Parameter(Mandatory = $True)][String]$nvimInit
    )
    Message "install $APPDATA_LOCAL_HOME/nvim and $APPDATA_LOCAL_HOME/nvim/init.vim for neovim"
    TryBackup "$NVIM_HOME\init.vim"
    TryBackup "$NVIM_HOME"
    cmd /c mklink $APPDATA_LOCAL_HOME\nvim $nvimHome
    cmd /c mklink $APPDATA_LOCAL_HOME\nvim\init.vim $nvimInit
}

function InstallVimPlugin() {
    Message "install vim plugins"
    gvim -E -c "PlugInstall" -c "qall"
}

function InstallNvimPlugin() {
    Message "install neovim plugins"
    nvim -E -c "PlugInstall" -c "qall"
}

function InstallBasic() {
    InstallVimrc "$env:USERPROFILE\.vim\setting\linrongbin16\standalone.vim"
    InstallNvimInit -nvimHome "$env:USERPROFILE\.vim" -nvimInit "$env:USERPROFILE\.vim\setting\linrongbin16\standalone.vim"
}

function ShowHelp() {
    Write-Host @"
Install in one-line command with 3 modes: basic, limit and full.

Basic mode only install pure vim script settings, no vim plugins or any other third party softwares.
It is for production environment, which lacks of software sources or user authentication.

Limit mode installs limited features, no extra highlights, colors or all other language supports.
It is for better performance on some old devices, which lacks of CPU, memory or graphics.

Full mode is default mode, enable all features.
It is for best user experience, while consumes more CPU, memory and graphics.
In full mode you could use `--without-xxx` options to disable some specific feature.

Notice: 
The \`-WithoutAllLanguage -WithoutHighlight -WithoutColor\` option is equivalent to \`-Limit\`.
The \`-WithoutXXX\` (except for \`-WithoutGit\` \`-WithoutVim\` \`-WithoutNeovim\`) options cannot specify with \`-Basic\` or \`-Limit\` options at the same time.
The \`-WithoutVim\` \`-WithoutNeovim\` cannot specify at same time.

-Help                           Show help message.
-Basic                          Basic mode.
-Limit                          Limit mode.

-WithoutCxx                     Disable c/c++/cmake support.
-WithoutPython                  Disable python support.
-WithoutMarkdown                Disable markdown support.
-WithoutJson                    Disable json support.
-WithoutJavascript              Disable javascript support.
-WithoutPowershell              Disable powershell support.
-WithoutBash                    Disable linux bash support.
-WithoutAllLanguage             Disable all language supports above.

-WithoutHighlight               Disable extra highlights such as cursor word highlight, fzf preview syntax highlight, etc.
-WithoutColor                   Disable extra colors such as RGBs, random colorschemes, etc.

-WithoutGit                     Disable git support.
-WithoutVim                     Disable vim support.
-WithoutNeovim                  Disable neovim support.
"@
}

function CheckNoBasicOption() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$inputOption
    )
    if ($Basic) {
        Message "error! cannot use $inputOption along with -Basic"
        Exit
    }
}

function CheckNoLimitOption() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$inputOption
    )
    if ($Limit) {
        Message "error! cannot use $inputOption along with -Limit"
        Exit
    }
}

function ParseOptions() {
    if ($Help) {
        ShowHelp;
        Exit;
    }
    if ($Basic) {
        CheckNoLimitOption "-Basic"
        $OPT_FULL=$False
        $MODE_NAME="basic"
    }
    if ($Limit) {
        CheckNoBasicOption "-Limit"
        $OPT_FULL=$True
        $MODE_NAME="limit"
    }
    if ($WithoutCxx) {
        CheckNoBasicOption "-WithoutCxx"
        CheckNoLimitOption "-WithoutCxx"
    }
    if ($WithoutPython) {
        CheckNoBasicOption "-WithoutPython"
        CheckNoLimitOption "-WithoutPython"
    }
    if ($WithoutMarkdown) {
        CheckNoBasicOption "-WithoutMarkdown"
        CheckNoLimitOption "-WithoutMarkdown"
    }
    if ($WithoutJson) {
        CheckNoBasicOption "-WithoutJson"
        CheckNoLimitOption "-WithoutJson"
    }
    if ($WithoutJavascript) {
        CheckNoBasicOption "-WithoutJavascript"
        CheckNoLimitOption "-WithoutJavascript"
    }
    if ($WithoutPowershell) {
        CheckNoBasicOption "-WithoutPowershell"
        CheckNoLimitOption "-WithoutPowershell"
    }
    if ($WithoutBash) {
        CheckNoBasicOption "-WithoutBash"
        CheckNoLimitOption "-WithoutBash"
    }
    if ($WithoutHighlight) {
        CheckNoBasicOption "-WithoutHighlight"
        CheckNoLimitOption "-WithoutHighlight"
    }
    if ($WithoutColor) {
        CheckNoBasicOption "-WithoutColor"
        CheckNoLimitOption "-WithoutColor"
    }
    if ($WithoutGit) {
        CheckNoBasicOption "-WithoutGit"
    }
}

function Main() {
    Message "install with mode - $MODE_NAME"

    if ($Basic) {
        InstallBasic
        Return;
    }

    # install dependencies
    Message "install dependencies for windows"
    RustDependency
    Pip3Dependency
    NpmDependency

    # install files
    InstallTemplates
    InstallVimrc "$env:USERPROFILE\.vim\lin.vim"
    InstallNvimInit -nvimHome "$env:USERPROFILE\.vim" -nvimInit "$env:USERPROFILE\.vim\lin.vim"

    # install plugins
    InstallNvimPlugin
    InstallVimPlugin
}

ParseOptions

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
    Start-Process powershell "& '$installer' $args" -Verb RunAs

    # Exit from the current process
    Exit;
}

Main
