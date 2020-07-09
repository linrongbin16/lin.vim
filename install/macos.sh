#!/usr/bin/env bash

brew upgrade
brew install macvim
brew install neovim
brew install zsh
brew install curl
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

# Path
touch ~/.linvimrc
touch ~/.zshrc
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "setopt HIST_IGNORE_ALL_DUPS" >> ~/.linvimrc
echo "defaults write com.apple.finder AppleShowAllFiles TRUE" >> ~/.linvimrc
echo "alias vim=/usr/local/bin/vim" >> ~/.linvimrc
echo "export PATH=/usr/local/opt/llvm/bin:\$PATH" >> ~/.linvimrc
