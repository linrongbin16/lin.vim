#!/usr/bin/env bash

sudo echo "[lin.vim] Install for Ubuntu" || { echo "[lin.vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
sudo apt-get install -y git vim vim-gtk libcanberra-gtk-module curl wget zsh gcc g++ clang cmake autoconf automake clang-format build-essential
sudo apt-get install -y libssl-dev openssh-server libcrypto++-dev silversearcher-ag unzip bzip2 unrar zip p7zip
sudo apt-get install -y python3 python3-dev python3-pip libssl1.0-dev nodejs nodejs-dev node-gyp npm
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint chardet jedi

# Git Config
cd ~/.vim
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

# Vim Plugins
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# User Custom
cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json

# Commands
cd ~/.vim/command
chmod +x *

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "alias l=\"ls -lh\"" >> ~/.linvimrc
echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
echo "export PATH=\$PATH:~/.vim/command" >> ~/.linvimrc

echo "source ~/.linvimrc" >> ~/.zshrc
source ~/.zshrc 1>/dev/null 2>&1
