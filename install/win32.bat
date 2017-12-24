echo "[lin-vim] Install for Windows"

rem Vim Plugins
mkdir %HOMEPATH%\.ssh
curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%/.vim/lin-vim-win32.vimrc %HOMEPATH%\_vimrc
gvim +silent! +PlugInstall! +qall
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --tern-completer
