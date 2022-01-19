Write-Host "[lin.vim] Install for Windows"

# Install python3 pip packages
pip3 install pyOpenSSL pep8 flake8 pylint black yapf chardet jedi neovim cmakelang cmake-language-server click

# Install nodejs npm packages
npm install -g yarn prettier

# Install GUI Fonts
New-Item -ItemType Directory -Force -Path $env:UserProfile\.vim\guifonts
Set-Location -Path $env:UserProfile\.vim\guifonts
If (!(Test-Path $env:UserProfile\.vim\guifonts\Hack-v3.003-ttf.zip -PathType Leaf)) {
    Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -OutFile Hack.zip
}
Write-Host "[lin.vim] Warning: GUI font 'Hack.zip' downloaded at '$env:UserProfile\.vim\guifonts'."
Write-Host "[lin.vim] Warning: Please manually install hack font."

# Install VIM Plugins
If (Test-Path $env:UserProfile\_vimrc) {
    (Get-Item $env:UserProfile\_vimrc).Delete()
}
cmd /c mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\lin.vim
gvim -c "PlugInstall" -c "qall"

# Install User Custom
Copy-Item $env:UserProfile\.vim\template\vim-plug-template.vim -Destination $env:UserProfile\.vim\vim-plug.vim
Copy-Item $env:UserProfile\.vim\template\user-settings-template.vim -Destination $env:UserProfile\.vim\user-settings.vim
Copy-Item $env:UserProfile\.vim\template\coc-settings-template.json -Destination $env:UserProfile\.vim\coc-settings.json

# Install Neovim Config
New-Item -ItemType Directory -Force -Path $env:UserProfile\AppData\Local
If (Test-Path $env:UserProfile\AppData\Local\nvim) {
    (Get-Item $env:UserProfile\AppData\Local\nvim).Delete()
}
If (Test-Path $env:UserProfile\AppData\Local\nvim\init.vim) {
    (Get-Item $env:UserProfile\AppData\Local\nvim\init.vim).Delete()
}
cmd /c mklink %USERPROFILE%\AppData\Local\nvim %USERPROFILE%\.vim
cmd /c mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\.vim\lin.vim
