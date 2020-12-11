#!/usr/bin/env bash

brew upgrade
export HOMEBREW_NO_AUTO_UPDATE=1
brew install macvim
brew install neovim
if [ ! -f /bin/zsh ]; then
    brew install zsh
fi
brew install curl-openssl
brew install wget
brew install llvm
brew install autoconf
brew install automake
brew install cmake
brew install clang-format
brew install the_silver_searcher
brew install ripgrep
brew install unzip
brew install zip
brew install p7zip
brew install python3

# Node
brew install node

# Ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
