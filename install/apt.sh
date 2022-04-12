#!/usr/bin/env bash

VIM_HOME=$HOME/.vim
INSTALL_HOME=$VIM_HOME/install

$INSTALL_HOME/message.sh "install dependencies with apt"

sudo apt-get update
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y build-essential" "gcc"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y vim" "vim"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y libcanberra-gtk-module vim-gtk" "gvim"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y neovim" "nvim"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y curl" "curl"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y wget" "wget"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y cmake" "cmake"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y clang" "clang"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y clang-format" "clang-format"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y clangd" "clangd"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y golang-go" "go"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y ripgrep" "rg"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y fd-find" "fdfind"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y bat" "bat"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y bzip2" "bzip2"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y unzip" "unzip"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y zip" "zip"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y p7zip-full" "7z"

# Python3
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "python3"
$INSTALL_HOME/install_or_skip.sh "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "pip3"

# Node
if ! type "node" > /dev/null; then
    $INSTALL_HOME/message.sh "install nodejs from deb.nodesource.com..."
    curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    $INSTALL_HOME/message_skip.sh "node"
fi


# Ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo apt-get install -y libseccomp-dev
    sudo apt-get install -y libjansson-dev
    sudo apt-get install -y libyaml-dev
    sudo apt-get install -y libxml2-dev
    $INSTALL_HOME/message.sh "install universal-ctags from source..."
    $INSTALL_HOME/install_universal_ctags.sh
else
    $INSTALL_HOME/message_skip.sh "ctags"
fi
