#!/usr/bin/env bash

yes | sudo pacman -Rs vim
yes | sudo pacman -S gvim
yes | sudo pacman -S neovim
yes | sudo pacman -S curl
yes | sudo pacman -S wget
yes | sudo pacman -S zsh
yes | sudo pacman -S gcc
yes | sudo pacman -S clang
yes | sudo pacman -S make
yes | sudo pacman -S autoconf
yes | sudo pacman -S automake
yes | sudo pacman -S cmake
yes | sudo pacman -S go
yes | sudo pacman -S ripgrep
yes | sudo pacman -S fd
yes | sudo pacman -S bat
yes | sudo pacman -S unzip
yes | sudo pacman -S bzip2
yes | sudo pacman -S zip
yes | sudo pacman -S p7zip

# Python3
yes | sudo pacman -S python
yes | sudo pacman -S python-pip

# Node
yes | sudo pacman -S nodejs
yes | sudo pacman -S npm

# Ctags
yes | sudo pacman -S ctags
