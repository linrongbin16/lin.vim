#!/bin/bash

INSTALL_HOME=$HOME/.vim/installers
source $INSTALL_HOME/util.sh

message "install dependencies with pacman"

sudo pacman -Syy

# vim and neovim
yes | sudo pacman -Rs vim
yes | sudo pacman -S gvim

install_or_skip "yes | sudo pacman -S base-devel" "gcc"
install_or_skip "yes | sudo pacman -S base-devel" "make"
install_or_skip "yes | sudo pacman -S neovim" "nvim"
install_or_skip "yes | sudo pacman -S curl" "curl"
install_or_skip "yes | sudo pacman -S wget" "wget"
install_or_skip "yes | sudo pacman -S autoconf" "autoconf"
install_or_skip "yes | sudo pacman -S automake" "automake"
install_or_skip "yes | sudo pacman -S pkg-config" "pkg-config"
install_or_skip "yes | sudo pacman -S cmake" "cmake"
install_or_skip "yes | sudo pacman -S xclip" "xclip"
install_or_skip "yes | sudo pacman -S wl-clipboard" "wl-copy"

# Python3
install_or_skip "yes | sudo pacman -S python python-pip" "python3"

# Node
install_or_skip "yes | sudo pacman -S nodejs npm" "node"

# Ctags
install_or_skip "yes | sudo pacman -S ctags" "ctags"
