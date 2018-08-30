@ECHO OFF
ECHO [lin-vim] Install for Windows

mkdir %HOMEPATH%\.ssh

curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo %HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp %HOMEPATH%\.vim\settings\basic.vimrc %HOMEPATH%\_vimrc
gvim -c "PlugInstall" -c "qall"
cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
gvim -c "PlugInstall" -c "qall"
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --java-completer
rm -rf %HOMEPATH%\vimfiles

pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8 pathlib
npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli
