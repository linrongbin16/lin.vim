#!/usr/bin/env bash

VIM_HOME=$HOME/.vim
INSTALL_HOME=$VIM_HOME/install

$INSTALL_HOME/message.sh "install dependencies with brew"

brew update
$INSTALL_HOME/install_or_skip.sh "brew install macvim" "gvim"
$INSTALL_HOME/install_or_skip.sh "brew install neovim" "nvim"
$INSTALL_HOME/install_or_skip.sh "brew install curl-openssl" "curl"
$INSTALL_HOME/install_or_skip.sh "brew install wget" "wget"
$INSTALL_HOME/install_or_skip.sh "brew install llvm" "clangd"
$INSTALL_HOME/install_or_skip.sh "brew install cmake" "cmake"
$INSTALL_HOME/install_or_skip.sh "brew install go" "go"
$INSTALL_HOME/install_or_skip.sh "brew install ripgrep" "rg"
$INSTALL_HOME/install_or_skip.sh "brew install fd" "fd"
$INSTALL_HOME/install_or_skip.sh "brew install bat" "bat"
$INSTALL_HOME/install_or_skip.sh "brew install unzip" "unzip"
$INSTALL_HOME/install_or_skip.sh "brew install zip" "zip"
$INSTALL_HOME/install_or_skip.sh "brew install bzip2" "bzip2"
$INSTALL_HOME/install_or_skip.sh "brew install p7zip" "7z"

# Python3
$INSTALL_HOME/install_or_skip.sh "brew install python3" "python3"

# Node
$INSTALL_HOME/install_or_skip.sh "brew install node" "node"

# Ctags
$INSTALL_HOME/install_or_skip.sh "brew install --HEAD universal-ctags/universal-ctags/universal-ctags" "ctags"
