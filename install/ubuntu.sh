#!/usr/bin/env bash

sudo apt-get install -y vim
sudo apt-get install -y vim-gtk
sudo apt-get install -y libcanberra-gtk-module
sudo apt-get install -y neovim
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y zsh
sudo apt-get install -y gcc
sudo apt-get install -y g++
sudo apt-get install -y make
sudo apt-get install -y clang
sudo apt-get install -y cmake
sudo apt-get install -y autoconf
sudo apt-get install -y automake
sudo apt-get install -y clang-format
sudo apt-get install -y clangd
sudo apt-get install -y golang-go
sudo apt-get install -y ripgrep
sudo apt-get install -y unzip
sudo apt-get install -y bzip2
sudo apt-get install -y zip
sudo apt-get install -y p7zip
sudo apt-get install -y python3
sudo apt-get install -y python3-dev
sudo apt-get install -y python3-venv
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-docutils

# Node
if ! type "node" > /dev/null; then
    curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "[lin.vim] node already installed, skip..."
fi


# Ctags
if ! type "ctags" > /dev/null; then
    sudo apt-get remove -y universal-ctags
    sudo apt-get remove -y exuberant-ctags
    sudo apt-get install -y libseccomp-dev
    sudo apt-get install -y libjansson-dev
    sudo apt-get install -y libyaml-dev
    sudo apt-get install -y libxml2-dev
    cd ~/.vim
    git clone https://github.com/universal-ctags/ctags.git universal-ctags
    cd universal-ctags
    ./autogen.sh
    ./configure
    make
    sudo make install
    rm -rf ~/.vim/universal-ctags
else
    echo "[lin.vim] ctags already installed, skip..."
fi
