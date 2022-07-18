#!/bin/bash

VIM=$HOME/.vim
INSTALL=$VIM/install
CTAGS=$VIM/universal-ctags

$INSTALL/msg.sh "install universal-ctags from source..."
cd $VIM
git clone https://github.com/universal-ctags/ctags.git $CTAGS
cd $CTAGS
./autogen.sh
./configure
make
sudo make install
