#!/usr/bin/env bash

VIM_HOME=$1
INSTALL_HOME=$2
UNIVERSAL_CTAGS=$VIM_HOME/universal-ctags

cd $VIM_HOME
git clone https://github.com/universal-ctags/ctags.git $UNIVERSAL_CTAGS
cd $UNIVERSAL_CTAGS
./autogen.sh
./configure
make
sudo make install
