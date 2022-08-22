#!/bin/bash

VIM=$HOME/.vim
INSTALL=$VIM/install
NEOVIM=$VIM/neovim

$INSTALL/msg.sh "install neovim from source..."
cd $VIM
git clone https://github.com/neovim/neovim.git $NEOVIM
cd $NEOVIM
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
