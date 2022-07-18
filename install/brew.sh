#!/bin/bash

INSTALL=~/.vim/install

$INSTALL/msg.sh "install dependencies with brew"

brew update
$INSTALL/install_or_skip.sh "brew install macvim" "gvim"
$INSTALL/install_or_skip.sh "brew install neovim" "nvim"
$INSTALL/install_or_skip.sh "brew install curl-openssl" "curl"
$INSTALL/install_or_skip.sh "brew install wget" "wget"
$INSTALL/install_or_skip.sh "brew install llvm" "clangd"
$INSTALL/install_or_skip.sh "brew install cmake" "cmake"
$INSTALL/install_or_skip.sh "brew install unzip" "unzip"
$INSTALL/install_or_skip.sh "brew install zip" "zip"
$INSTALL/install_or_skip.sh "brew install bzip2" "bzip2"
$INSTALL/install_or_skip.sh "brew install p7zip" "7z"

# python3
$INSTALL/install_or_skip.sh "brew install python3" "python3"

# nodejs
$INSTALL/install_or_skip.sh "brew install node" "node"

# ctags
$INSTALL/install_or_skip.sh "brew install --HEAD universal-ctags/universal-ctags/universal-ctags" "ctags"
