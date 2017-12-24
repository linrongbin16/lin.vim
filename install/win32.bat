echo "[lin-vim] Install for Windows"

rem Vim Plugins
mkdir %HOMEPATH%\.ssh
mkdir %HOMEPATH%\vimfiles
curl -fLo %HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
vim -c "PlugInstall" -c "qall"
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --js-completer
