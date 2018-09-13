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
call python -m pip install --user pyOpenSSL pyflakes pep8 flake8 pylint cpplint autopep8 pathlib autopep8 yapf urllib3 shutil

rem install golang plugin
mkdir -p %USERPROFILE%\go
mkdir -p %USERPROFILE%\go\src
mkdir -p %USERPROFILE%\go\bin
mkdir -p %USERPROFILE%\go\pkg
mkdir -p %USERPROFILE%\workspace
mkdir -p %USERPROFILE%\workspace\practice
mkdir -p %USERPROFILE%\workspace\project

rem install wget.exe
mkdir -p %USERPROFILE%\.vim\bin
cd %USERPROFILE%\.vim\bin
call python %USERPROFILE%\.vim\install\download.py https://eternallybored.org/misc/wget/1.19.4/64/wget.exe wget.exe

rem install ag.exe
mkdir -p temp
cd temp
call python %USERPROFILE%\.vim\install\download.py https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-08-08%2F2.2.0-2-gbd82cd3/ag-2018-08-08_2.2.0-2-gbd82cd3-x64.zip ag.zip
call python %USERPROFILE%\.vim\install\extract.py ag.zip
cd ..
mv temp\ag.exe ..

rem install ctags.exe readtags.exe
rm -rf temp
mkdir -p temp
cd temp
call python %USERPROFILE%\.vim\install\download.py https://github.com/universal-ctags/ctags-win32/releases/download/2018-09-12%2F41311ac7/ctags-2018-09-12_41311ac7-x64.zip ctags.zip
call python %USERPROFILE%\.vim\install\extract.py ctags.zip
cd ..
mv temp\ctags.exe ..
mv temp\readtags.exe ..
rm -rf temp
