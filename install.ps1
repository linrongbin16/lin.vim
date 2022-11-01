 #Requires -RunAsAdministrator

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
    [Parameter(HelpMessage="Disable all language support")][switch]$WithoutAllLanguage = $False,
    [Parameter(HelpMessage="Disable extra highlights")][switch]$WithoutHighlight = $False,
    [Parameter(HelpMessage="Disable extra colors")][switch]$WithoutColor = $False,
    [Parameter(HelpMessage="Only one static colorscheme")][String]$StaticColor= "",
    [Parameter(HelpMessage="Only support vim")][switch]$OnlyVim = $False,
    [Parameter(HelpMessage="Only support neovim")][switch]$OnlyNeovim = $False
)

Set-PSDebug -Trace 1

$VIM_HOME="$env:USERPROFILE\.vim"
$INSTALL_HOME="$VIM_HOME\install"
$APPDATA_LOCAL_HOME="$env:USERPROFILE\AppData\Local"
$NVIM_HOME="$APPDATA_LOCAL_HOME\nvim"
$TEMPLATE_HOME="$VIM_HOME\template"

$OPT_FULL=$True # default mode
$MODE_NAME="full"

$PLUGIN_FILE="$VIM_HOME\plugin.vim"
$SETTING_FILE="$VIM_HOME\setting.vim"
$COLORSCHEMES=@('darkblue', 'solarized8', 'base16-default-dark', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'onedark', 'rigel', 'sonokai', 'everforest', 'gruvbox-material', 'edge', 'material')

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
            Rename-Item $target $backup
            Message "backup '$target' to '$backup'"
        } catch {
            try {
                Copy-Item $target -Destination $backup -Recurse
                (Get-Item $target).Delete()
                Message "backup '$target' to '$backup'"
            } catch {
                Message "error! failed to backup '$target' to '$backup', exception:$_"
            }
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

function ClearFile() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$target
    )
    if (Test-Path $target) {
        Clear-Content -Path $target
    } else {
        New-Item -Path $target
    }
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

function InstallStaticColorSchemeSettings() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$color
    )
    Add-Content -Path $SETTING_FILE -Value ""
    Add-Content -Path $SETTING_FILE -Value '""" Static colorscheme'
    Add-Content -Path $SETTING_FILE -Value "colorscheme $color"
}

function InstallCommonSettings() {
    Get-Content -Path "$TEMPLATE_HOME\setting\common.vim" | Add-Content -Path $SETTING_FILE
}

function InstallPluginTemplate() {
    ClearFile $PLUGIN_FILE
    BeginInstallPlugin
    if (-not $WithoutColor) {
        # enable color feature
        InstallColorPlugin
    }
    if (-not $WithoutHighlight) {
        # enable highlight feature
        InstallHighlightPlugin
    }
    if (-not $WithoutMarkdown) {
        # enable markdown feature
        InstallMarkdownPlugin
    }
    InstallCommonPlugin
    EndInstallPlugin
}

function InstallSettingTemplate() {
    ClearFile $SETTING_FILE

    Copy-Item $TEMPLATE_HOME\coc-settings-template.json -Destination $VIM_HOME\coc-settings.json

    BeginInstallCocGlobalExtensionSetting
    AddCocGlobalExtensionSetting 'coc-snippets'
    AddCocGlobalExtensionSetting 'coc-yank'
    AddCocGlobalExtensionSetting 'coc-lists'
    AddCocGlobalExtensionSetting 'coc-html'
    AddCocGlobalExtensionSetting 'coc-xml'
    if (-not $WithoutCxx) {
        AddCocGlobalExtensionSetting 'coc-clangd'
        AddCocGlobalExtensionSetting 'coc-cmake'
    }
    if (-not $WithoutPython) {
        AddCocGlobalExtensionSetting 'coc-pyright'
    }
    if (-not $WithoutJson) {
        AddCocGlobalExtensionSetting 'coc-json'
    }
    if (-not $WithoutJavascript) {
        AddCocGlobalExtensionSetting 'coc-tsserver'
        AddCocGlobalExtensionSetting 'coc-css'
        AddCocGlobalExtensionSetting '@yaegassy/coc-volar'
        AddCocGlobalExtensionSetting 'coc-eslint'
        AddCocGlobalExtensionSetting 'coc-prettier'
    }
    if (-not $WithoutPowershell) {
        AddCocGlobalExtensionSetting 'coc-powershell'
    }
    if (-not $WithoutBash) {
        AddCocGlobalExtensionSetting 'coc-sh'
    }
    EndInstallCocGlobalExtensionSetting

    if (-not (IsEmptyString $StaticColor)) {
        InstallStaticColorSchemeSettings $StaticColor
    } elseif (-not $WithoutColor) {
        InstallRandomColorSchemeSetting
    }

    InstallCommonSettings
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

    if ($OnlyNeovim) {
        Message "skip install .vimrc and plugins for vim"
        Return
    }

    TryBackup "$env:USERPROFILE\_vimrc"
    Message "install .vimrc for vim"
    cmd /c mklink $env:USERPROFILE\_vimrc $vimrc

    Message "install vim plugins"
    gvim -E -c "PlugInstall" -c "qall"
}

# neovim

function InstallNeovim() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True)][String]$nvimHome,
        [Parameter(Mandatory = $True)][String]$nvimInit
    )

    if ($OnlyVim) {
        Message "skip install $APPDATA_LOCAL_HOME/nvim, $APPDATA_LOCAL_HOME/nvim/init.vim and plugins for neovim"
        Return
    }

    Message "install $APPDATA_LOCAL_HOME/nvim and $APPDATA_LOCAL_HOME/nvim/init.vim for neovim"
    TryBackup "$NVIM_HOME\init.vim"
    TryBackup "$NVIM_HOME"
    cmd /c mklink $APPDATA_LOCAL_HOME\nvim $nvimHome
    cmd /c mklink $APPDATA_LOCAL_HOME\nvim\init.vim $nvimInit

    Message "install neovim plugins"
    nvim -E -c "PlugInstall" -c "qall"
}

function BasicInstaller() {
    InstallVim "$env:USERPROFILE\.vim\setting\linrongbin16\standalone.vim"
    InstallNeovim -nvimHome "$env:USERPROFILE\.vim" -nvimInit "$env:USERPROFILE\.vim\setting\linrongbin16\standalone.vim"
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
In full mode you could use `-WithoutXXX` options to disable some specific feature.

Notice:
The \`-WithoutAllLanguage -WithoutHighlight -WithoutColor\` option is equivalent to \`-Limit\`.
The \`-WithoutXXX\` options cannot specify with \`-Basic\` or \`-Limit\` options at the same time.

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

-StaticColor [name]             Use static colorscheme, not random colorschemes.
                                Candidates are: $COLORSCHEMES.
-OnlyVim                        Only support vim.
-OnlyNeovim                     Only support neovim.
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

function ValidateOptions() {
    $Options = @{}
    $Options.Add("-Help".ToLower(), $True)
    $Options.Add("-Basic".ToLower(), $True)
    $Options.Add("-Limit".ToLower(), $True)
    $Options.Add("-WithoutCxx".ToLower(), $True)
    $Options.Add("-WithoutPython".ToLower(), $True)
    $Options.Add("-WithoutMarkdown".ToLower(), $True)
    $Options.Add("-WithoutJson".ToLower(), $True)
    $Options.Add("-WithoutJavascript".ToLower(), $True)
    $Options.Add("-WithoutPowershell".ToLower(), $True)
    $Options.Add("-WithoutBash".ToLower(), $True)
    $Options.Add("-WithoutAllLanguage".ToLower(), $True)
    $Options.Add("-WithoutHighlight".ToLower(), $True)
    $Options.Add("-WithoutColor".ToLower(), $True)
    $Options.Add("-OnlyVim".ToLower(), $True)
    $Options.Add("-OnlyNeovim".ToLower(), $True)
    $i = 0
    $argsLength = $args.Length
    Write-Host "args ($argsLength):$args"
    while ($i -lt $args.Length) {
        $opt = $args[ $i ];
        Write-Host "args[ $i ]:$opt"
        if ($Options.Contains($opt.ToLower())) {
            $i++
        } elseif ($opt.ToLower() -eq "-StaticColor".ToLower()) {
            $i++
            if ($i -ge $args.Length) {
                Return $False
            }
            $i++
        } else {
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
    if ($WithoutAllLanguage) {
        $WithoutCxx=$True
        $WithoutPython=$True
        $WithoutMarkdown=$True
        $WithoutJson=$True
        $WithoutJavascript=$True
        $WithoutPowershell=$True
        $WithoutBash=$True
    }
    if (-not (IsEmptyString $StaticColor)) {
        if (-not $COLORSCHEMES.Contains($StaticColor)) {
            Message "error! unknown colorscheme $StaticColor"
            Message "please use candidates: $COLORSCHEMES"
            Exit
        }
    }
}

function Main() {
    Message "install with mode - $MODE_NAME"

    if ($Basic) {
        BasicInstaller
        Return;
    }

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
