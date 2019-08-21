@echo off
echo "[lin-vim] Install for Windows"

rem Software Dependency
cd %USERPROFILE%\.vim
curl -fLo %USERPROFILE%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rem Vim Plugins
cp %USERPROFILE%\.vim\lin.vim %USERPROFILE%\_vimrc
gvim -c "PlugInstall" -c "qall"
sed -i "s/Complete Engine/Complete Engine\nPlug 'ycm-core/YouCompleteMe'\n" %USERPROFILE%\.vim\conf\vim-plug.vim
cd %USERPROFILE\.vim\plugged
if [ -d YouCompleteMe ]; then
    rm -rf YouCompleteMe
fi
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init
cd third_party\ycmd
sed -i "s/url = https:\/\/go.googlesource.com\/tools/url = https:\/\/github.com\/golang\/tools.git/" .gitmodules
git submodule update --init --recursive
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
