Write-Host "[lin.vim] Install for Windows"

# Install rust components
rustup component add rust-docs
rustup component add rust-std
rustup component add rustfmt

# Install python3 pip packages
pip3 install pyOpenSSL pep8 flake8 pylint yapf chardet neovim pynvim cmakelang cmake-language-server click trash-cli

# Install nodejs npm packages
npm install -g yarn prettier neovim

# Install user custom files
Copy-Item $env:UserProfile\.vim\template\plugin-template.vim -Destination $env:UserProfile\.vim\plugin.vim
Copy-Item $env:UserProfile\.vim\template\coc-settings-template.json -Destination $env:UserProfile\.vim\coc-settings.json
Copy-Item $env:UserProfile\.vim\template\ginit-template.vim -Destination $env:UserProfile\.vim\ginit.vim
Copy-Item $env:UserProfile\.vim\template\setting-template.vim -Destination $env:UserProfile\.vim\setting.vim

# Install _vimrc file
If (Test-Path $env:UserProfile\_vimrc) {
    (Get-Item $env:UserProfile\_vimrc).Delete()
}
cmd /c mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\lin.vim

# Install nvim init.vim file
New-Item -ItemType Directory -Force -Path $env:UserProfile\AppData\Local
If (Test-Path $env:UserProfile\AppData\Local\nvim\init.vim) {
    (Get-Item $env:UserProfile\AppData\Local\nvim\init.vim).Delete()
}
If (Test-Path $env:UserProfile\AppData\Local\nvim) {
    (Get-Item $env:UserProfile\AppData\Local\nvim).Delete()
}
cmd /c mklink %USERPROFILE%\AppData\Local\nvim %USERPROFILE%\.vim
cmd /c mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\.vim\lin.vim

function Check-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# Install neovim plugins if nvim.exe exists
if (Check-Command -cmdname 'nvim') {
    nvim -E -c "PlugInstall" -c "qall"
}

# Install vim plugins
gvim -E -c "PlugInstall" -c "qall"
