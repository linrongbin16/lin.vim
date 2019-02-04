@echo off
echo "[lin-vim] Install for Windows"

mkdir %USERPROFILE%\.ssh

rem install vim
cd %USERPROFILE%\.vim
curl -fLo %USERPROFILE%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rem install YouCompleteMe
cp %USERPROFILE%\.vim\lin-vim.vimrc %USERPROFILE%\_vimrc
gvim -c "PlugInstall" -c "qall"
cd %USERPROFILE%\.vim\plugged\YouCompleteMe
python install.py --clang-completer

rem install python plugin
call pip install --user pyOpenSSL pyflakes pep8 flake8 pylint cpplint autopep8 pathlib autopep8 yapf urllib3

cd %USERPROFILE%\.vim

echo.
echo.
echo [lin-vim] install ag.exe from `https://github.com/k-takata/the_silver_searcher-win32/releases`, make sure it's available in %%PATH%%
echo [lin-vim] install ctags.exe, readtags.exe from `https://github.com/universal-ctags/ctags-win32/releases`, make sure they're available in %%PATH%%
echo [lin-vim] install fonts in %%USERPROFILE%%\.vim\guifonts\
