Function Install-Pip3 {
    pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim
}

Function Install-Gui-Fonts {
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    New-Item -ItemType Directory -Force -Path $env:UserProfile\.vim\guifonts
    Set-Location -Path $env:UserProfile\.vim\guifonts
    Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -OutFile Hack.zip
    Write-Host "[lin.vim] Warning: GUI font 'Hack.zip' downloaded at '$env:UserProfile\.vim\guifonts'."
    Write-Host "[lin.vim] Warning: Please manually install."
}

Function Install-Plugin {
    New-Item -ItemType Directory -Force -Path $env:UserProfile\.vim\autoload
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile $env:UserProfile\.vim\autoload\plug.vim
    If (Test-Path $env:UserProfile\_vimrc) {
        (Get-Item $env:UserProfile\_vimrc).Delete()
    }
    cmd /c mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\lin.vim
    gvim -c "PlugInstall" -c "qall"
}

Function Install-User-Custom {
    Copy-Item $env:UserProfile\.vim\setting-vim\user-template.vim -Destination $env:UserProfile\.vim\user.vim
    Copy-Item $env:UserProfile\.vim\setting-vim\coc-settings-template.json -Destination $env:UserProfile\.vim\coc-settings.json
}


Function Install-Neovim-Config {
    New-Item -ItemType Directory -Force -Path $env:UserProfile\AppData\Local
    If (Test-Path $env:UserProfile\AppData\Local\nvim) {
        (Get-Item $env:UserProfile\AppData\Local\nvim).Delete()
    }
    If (Test-Path $env:UserProfile\AppData\Local\nvim\init.vim) {
        (Get-Item $env:UserProfile\AppData\Local\nvim\init.vim).Delete()
    }
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim %USERPROFILE%\.vim
    cmd /c mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\.vim\lin.vim
}

Write-Host "[lin.vim] Install for Windows"
Install-Pip3
Install-Gui-Fonts
Install-Plugin
Install-User-Custom
Install-Neovim-Config
