#!/usr/bin/env bash

echo "[lin-vim] Install for Ubuntu"

# Prepare Environment
DEVIMRC=~/.devimrc
touch $DEVIMRC
touch ~/.bashrc


## Software
if [[ "$(whoami)" == "root" ]]; then
    apt-get update -y
    apt-get install sudo -y
fi
sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get install git vim vim-gtk curl wget fish apport unzip unrar -y
sudo apt-get install gcc g++ autoconf automake cmake bc clang-format -y
sudo apt-get install libssl-dev libcrypto++-dev -y
sudo apt-get install default-jdk maven gradle -y
sudo apt-get install cscope silversearcher-ag exuberant-ctags -y
sudo apt-get install nodejs npm libnss3-tools -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install python python-dev python-pip -y
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8
sudo npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# Vim Plugins
sudo curl -fLo /usr/share/vim/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python install.py --clang-completer --js-completer

# Install Monaco
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
cd ~/.vim/guifonts
find_command="find $HOME/.vim/guifonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Variable
cd ~/.vim/commands
chmod +x *
mkdir -p ~/.ssh
mkdir -p ~/devops
mkdir -p ~/devops/practice
mkdir -p ~/devops/project
echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> $DEVIMRC
echo "export PATH=\$PATH:~/.vim/commands" >> $DEVIMRC
echo "alias l=\"ls -la\"" >> $DEVIMRC
echo "alias ll=\"ls -l\"" >> $DEVIMRC
echo "ulimit -c unlimited" >> $DEVIMRC
echo "source $DEVIMRC" >> ~/.bashrc
source $DEVIMRC 1>/dev/null 2>&1
source ~/.bashrc 1>/dev/null 2>&1
