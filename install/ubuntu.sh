#!/usr/bin/env bash

sudo echo "[lin-vim] Install for Ubuntu" || { echo "[lin-vim] sudo not found"; exit 1; }

# Prepare Environment
LINVIMRC=~/.linvimrc
if [ -f $LINVIMRC ]; then
    rm $LINVIMRC
fi
touch $LINVIMRC
touch ~/.bashrc
touch ~/.zshrc


# Software Dependency
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y
sudo apt-get install -y git vim vim-gtk libcanberra-gtk-module curl wget zsh
sudo apt-get install -y gcc g++ clang autoconf automake cmake clang-format pkg-config build-essential
sudo apt-get install -y libssl-dev openssh-server libcrypto++-dev
sudo apt-get install -y golang golang-src golang-go golang-doc
sudo apt-get install -y silversearcher-ag unzip bzip2 unrar shadowsocks bc
sudo apt-get install -y python3 python3-dev python3-pip nodejs npm
sudo pip3 install pyOpenSSL pyflakes pep8 flake8 pylint cpplint autopep8 pathlib autopep8 yapf
sudo npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli tern typescript
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# SSH Server config
eval `ssh-agent -s`

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
rm -rf universal-ctags

# Vim Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer --go-completer --js-completer --system-libclang

# Install GuiFonts
font_dir="$HOME/.local/share/fonts"
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
mkdir -p ~/go/src
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
echo "export GOPATH=~/go" >> $LINVIMRC
echo "export PATH=\$PATH:\$GOPATH/bin" >> $LINVIMRC
echo "export PATH=\$PATH:\$GOROOT/bin" >> $LINVIMRC
echo "alias l=\"ls -la\"" >> $LINVIMRC
echo "alias ll=\"ls -l\"" >> $LINVIMRC
echo "ulimit -c unlimited" >> $LINVIMRC
echo "source $LINVIMRC" >> ~/.bashrc
echo "source $LINVIMRC" >> ~/.zshrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
