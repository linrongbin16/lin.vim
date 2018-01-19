#!/usr/bin/env bash

echo "[lin-vim] Install for Ubuntu"

# Prepare Environment
LINVIMRC=~/.linvimrc
touch $LINVIMRC
touch ~/.bashrc
touch ~/.zshrc


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
sudo apt-get install git vim vim-gtk curl wget apport unzip unrar zsh -y
sudo apt-get install gcc g++ autoconf automake cmake bc clang-format -y
sudo apt-get install libssl-dev libcrypto++-dev -y
sudo apt-get install default-jdk golang-go golang-src golang -y
sudo apt-get install cscope silversearcher-ag exuberant-ctags -y
sudo apt-get install nodejs npm libnss3-tools -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install python python-dev python-pip -y
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8
sudo npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# Git Config
git config --global core.filemode false
git config --global push.default simple
git config --global pull.default simple
git config --global core.editor vim

# Vim Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python install.py --clang-completer --go-completer --js-completer

# Install Monaco
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
cd ~/.vim/guifonts
find_command="find $HOME/.vim/guifonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Variable
cd ~/.vim/commands
chmod +x *
mkdir -p ~/.ssh
mkdir -p ~/workspace
mkdir -p ~/workspace/practice
mkdir -p ~/workspace/project
mkdir -p ~/go/src
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
if [[ -d /usr/lib/jvm ]]; then
    javahome=$(ls /usr/lib/jvm | grep openjdk | grep java | tail -n 1)
    if [[ "${javahome:0:4}" == "java" ]]; then
        echo "export JAVA_HOME=/usr/lib/jvm/$javahome" >> $LINVIMRC
        echo "export CLASSPATH=.:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar" >> $LINVIMRC
    else
        echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
    fi
else
    echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
fi
echo "export CLASSPATH=.:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar" >> $LINVIMRC
echo "export GOPATH=~/go" >> $LINVIMRC
echo "export PATH=\$PATH:~/.vim/commands" >> $LINVIMRC
echo "export PATH=\$PATH:\$GOPATH/bin" >> $LINVIMRC
echo "export PATH=\$PATH:\$GOROOT/bin" >> $LINVIMRC
echo "alias l=\"ls -la\"" >> $LINVIMRC
echo "alias ll=\"ls -l\"" >> $LINVIMRC
echo "ulimit -c unlimited" >> $LINVIMRC
echo "source $LINVIMRC" >> ~/.bashrc
echo "source $LINVIMRC" >> ~/.zshrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
