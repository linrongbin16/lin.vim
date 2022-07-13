#!/usr/bin/env bash

VIM=$HOME/.vim
INSTALL=$VIM/install
UNIVERSAL_CTAGS=$VIM/universal-ctags

cd $VIM
git clone https://github.com/universal-ctags/ctags.git $UNIVERSAL_CTAGS
cd $UNIVERSAL_CTAGS
./autogen.sh
./configure
make
sudo make install
