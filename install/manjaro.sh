#!/usr/bin/env bash

sudo echo "[lin.vim] Install for Manjaro" || { echo "[lin.vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
yes | sudo pacman -Rs vim
yes | sudo pacman -S git gvim curl wget zsh gcc clang make autoconf automake cmake openssh openssl crypto++
yes | sudo pacman -S the_silver_searcher ripgrep unrar unzip bzip2 zip p7zip python python-pip nodejs npm
sudo pip3 install pyOpenSSL pep8 flake8 pylint black cpplint chardet jedi
sudo npm install -g yarn

# Vim Plugins
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"
vim -c "CocInstall -sync coc-marketplace coc-emoji coc-syntax coc-highlight coc-pairs coc-json coc-python coc-clangd coc-cmake coc-emmet coc-css coc-cssmodules coc-html coc-tsserver coc-eslint" -c "qall"

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# User Custom
cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "alias l=\"ls -lh\"" >> ~/.linvimrc
echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
echo "export PATH=\$PATH:~/.vim/command" >> ~/.linvimrc

echo "source ~/.linvimrc" >> ~/.zshrc
source ~/.zshrc 1>/dev/null 2>&1
