@ECHO OFF
ECHO [lin-vim] Install for Windows

REM SSH
IF NOT EXIST %HOMEPATH%\.ssh (
    MKDIR %HOMEPATH%\.ssh
)

REM Python
python -m pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8 pathlib

REM Javascript
WHERE node >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    npm config set unsafe-perm true
    npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli
) ELSE (
    ECHO [lin-vim] If JavaScript support is needed, install Node before installation
)

REM Vim Plugin
curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo %HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
gvim -c "PlugInstall" -c "qall"
CD %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --go-completer --java-completer
CD %HOMEPATH%\.vim
rm -rf %HOMEPATH%\vimfiles
