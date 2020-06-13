#!/usr/bin/env bash

sudo echo "[lin.vim] Install for Fedora" || { echo "[lin.vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
sudo dnf install -y git vim gvim curl wget zsh
sudo dnf install -y gcc g++ clang autoconf automake make cmake
sudo dnf install -y openssl openssh openssh-server openssh-clients cryptopp-devel
sudo dnf install -y the_silver_searcher ripgrep unzip bzip2
sudo dnf install -y python3 python3-devel python3-pip nodejs npm
sudo pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi
sudo npm install -g yarn

# Vim Plugins
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

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
