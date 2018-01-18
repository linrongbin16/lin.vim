@echo off
echo "[lin-vim] Install for Windows"

runas /usr:localhost \administrator "pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8"
npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli

mkdir %HOMEPATH%\.ssh
mkdir %HOMEPATH%\vimfiles
curl -fLo %HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
vim -c "PlugInstall" -c "qall"
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --go-completer --js-completer

mkdir -p %HOMEPATH%\.ssh
