Function Lin-Vim-Pip3 {
    pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim
}

Function Lin-Vim-Gui-Fonts {
    New-Item -ItemType Directory -Force -Path $env:userprofile\.vim\guifonts
    Set-Location -Path $env:userprofile\.vim\guifonts
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

Function Lin-Vim-Plugin {
    New-Item -ItemType Directory -Force -Path $env:userprofile\.vim\autoload
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile $env:userprofile\.vim\autoload\plug.vim
    If (Test-Path $env:userprofile\_vimrc) {
        Remove-Item $env:userprofile\_vimrc
    }
    cmd /c mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\lin.vim
    gvim -c "PlugInstall" -c "qall"
}

Function Lin-Vim-User-Custom {
    Copy-Item $env:userprofile\.vim\setting-vim\user-template.vim $env:userprofile\.vim\user.vim
    Copy-Item $env:userprofile\.vim\setting-vim\coc-settings-template.json $env:userprofile\.vim\coc-settings.json
}


Function Lin-Vim-Neovim-Config {
    New-Item -ItemType Directory -Force -Path $env:userprofile\AppData\Local
    If (Test-Path $env:userprofile\AppData\Local\nvim) {
        Remove-Item $env:userprofile\AppData\Local\nvim
    }
    If (Test-Path $env:userprofile\AppData\Local\nvim\init.vim) {
        Remove-Item $env:userprofile\AppData\Local\nvim\init.vim
    }
    cmd /c mklink /d %USERPROFILE%\.vim %USERPROFILE%\AppData\Local\nvim
    cmd /c mklink %USERPROFILE%\.vim\lin.vim %USERPROFILE%\AppData\Local\nvim\init.vim
}

Write-Host "[lin.vim] Install for Windows"
Lin-Vim-Pip3
Lin-Vim-Gui-Fonts
Lin-Vim-Plugin
Lin-Vim-User-Custom
Lin-Vim-Neovim-Config
