#!/usr/bin/env bash

INSTALL=$HOME/.vim/install

$INSTALL/msg.sh "install dependencies with pacman"

sudo pacman -Syy
$INSTALL/install_or_skip.sh "yes | sudo pacman -S base-devel" "gcc"
$INSTALL/install_or_skip.sh "yes | sudo pacman -Rs vim" "vim"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S gvim" "gvim"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S neovim" "nvim"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S curl" "curl"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S wget" "wget"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S clang" "clang"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S autoconf" "autoconf"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S automake" "automake"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S cmake" "cmake"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S unzip" "unzip"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S zip" "zip"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S bzip2" "bzip2"
$INSTALL/install_or_skip.sh "yes | sudo pacman -S p7zip" "7z"

# Python3
$INSTALL/install_or_skip.sh "yes | sudo pacman -S python python-pip" "python3"

# Node
$INSTALL/install_or_skip.sh "yes | sudo pacman -S nodejs npm" "node"

# Ctags
$INSTALL/install_or_skip.sh "yes | sudo pacman -S ctags" "ctags"
