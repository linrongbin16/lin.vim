#Requires -RunAsAdministrator

param (
    [Parameter(Mandatory = $False)][switch]$Help = $False,
    [Parameter(Mandatory = $False)][switch]$Basic = $False,
    [Parameter(Mandatory = $False)][switch]$Limit = $False,
    [Parameter(Mandatory = $False)][switch]$WithoutLanguageServer = $False,
    [Parameter(Mandatory = $False)][switch]$WithoutHighlight = $False,
    [Parameter(Mandatory = $False)][switch]$WithoutColor = $False,
    [Parameter(Mandatory = $False)][String]$StaticColor = "",
    [Parameter(Mandatory = $False)][switch]$OnlyVim = $False,
    [Parameter(Mandatory = $False)][switch]$OnlyNeovim = $False
)

# Debug
# Set-PSDebug -Trace 1

$VIM_HOME = "$env:USERPROFILE\.vim"
$INSTALL_HOME = "$VIM_HOME\install"
$APPDATA_LOCAL_HOME = "$env:USERPROFILE\AppData\Local"
$NVIM_HOME = "$APPDATA_LOCAL_HOME\nvim"
$TEMPLATE_HOME = "$VIM_HOME\template"

$global:MODE_NAME = "full" # default mode
$global:OPT_FULL = $True
$global:OPT_BASIC = $False
$global:OPT_WITHOUT_LANGUAGE_SERVER = $False
$global:OPT_WITHOUT_HIGHLIGHT = $False
$global:OPT_WITHOUT_COLOR = $False
$global:OPT_STATIC_COLOR = ""
$global:OPT_ONLY_VIM = $False
$global:OPT_ONLY_NEOVIM = $False

$PLUGIN_FILE = "$VIM_HOME\plugin.vim"
$SETTING_FILE = "$VIM_HOME\setting.vim"

# common utils

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
    }
    else {
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
        $now = Get-Date -Format "yyyy-MM-dd.HH-mm-ss.fffffff"
        $backup = -join ($target, ".", $now)
        Rename-Item $target $backup
        Message "backup '$target' to '$backup'"
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

function ResetFile() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$target
    )
    Write-Output '' >$target
}

function IsEmptyString() {
    [CmdletBinding()]
    Param
    (
        [String]$value
    )
    Return $value -notmatch '\S'
}

# third party dependency

function RustDependency() {
    Message "install modern rust commands with cargo"
    InstallOrSkip -command "cargo install ripgrep" -target "rg"
    InstallOrSkip -command "cargo install fd-find" -target "fd"

    if (-not $global:OPT_WITHOUT_COLOR) {
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

# template

function BeginInstallPlugin() {
    Get-Content -Path "$TEMPLATE_HOME\plugin\header.vim" | Add-Content -Path $PLUGIN_FILE
}

function EndInstallPlugin() {
    Get-Content -Path "$TEMPLATE_HOME\plugin\footer.vim" | Add-Content -Path $PLUGIN_FILE
}

function InstallHighlightPlugin() {
    Get-Content -Path "$TEMPLATE_HOME\plugin\highlight.vim" | Add-Content -Path $PLUGIN_FILE
}

function InstallColorPlugin() {
    Get-Content -Path "$TEMPLATE_HOME\plugin\color.vim" | Add-Content -Path $PLUGIN_FILE
}

function InstallMarkdownPlugin() {
    Get-Content -Path "$TEMPLATE_HOME\plugin\markdown.vim" | Add-Content -Path $PLUGIN_FILE
}

function InstallCommonPlugin() {
    Get-Content -Path "$TEMPLATE_HOME\plugin\common.vim" | Add-Content -Path $PLUGIN_FILE
}

function BeginInstallCocGlobalExtensionSetting() {
    Add-Content -Path $SETTING_FILE -Value ""
    Add-Content -Path $SETTING_FILE -Value '" Coc global extensions'
    Add-Content -Path $SETTING_FILE -Value "let g:coc_global_extensions = [" -NoNewline
}

function EndInstallCocGlobalExtensionSetting() {
    Add-Content -Path $SETTING_FILE -Value "]"
}

function InstallRandomColorSchemeSetting() {
    Get-Content -Path "$TEMPLATE_HOME\setting\random-colorscheme.vim" | Add-Content -Path $SETTING_FILE
}

function AddCocGlobalExtensionSetting() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$extension
    )
    Add-Content -Path $SETTING_FILE -Value "'$extension', " -NoNewline
}

function InstallStaticColorSchemeSetting() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$color
    )
    Add-Content -Path $SETTING_FILE -Value ""
    Add-Content -Path $SETTING_FILE -Value '""" Static colorscheme'
    Add-Content -Path $SETTING_FILE -Value "colorscheme $color"
}

function InstallCommonSetting() {
    Get-Content -Path "$TEMPLATE_HOME\setting\common.vim" | Add-Content -Path $SETTING_FILE
}

function InstallPluginTemplate() {
    ResetFile $PLUGIN_FILE
    BeginInstallPlugin
    if (-not $global:OPT_WITHOUT_COLOR) {
        # enable color feature
        InstallColorPlugin
    }
    if (-not $global:OPT_WITHOUT_HIGHLIGHT) {
        # enable highlight feature
        InstallHighlightPlugin
    }
    if (-not $global:OPT_WITHOUT_LANGUAGE_SERVER) {
        # enable markdown feature
        InstallMarkdownPlugin
    }
    InstallCommonPlugin
    EndInstallPlugin
}

function InstallSettingTemplate() {
    ResetFile $SETTING_FILE

    Copy-Item $TEMPLATE_HOME\coc-settings-template.json -Destination $VIM_HOME\coc-settings.json
    Copy-Item $TEMPLATE_HOME\coc-settings-template.json -Destination $env:USERPROFILE\vimfiles\coc-settings.json

    BeginInstallCocGlobalExtensionSetting
    AddCocGlobalExtensionSetting 'coc-yank'
    AddCocGlobalExtensionSetting 'coc-lists'
    if (-not $global:OPT_WITHOUT_LANGUAGE_SERVER) {
        AddCocGlobalExtensionSetting 'coc-snippets'
        AddCocGlobalExtensionSetting 'coc-html'
        AddCocGlobalExtensionSetting 'coc-xml'
        AddCocGlobalExtensionSetting 'coc-clangd'
        AddCocGlobalExtensionSetting 'coc-cmake'
        AddCocGlobalExtensionSetting 'coc-pyright'
        AddCocGlobalExtensionSetting 'coc-rust-analyzer'
        AddCocGlobalExtensionSetting 'coc-go'
        AddCocGlobalExtensionSetting 'coc-json'
        AddCocGlobalExtensionSetting 'coc-tsserver'
        AddCocGlobalExtensionSetting 'coc-css'
        AddCocGlobalExtensionSetting '@yaegassy/coc-volar'
        AddCocGlobalExtensionSetting 'coc-eslint'
        AddCocGlobalExtensionSetting 'coc-prettier'
        AddCocGlobalExtensionSetting 'coc-powershell'
    }
    EndInstallCocGlobalExtensionSetting

    if (-not (IsEmptyString $global:OPT_STATIC_COLOR)) {
        InstallStaticColorSchemeSetting $global:OPT_STATIC_COLOR
    }
    elseif (-not $global:OPT_WITHOUT_COLOR) {
        InstallRandomColorSchemeSetting
    }

    InstallCommonSetting
}

function InstallTemplate() {
    Message "install configurations"
    # Copy-Item $TEMPLATE_HOME\plugin-template.vim -Destination $VIM_HOME\plugin.vim
    # Copy-Item $TEMPLATE_HOME\coc-settings-template.json -Destination $VIM_HOME\coc-settings.json
    # Copy-Item $TEMPLATE_HOME\setting-template.vim -Destination $VIM_HOME\setting.vim

    InstallPluginTemplate
    InstallSettingTemplate
}

# vim

function InstallVim() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$vimrc
    )

    if ($global:OPT_ONLY_NEOVIM) {
        Message "skip install .vimrc and plugins for vim"
        Return
    }

    TryBackup "$env:USERPROFILE\_vimrc"
    Message "install .vimrc for vim"
    cmd /c mklink $env:USERPROFILE\_vimrc $vimrc

    Message "install vim plugins"
    cmd /c gvim -E -c "PlugInstall" -c "qall" /wait
}

# neovim

function InstallNeovim() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$nvimHome,
        [Parameter(Mandatory = $True)][String]$nvimInit
    )

    if ($global:OPT_ONLY_VIM) {
        Message "skip install $APPDATA_LOCAL_HOME/nvim, $APPDATA_LOCAL_HOME/nvim/init.vim and plugins for neovim"
        Return
    }

    Message "install $APPDATA_LOCAL_HOME/nvim and $APPDATA_LOCAL_HOME/nvim/init.vim for neovim"
    TryDelete "$NVIM_HOME\init.vim"
    TryBackup "$NVIM_HOME"
    cmd /c mklink $APPDATA_LOCAL_HOME\nvim $nvimHome
    cmd /c mklink $APPDATA_LOCAL_HOME\nvim\init.vim $nvimInit

    Message "install neovim plugins"
    cmd /c nvim -E -c "PlugInstall" -c "qall" /wait
}

function BasicInstaller() {
    InstallVim "$env:USERPROFILE\.vim\setting\linrongbin16\standalone.vim"
    InstallNeovim -nvimHome "$env:USERPROFILE\.vim" -nvimInit "$env:USERPROFILE\.vim\setting\linrongbin16\standalone.vim"
}

function ShowHelp() {
    Get-Content -Path "$INSTALL_HOME\help_message.txt" | Write-Host
    Write-Host @"
Notice:
In full mode, you could use '-WithoutXXX' options to disable some specific feature.
The '-WithoutLanguageServer -WithoutHighlight -WithoutColor' option is equivalent to '-Limit'.
The '-WithoutXXX' option cannot specify with '-Basic' at the same time.
The '-WithoutColor' option cannot specify with '-StaticColor' at the same time.

-Help                           Show help message.
-Basic                          Basic mode.
-Limit                          Limit mode.

-WithoutLanguageServer          Disable coc language servers.
-WithoutHighlight               Disable extra highlights.
-WithoutColor                   Disable extra colors and colorschemes.

-StaticColor [name]             Use static colorscheme, not random ones.
-OnlyVim                        Only support vim.
-OnlyNeovim                     Only support neovim.
"@
}

function ValidateOptions() {
    $Options = @{}
    $Options.Add("-Help".ToLower(), $True)
    $Options.Add("-Basic".ToLower(), $True)
    $Options.Add("-Limit".ToLower(), $True)
    $Options.Add("-WithoutLanguageServer".ToLower(), $True)
    $Options.Add("-WithoutHighlight".ToLower(), $True)
    $Options.Add("-WithoutColor".ToLower(), $True)
    $Options.Add("-OnlyVim".ToLower(), $True)
    $Options.Add("-OnlyNeovim".ToLower(), $True)
    $i = 0
    $argsLength = $args.Length
    while ($i -lt $args.Length) {
        $opt = $args[ $i ];
        if ($Options.Contains($opt.ToLower())) {
            $i++
        }
        elseif ($opt.ToLower() -eq "-StaticColor".ToLower()) {
            $i++
            if ($i -ge $args.Length) {
                Return $False
            }
            $i++
        }
        else {
            Return $False
        }
    }
    Return $True
}

function ParseOptions() {
    if ($Help) {
        ShowHelp
        Exit
    }
    if (-not (ValidateOptions)) {
        Message "unknown options! please try .\install.ps1 -Help for more information."
        Exit
    }
    if (-not (IsEmptyString $StaticColor)) {
        if ($WithoutColor) {
            Message "error! cannot use -StaticColor along with -WithoutColor"
            Exit
        }
    }
    if ($Basic) {
        if ($Limit) {
            Message "error! cannot use -Basic along with -Limit"
            Exit
        }
        $global:MODE_NAME = "basic"
        $global:OPT_BASIC = $True
        $global:OPT_FULL = $False
    }
    if ($Limit) {
        if ($Basic) {
            Message "error! cannot use -Limit along with -Basic"
            Exit
        }
        $global:MODE_NAME = "limit"
        $global:OPT_BASIC = $False
        $global:OPT_FULL = $True
        $global:OPT_WITHOUT_LANGUAGE_SERVER = $True
        $global:OPT_WITHOUT_HIGHLIGHT = $True
        $global:OPT_WITHOUT_COLOR = $True
    }
    if ($WithoutLanguageServer) {
        $global:OPT_WITHOUT_LANGUAGE_SERVER = $True
    }
    if ($WithoutHighlight) {
        $global:OPT_WITHOUT_HIGHLIGHT = $True
    }
    if ($WithoutColor) {
        $global:OPT_WITHOUT_COLOR = $True
    }
    $global:OPT_STATIC_COLOR = $StaticColor
    $global:OPT_ONLY_VIM = $OnlyVim
    $global:OPT_ONLY_NEOVIM = $OnlyNeovim
}

function Main() {
    Message "install with $global:MODE_NAME mode"

    if ($global:OPT_BASIC) {
        BasicInstaller
    }
    else {
        # install dependencies
        Message "install dependencies for windows"
        RustDependency
        Pip3Dependency
        NpmDependency

        # install files
        InstallTemplate
        InstallVim "$env:USERPROFILE\.vim\lin.vim"
        InstallNeovim -nvimHome "$env:USERPROFILE\.vim" -nvimInit "$env:USERPROFILE\.vim\lin.vim"
    }

    Message "install with $global:MODE_NAME mode - done"
}

ParseOptions

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

Main
