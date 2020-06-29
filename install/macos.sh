#!/usr/bin/env bash

sudo echo "[lin.vim] Install for MacOS" || { echo "[lin.vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
brew upgrade
brew install macvim zsh curl wget llvm autoconf automake cmake clang-format
brew install openssl openssh cryptopp the_silver_searcher ripgrep python3 unzip zip p7zip node
sudo pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim

# Vim Plugin
ln -s ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# User Custom
cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json

# neovim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/lin.vim ~/.config/nvim/init.vim

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "setopt HIST_IGNORE_ALL_DUPS" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "defaults write com.apple.finder AppleShowAllFiles TRUE" >> ~/.linvimrc
echo "alias vim=/usr/local/bin/vim" >> ~/.linvimrc
echo "alias l=\"ls -lh\"" >> ~/.linvimrc
echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
echo "export PATH=\$PATH:~/.vim/command" >> ~/.linvimrc

echo "source ~/.linvimrc" >> ~/.zshrc
source ~/.zshrc 1>/dev/null 2>&1
