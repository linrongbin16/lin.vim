echo "[lin-vim] Install for Windows"

mkdir %HOMEPATH%\.ssh

REM install vim
git clone https://github.com/linrongbin16/lin-vim %HOMEPATH%\.vim
cd %HOMEPATH%\.vim
curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

REM install YouCompleteMe
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
vim -c "PlugInstall" -c "qall"
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --go-completer --java-completer --js-completer

REM install node/python plugin
call npm config set unsafe-perm true
call npm install js-beautify standard eslint xo typescript-formatter sass remark-cli -g
call python -m pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8 pathlib
