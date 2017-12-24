echo "[lin-vim] Install for Windows"

rem Vim Plugins
mkdir %HOMEPATH%\.ssh
curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
"vim +silent! +"source ~\.vim\settings\vim-plug.vim" +PlugInstall! +qall
vim -c "source ~/.vim/settings/vim-plug.vim" -c "PlugInstall" -c "qall"
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --tern-completer
