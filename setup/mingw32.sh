#!/usr/bin/env bash

echo "[devim] install Windows-MINGW32"


# Prepare Environment

DEVIMRC=~/.devimrc
touch $DEVIMRC
touch ~/.bashrc
touch ~/.bash_history
touch ~/.bash_login
touch ~/.bash_profile
touch ~/.profile

# Variable 

mkdir -p ~/.ssh
echo "export PATH=\$PATH:~/.vim/commands" >> $DEVIMRC
echo "alias l=\"ls -la\"" >> $DEVIMRC
echo "alias ll=\"ls -l\"" >> $DEVIMRC
echo "source $DEVIMRC" >> ~/.bashrc
source $DEVIMRC 1>/dev/null 2>&1
source ~/.bashrc 1>/dev/null 2>&1

# Vim Plugins

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vim/lin-vim.vimrc ~/_vimrc
vim +silent! +PluginInstall! +qall
cd ~/.vim/bundle/YouCompleteMe
python install.py --clang-completer --gocode-completer --tern-completer
