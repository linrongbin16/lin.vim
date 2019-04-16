#!/usr/bin/env bash

sudo echo "[lin-vim] Install for Manjaro" || { echo "[lin-vim] sudo not found"; exit 1; }

# Prepare Environment
LINVIMRC=~/.linvimrc
if [ -f $LINVIMRC ]; then
    rm $LINVIMRC
fi
touch $LINVIMRC
touch ~/.bashrc
touch ~/.zshrc

# Software Dependency
sudo pacman -Syyu
yes | sudo pacman -Rs vim
yes | sudo pacman -S git gvim curl wget zsh
yes | sudo pacman -S gcc clang make autoreconf autoconf automake cmake pkg-config
yes | sudo pacman -S openssh openssl crypto++
yes | sudo pacman -S the_silver_searcher unrar unzip bzip2 shadowsocks-qt5 bc
yes | sudo pacman -S python python-pip nodejs npm universal-ctags
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint
sudo npm install -g --unsafe-perm js-beautify eslint tslint typescript-formatter remark-cli
sudo chmod -R +rwx ~/.npm
sudo chown -R $USER ~/.npm
sudo chmod -R +rwx ~/.config
sudo chown -R $USER ~/.config
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
git config core.longpaths false
git config push.default simple
git config pull.default simple
git config core.editor vim
git config credential.helper store
git config --global core.filemode false
git config --global core.longpaths false
git config --global push.default simple
git config --global pull.default simple
git config --global core.editor vim
git config --global credential.helper store

# Vim Plugins
cd ~/.vim
if [ ! -d vim-plug ]; then
    git clone https://github.com/junegunn/vim-plug.git
fi
cd vim-plug
mkdir -p ~/.vim/autoload
cp plug.vim ~/.vim/autoload/plug.vim
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
echo "alias l=\"ls -la\"" >> $LINVIMRC
echo "alias ll=\"ls -l\"" >> $LINVIMRC
echo "ulimit -c unlimited" >> $LINVIMRC
echo "export LANGUAGE='en_US.UTF-8'" >> $LINVIMRC
echo "source $LINVIMRC" >> ~/.bashrc
echo "source $LINVIMRC" >> ~/.zshrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
