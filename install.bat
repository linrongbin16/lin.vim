@echo off
cd %USERPROFILE%\.vim\install
echo "[lin.vim] Install for Windows"

rem Vim Plugins
cp %USERPROFILE%\.vim\lin.vim %USERPROFILE%\_vimrc
gvim -c "PlugInstall" -c "qall"

cp %USERPROFILE%\.vim\setting-vim\user-template.vim %USERPROFILE%\.vim\user.vim
cp %USERPROFILE%\.vim\setting-vim\coc-settings-template.json %USERPROFILE%\.vim\coc-settings.json

rem neovim
mkdir -p %USERPROFILE%\AppData\Local
ln -s %USERPROFILE%\.vim %USERPROFILE%\AppData\Local\nvim
ln -s %USERPROFILE%\.vim\lin.vim %USERPROFILE%\AppData\Local\nvim\init.vim

cmd /c pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim
