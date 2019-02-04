@echo off
echo "[lin-vim] Install for Windows"

rem Software Dependency
cd %USERPROFILE%\.vim
curl -fLo %USERPROFILE%\.vim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call pip install --user pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint
call npm install -g --unsafe-perm js-beautify eslint tslint typescript-formatter remark-cli

rem Vim Plugins
cp %USERPROFILE%\.vim\lin-vim.vimrc %USERPROFILE%\_vimrc
gvim -c "PlugInstall" -c "qall"
cd %USERPROFILE%\.vim\plugged\YouCompleteMe
python install.py --clang-completer --ts-completer

rem Git Config
cd %USERPROFILE%\.vim
git config core.filemode false
git config core.longpaths true
git config push.default simple
git config pull.default simple
git config core.editor vim
git config credential.helper store
git config --global core.filemode false
git config --global core.longpaths true
git config --global push.default simple
git config --global pull.default simple
git config --global core.editor vim
git config --global credential.helper store

echo.
echo.
echo [lin-vim] install ag.exe from `https://github.com/k-takata/the_silver_searcher-win32/releases`, make sure it's available in %%PATH%%
echo [lin-vim] install ctags.exe, readtags.exe from `https://github.com/universal-ctags/ctags-win32/releases`, make sure they're available in %%PATH%%
echo [lin-vim] install fonts in %%USERPROFILE%%\.vim\guifonts\
