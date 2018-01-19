@ECHO OFF
ECHO [lin-vim] Install for Windows

go.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] Golang Not Found
    EXIT /B
)

pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8
npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli

mkdir %HOMEPATH%\.ssh
mkdir %HOMEPATH%\vimfiles
curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
vim -c "PlugInstall" -c "qall"
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --go-completer --js-completer

mkdir -p %HOMEPATH%\.ssh
