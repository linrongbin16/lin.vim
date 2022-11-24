#!/bin/bash

INSTALL_HOME=$HOME/.vim/installer
OPT_DISABLE_VIM=$1
OPT_DISABLE_NEOVIM=$2
source $INSTALL_HOME/util.sh

message "install dependencies with pacman"
sudo pacman -Syy

# vim
if [ $OPT_DISABLE_VIM -ne 1 ]; then
    install_or_skip "yes | sudo pacman -Rs vim" "vim"
    install_or_skip "yes | sudo pacman -S gvim" "gvim"
fi
# neovim
if [ $OPT_DISABLE_NEOVIM -ne 1 ]; then
    install_or_skip "yes | sudo pacman -S neovim" "nvim"
fi
install_or_skip "yes | sudo pacman -S base-devel" "gcc"
install_or_skip "yes | sudo pacman -S base-devel" "make"
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
