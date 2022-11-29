#!/bin/bash

INSTALL_HOME=~/.vim/installer
OPT_DISABLE_VIM=$1
OPT_DISABLE_NEOVIM=$2
source $INSTALL_HOME/util.sh

message "install dependencies with brew"
brew update

# vim
if [ $OPT_DISABLE_VIM -ne 1 ]; then
    install_or_skip "brew install macvim" "gvim"
fi
# neovim
if [ $OPT_DISABLE_NEOVIM -ne 1 ]; then
    install_or_skip "brew install neovim" "nvim"
fi
install_or_skip "brew install curl" "curl"
install_or_skip "brew install wget" "wget"
install_or_skip "brew install cmake" "cmake"
install_or_skip "brew install pkg-config" "pkg-config"

# python3
install_or_skip "brew install python3" "python3"

# nodejs
install_or_skip "brew install node" "node"

# ctags
install_or_skip "brew install universal-ctags" "ctags"
