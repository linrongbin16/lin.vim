#!/usr/bin/env bash

VIM_HOME=$HOME/.vim
INSTALL_HOME=$VIM_HOME/install

$INSTALL_HOME/message.sh "install dependencies with pacman"

sudo pacman -Syy
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S base-devel" "gcc"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -Rs vim" "vim"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S gvim" "gvim"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S neovim" "nvim"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S curl" "curl"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S wget" "wget"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S clang" "clang"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S autoconf" "autoconf"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S automake" "automake"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S cmake" "cmake"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S go" "go"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S unzip" "unzip"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S zip" "zip"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S bzip2" "bzip2"
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S p7zip" "7z"

# Python3
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S python python-pip" "python3"

# Node
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S nodejs npm" "node"

# Ctags
$INSTALL_HOME/install_or_skip.sh "yes | sudo pacman -S ctags" "ctags"
