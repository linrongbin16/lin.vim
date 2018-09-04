echo "[lin-vim] Install for Windows"

git clone https://github.com/linrongbin16/lin-vim %HOMEPATH%\.vim
mkdir %HOMEPATH%\.ssh
cd %HOMEPATH%\.vim

curl -fLo %HOMEPATH%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp %HOMEPATH%\.vim\lin-vim.vimrc %HOMEPATH%\_vimrc
vim -c "PlugInstall" -c "qall"
cd %HOMEPATH%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --go-completer --java-completer --js-completer
cd %HOMEPATH%\.vim

npm config set unsafe-perm true
npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli

python -m pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8 pathlib
