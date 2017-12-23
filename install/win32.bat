echo "[lin-vim] Install for Windows"

rem Vim Plugins
mkdir %HOMEPATH%\.ssh
mkdir %HOMEPATH%\.vim\bundle
git clone https://github.com/VundleVim/Vundle.vim.git %HOMEPATH%\.vim\bundle\Vundle.vim
cp %HOMEPATH%/.vim/lin-vim-win32.vimrc %HOMEPATH%\_vimrc
vim +silent! +PluginInstall! +qall
cd %HOMEPATH%\.vim\bundle\YouCompleteMe
python install.py --clang-completer
