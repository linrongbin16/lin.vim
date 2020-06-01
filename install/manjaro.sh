#!/usr/bin/env bash

sudo echo "[lin-vim] Install for Manjaro" || { echo "[lin-vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
yes | sudo pacman -Rs vim
yes | sudo pacman -S git gvim curl wget zsh gcc clang make autoconf automake cmake openssh openssl crypto++
yes | sudo pacman -S the_silver_searcher unrar unzip bzip2 zip p7zip python python-pip nodejs npm universal-ctags
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint chardet

# Git Config
cd ~/.vim
git config core.filemode false
git config core.longpaths false
git config push.default simple
git config pull.default simple
git config core.editor vim
git config credential.helper store
git config --global core.filemode false
git config --global core.longpaths false
git config --global push.default simple
git config --global pull.default simple
git config --global core.editor vim
git config --global credential.helper store

# Vim Plugins
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"
vim -c "CocInstall coc-json coc-clangd coc-cmake coc-eslint coc-highlight coc-jedi coc-python coc-spell-checker" -c "qall"

# Fonts
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
cd ~/.vim/fonts
find_command="find $HOME/.vim/fonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# User Custom
cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim

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
