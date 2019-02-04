#!/usr/bin/env bash

echo "[lin-vim] Install for MacOS"


# Prepare Environment
LINVIMRC=~/.linvimrc
if [ -f $LINVIMRC ]; then
    rm $LINVIMRC
fi
touch $LINVIMRC
touch ~/.bashrc
touch ~/.zshrc

# Software Dependency
brew update
brew upgrade
brew install git vim macvim zsh
brew install curl wget clang gcc g++ autoconf automake cmake clang clang-format
brew install pkg-config openssl openssh cryptopp
brew install the_silver_searcher unzip bzip2 unrar bc
brew install python3
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint

# Git Config
git config core.filemode false
git config core.longpaths true
git config push.default simple
git config pull.default simple
git config core.editor vim
git config credential.helper store
git config --global core.filemode false
git config --global core.longpaths true
git config --global push.default simple
git config --global pull.default simple
git config --global core.editor vim
git config --global credential.helper store

# Universal Ctags
if [ ! -d universal-ctags ]; then
    git clone https://github.com/universal-ctags/ctags.git universal-ctags
fi
cd universal-ctags
git pull
./autogen.sh
./configure
make
sudo make install
cd ..

# Vim Plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer --system-libclang

# Install GuiFonts
font_dir="$HOME/Library/Fonts"
mkdir -p $font_dir
cd ~/.vim/guifonts
find_command="find $HOME/.vim/guifonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Path Variable
mkdir -p ~/.ssh
mkdir -p ~/workspace
mkdir -p ~/workspace/practice
mkdir -p ~/workspace/project
echo "alias vim=/usr/local/bin/vim" >> $LINVIMRC
echo "setopt HIST_IGNORE_ALL_DUPS" >> $LINVIMRC
echo "alias l=\"ls -la\"" >> $LINVIMRC
echo "alias ll=\"ls -l\"" >> $LINVIMRC
echo "ulimit -c unlimited" >> $LINVIMRC
echo "source $LINVIMRC" >> ~/.bashrc
echo "source $LINVIMRC" >> ~/.zshrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
