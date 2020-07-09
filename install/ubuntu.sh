#!/usr/bin/env bash

sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y vim-gtk
sudo apt-get install -y libcanberra-gtk-module
sudo apt-get install -y neovim
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y zsh
sudo apt-get install -y build-essential
sudo apt-get install -y gcc
sudo apt-get install -y g++
sudo apt-get install -y make
sudo apt-get install -y clang
sudo apt-get install -y cmake
sudo apt-get install -y pkg-config
sudo apt-get install -y autoconf
sudo apt-get install -y automake
sudo apt-get install -y clang-format
sudo apt-get install -y clangd
sudo apt-get install -y libssl-dev
sudo apt-get install -y openssh-server
sudo apt-get install -y libcrypto++-dev
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y ripgrep
sudo apt-get install -y unzip
sudo apt-get install -y bzip2
sudo apt-get install -y unrar
sudo apt-get install -y zip
sudo apt-get install -y p7zip
sudo apt-get install -y python3
sudo apt-get install -y python3-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-docutils

# Node
sudo apt-get remove -y nodejs
sudo apt-get remove -y nodejs-dev
sudo apt-get remove -y libnode-dev
sudo apt-get remove -y npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Ctags
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
