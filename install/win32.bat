@echo off
echo [lin-vim] Install for Windows

REM runas /usr:localhost \administrator "pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8"
REM npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli

mkdir %HOMEPATH%\.ssh
mkdir %HOMEPATH%\vimfiles
curl -fLo %HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
vim -c "PlugInstall" -c "qall"

mkdir -p %HOMEPATH%\.ssh
