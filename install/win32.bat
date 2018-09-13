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
call python -m pip install --user pyOpenSSL pyflakes pep8 flake8 pylint cpplint autopep8 pathlib autopep8 yapf

rem install golang plugin
mkdir -p %USERPROFILE%\go
mkdir -p %USERPROFILE%\go\src
mkdir -p %USERPROFILE%\go\bin
mkdir -p %USERPROFILE%\go\pkg
mkdir -p %USERPROFILE%\workspace
mkdir -p %USERPROFILE%\workspace\practice
mkdir -p %USERPROFILE%\workspace\project
