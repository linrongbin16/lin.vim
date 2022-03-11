$VIM_HOME="$env:UserProfile\.vim"
$APPDATA_LOCAL_HOME="$env:UserProfile\AppData\Local"
$NVIM_HOME="$APPDATA_LOCAL_HOME\nvim"
$TEMPLATE_HOME="$VIM_HOME\template"

Function Message($msg) {
    Write-Host "[lin.vim] - $msg"
}

Function Pip3Dependency() {
    pip3 install pyOpenSSL pep8 flake8 pylint yapf chardet neovim pynvim cmakelang cmake-language-server click
}

Function NpmDependency() {
    npm install -g yarn prettier neovim
}

Function InstallTemplates() {
    Copy-Item $TEMPLATE_HOME\plugin-template.vim -Destination $VIM_HOME\plugin.vim
    Copy-Item $TEMPLATE_HOME\coc-settings-template.json -Destination $VIM_HOME\coc-settings.json
    Copy-Item $TEMPLATE_HOME\ginit-template.vim -Destination $VIM_HOME\ginit.vim
    Copy-Item $TEMPLATE_HOME\setting-template.vim -Destination $VIM_HOME\setting.vim
}

Function InstallVimrc() {
    If (Test-Path $env:UserProfile\_vimrc) {
        (Get-Item $env:UserProfile\_vimrc).Delete()
    }
    cmd /c mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\lin.vim
}

Function InstallNvimInit() {
    New-Item -ItemType Directory -Force -Path $APPDATA_LOCAL_HOME
    If (Test-Path $NVIM_HOME\init.vim) {
        (Get-Item $NVIM_HOME\init.vim).Delete()
    }
    If (Test-Path $NVIM_HOME) {
        (Get-Item $NVIM_HOME).Delete()
    }
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim %USERPROFILE%\.vim
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\.vim\lin.vim
}

Function InstallVimPlugin() {
    gvim -E -c "PlugInstall" -c "qall"
}

function Check-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

Function InstallNvimPluginIfExist() {
    if (Check-Command -cmdname 'nvim') {
        nvim -E -c "PlugInstall" -c "qall"
    }
}

Message -msg "install dependencies for windows"

# install dependencies
Pip3Dependency
NpmDependency

# install files
InstallTemplates
InstallVimrc
InstallNvimInit

# install plugins
InstallNvimPluginIfExist
InstallVimPlugin
