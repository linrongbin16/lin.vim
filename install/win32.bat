@echo off
echo "[lin-vim] Install for Windows"

mkdir %USERPROFILE%\.ssh

rem install vim
git clone https://github.com/linrongbin16/lin-vim %USERPROFILE%\.vim
cd %USERPROFILE%\.vim
curl -fLo %USERPROFILE%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rem install YouCompleteMe
cp %USERPROFILE%\.vim\lin-vim.vimrc %USERPROFILE%\_vimrc
vim -c "PlugInstall" -c "qall"
cd %USERPROFILE%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --go-completer --java-completer --js-completer

rem install node/python plugin
call npm config set unsafe-perm true
call npm install js-beautify standard eslint xo typescript-formatter sass remark-cli -g
call python -m pip install --user pyOpenSSL pyflakes pep8 flake8 pylint cpplint autopep8 pathlib autopep8 yapf urllib3

rem install golang plugin
mkdir %USERPROFILE%\workspace
mkdir %USERPROFILE%\workspace\practice
mkdir %USERPROFILE%\workspace\project
cd %USERPROFILE%\.vim

echo.
echo.
echo [boostscript] NOTICE
echo [boostscript] download `https://github.com/k-takata/the_silver_searcher-win32/releases` x86_64 zip, extract zip and put `ag.exe` to `%%USERPROFILE%%\.vim\bin\`
echo [boostscript] download `https://github.com/universal-ctags/ctags-win32/releases` x86_64 zip, extract zip and put `ctags.exe`, `readtags.exe` to `%%USERPROFILE%%\.vim\bin\`
echo [boostscript] download `https://maven.apache.org/download.cgi` apache-maven.zip, extract zip and put to `%%USERPROFILE%%\.vim\bin\maven`
echo [boostscript] download `https://gradle.org/install/#manually` gradle.zip, extract zip and put folder to `%%USERPROFILE%%\.vim\bin\gradle`
echo [boostscript] add `%%USERPROFILE%%\.vim\bin` to `%%PATH%%`
echo [boostscript] add `%%USERPROFILE%%\.vim\bin\maven\bin` to `%%PATH%%`
echo [boostscript] add `%%USERPROFILE%%\.vim\bin\gradle\bin` to `%%PATH%%`
echo [boostscript] add `%%APPDATA%%\Python\Python37\Scripts` to `%%PATH%%`
echo [boostscript] set `%%GOPATH%%` = `%%USERPROFILE%%\go`
echo [boostscript] add `%%GOPATH%%\bin` to `%%PATH%%`
echo [boostscript] add `%%GOROOT%%\bin` to `%%PATH%%`
