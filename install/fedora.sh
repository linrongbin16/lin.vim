#!/usr/bin/env bash

sudo echo "[lin-vim] Install for Fedora" || { echo "[lin-vim] sudo not found"; exit 1; }

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
sudo dnf install -y the_silver_searcher unzip bzip2
sudo dnf install -y python3 python3-devel python3-pip nodejs npm
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint
sudo npm install -g --unsafe-perm js-beautify eslint
if [ -d ~/.config ]; then
    sudo chmod -R +rwx ~/.config
    sudo chown -R $USER ~/.config
fi

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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer

# GuiFonts
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
cd ~/.vim/fonts
find_command="find $HOME/.vim/fonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# User Custom
cp ~/.vim/settings/conf/custom.vim ~/.vim/custom.vim

# Commands
cd ~/.vim/commands
chmod +x *

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "alias l=\"ls -lh\"" >> ~/.linvimrc
echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc

echo "source ~/.linvimrc" >> ~/.zshrc
source ~/.zshrc 1>/dev/null 2>&1
