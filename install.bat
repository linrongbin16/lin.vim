@echo off
cd %USERPROFILE%\.vim\install
echo "[lin-vim] Install for Windows"

rem Vim Plugins
cp %USERPROFILE%\.vim\lin.vim %USERPROFILE%\_vimrc
gvim -c "PlugInstall" -c "qall"
cd %USERPROFILE%\.vim\plugged\YouCompleteMe
python install.py --clang-completer

rem Git Config
cd %USERPROFILE%\.vim
git config core.filemode false
git config core.longpaths true
git config push.default simple
git config pull.default simple
git config core.editor vim
git config credential.helper store
git config --global core.filemode false
git config --global core.longpaths true
git config --global push.default simple
git config --global pull.default simple
git config --global core.editor vim
git config --global credential.helper store
