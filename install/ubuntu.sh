#!/usr/bin/env bash

sudo echo "[lin-vim] Install for Ubuntu" || { echo "[lin-vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.bashrc
touch ~/.zshrc

# Software Dependency
sudo apt-get install -y git vim vim-gtk libcanberra-gtk-module curl wget zsh
sudo apt-get install -y gcc g++ clang autoconf automake cmake clang-format pkg-config build-essential
sudo apt-get install -y libssl-dev openssh-server libcrypto++-dev
sudo apt-get install -y silversearcher-ag unzip bzip2 unrar shadowsocks bc
sudo apt-get install -y python3 python3-dev python3-pip nodejs nodejs-dev node-gyp libssl1.0-dev npm
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint sqlparse sqlformat
sudo npm install -g --unsafe-perm js-beautify eslint tslint typescript-formatter
if [ -d ~/.config ]; then
    sudo chmod -R +rwx ~/.config
    sudo chown -R $USER ~/.config
fi
cd ~/.vim
if [ ! -d universal-ctags ]; then
    git clone https://github.com/universal-ctags/ctags.git universal-ctags
fi
cd universal-ctags
git pull
./autogen.sh
./configure
make
sudo make install

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

# Vim Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer --system-libclang

# GuiFonts
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
cd ~/.vim/guifonts
find_command="find $HOME/.vim/guifonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "alias l=\"ls -lhS\"" >> ~/.linvimrc
echo "alias ll=\"ls -lahS\"" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
echo "source /home/$(whoami)/.linvimrc" >> ~/.zshrc
echo "[[ -s \"/home/$(whoami)/.linvimrc\" ]] && source \"/home/$(whoami)/.linvimrc\"" >> ~/.zshrc
echo "source /home/$(whoami)/.linvimrc" >> ~/.bashrc
echo "[[ -s \"/home/$(whoami)/.linvimrc\" ]] && source \"/home/$(whoami)/.linvimrc\"" >> ~/.bashrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
