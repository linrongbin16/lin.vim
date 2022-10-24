#Requires -RunAsAdministrator

$VIM_HOME="$env:UserProfile\.vim"
$APPDATA_LOCAL_HOME="$env:UserProfile\AppData\Local"
$NVIM_HOME="$APPDATA_LOCAL_HOME\nvim"
$TEMPLATE_HOME="$VIM_HOME\template"

Function Message() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)][String]$message
    )
    Write-Host "[lin.vim] - $message"
}

Function InstallOrSkip() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)][String]$command,
        [Parameter(Mandatory = $true)][String]$target
    )
    if (Get-Command -Name $target -ErrorAction SilentlyContinue) {
        Message "'${target}' already exist, skip..."
    } else {
        Message "install '${target}' with command: '${command}'"
        Invoke-Expression $command
    }
}

Function TryBackup() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)][String]$target
    )
    If (Test-Path $target) {
        $now=Get-Date -Format "yyyy-MM-dd.HH-mm-ss.fffffff"
        $backup=-join($target, ".", $now)
        Message "backup '$target' to '$backup'"
        Rename-Item $target $backup
    }
}

Function TryDelete() {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)][String]$target
    )
    If (Test-Path $target) {
        Message "delete '$target'"
        (Get-Item $target).Delete()
    }
}

Function RustDependency() {
    Message "install modern rust commands with cargo"
    InstallOrSkip -command "cargo install ripgrep" -target "rg"
    InstallOrSkip -command "cargo install fd-find" -target "fd"
    InstallOrSkip -command "cargo install --locked bat" -target "bat"
}

Function Pip3Dependency() {
    Message "install python packages with pip3"
    pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click
}

Function NpmDependency() {
    Message "install node packages with npm"
    npm install -g yarn prettier neovim
}

Function InstallTemplates() {
    Message "install configurations from templates"
    Copy-Item $TEMPLATE_HOME\plugin-template.vim -Destination $VIM_HOME\plugin.vim
    Copy-Item $TEMPLATE_HOME\coc-settings-template.json -Destination $VIM_HOME\coc-settings.json
    Copy-Item $TEMPLATE_HOME\setting-template.vim -Destination $VIM_HOME\setting.vim
}

Function InstallVimrc() {
    Message "install .vimrc for vim"
    TryBackup "$env:UserProfile\_vimrc"
    cmd /c mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\lin.vim
}

Function InstallNvimInit() {
    Message "install $APPDATA_LOCAL_HOME/nvim and $APPDATA_LOCAL_HOME/nvim/init.vim for neovim"
    TryBackup "$NVIM_HOME\init.vim"
    TryBackup "$NVIM_HOME"
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim %USERPROFILE%\.vim
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\.vim\lin.vim
}

Function InstallVimPlugin() {
    Message "install vim plugins"
    gvim -E -c "PlugInstall" -c "qall"
}

Function InstallNvimPlugin() {
    Message "install neovim plugins"
    nvim -E -c "PlugInstall" -c "qall"
}

Function Main() {
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

Main
