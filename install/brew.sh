#!/bin/bash

INSTALL_HOME=~/.vim/install
source $INSTALL_HOME/util.sh

message "install dependencies with brew"

brew update

# vim and neovim
install_or_skip "brew install macvim" "gvim"
install_or_skip "brew install neovim" "nvim"
install_or_skip "brew install curl-openssl" "curl"
install_or_skip "brew install wget" "wget"
install_or_skip "brew install cmake" "cmake"
install_or_skip "brew install pkg-config" "pkg-config"

# python3
install_or_skip "brew install python3" "python3"

# nodejs
install_or_skip "brew install node" "node"

# ctags
install_or_skip "brew install --HEAD universal-ctags/universal-ctags/universal-ctags" "ctags"
