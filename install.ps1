Function Install-Pip3 {
    pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim
}

Function Gui-Fonts-Install {
    New-Item -ItemType Directory -Force -Path $env:UserProfile\.vim\guifonts
    Set-Location -Path $env:UserProfile\.vim\guifonts
    $FontRegular="Hack Regular Nerd Font Complete Mono Windows Compatible.ttf"
    $FontBold="Hack Bold Nerd Font Complete Mono Windows Compatible.ttf"
    $FontItalic="Hack Italic Nerd Font Complete Mono Windows Compatible.ttf"
    $FontBoldItalic="Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf"
    Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf -OutFile $FontRegular
    Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf -OutFile $FontBold
    Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf -OutFile $FontItalic
    Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf -OutFile $FontBoldItalic
    $FONTS=0x14;
    $ObjShell=New-Object -ComObject Shell.Application;
    $ObjFolder=$ObjShell.Namespace($FONTS);
    $CopyOptions=4 + 16;
    $CopyFlag=[String]::Format("{0:x}", $CopyOptions);
    foreach($File in $(Get-ChildItem -Path ".")) {
        If (Test-Path "c:\windows\fonts\$($File.name)") {
        } Else {
            $ObjFolder.CopyHere($File.fullname, $CopyOptions);
            New-ItemProperty -Name $File.fullname -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $File 
        }
    }
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
# Gui-Fonts-Install
Install-Plugin
Install-User-Custom
Install-Neovim-Config
