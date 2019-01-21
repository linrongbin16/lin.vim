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
python install.py --clang-completer --js-completer --go-completer

rem install node/python plugin
call npm config set unsafe-perm true
call npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli tern typescript
call pip install --user pyOpenSSL pyflakes pep8 flake8 pylint cpplint autopep8 pathlib autopep8 yapf urllib3

rem install plugin
mkdir %USERPROFILE%\workspace
mkdir %USERPROFILE%\workspace\practice
mkdir %USERPROFILE%\workspace\project
cd %USERPROFILE%\.vim

echo.
echo.
echo [lin-vim] NOTICE
echo [lin-vim] install `https://github.com/k-takata/the_silver_searcher-win32/releases` x86_64 zip, extract zip and put `ag.exe` to `%%USERPROFILE%%\.vim\bin\`
echo [lin-vim] install `https://github.com/universal-ctags/ctags-win32/releases` x86_64 zip, extract zip and put `ctags.exe`, `readtags.exe` to `%%USERPROFILE%%\.vim\bin\`
echo [lin-vim] install fonts in %%USERPROFILE%%\.vim\guifonts
echo [lin-vim] add `%%USERPROFILE%%\.vim\bin` to `%%PATH%%`
