#!/usr/bin/env bash

echo "[lin-vim] Install for Ubuntu"

# Prepare Environment
DEVIMRC=~/.devimrc
touch $DEVIMRC
touch ~/.zshrc
touch ~/.bashrc

## Software
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get install build-essential net-tools sysstat -y
sudo apt-get install git vim vim-gtk curl wget zsh apport unzip unrar -y
sudo apt-get install gcc g++ autoconf automake cmake bc clang-format -y
sudo apt-get install openssh-server libssl-dev libcrypto++-dev -y
sudo apt-get install default-jdk maven gradle mariadb-client mariadb-server -y
sudo apt-get install cscope silversearcher-ag exuberant-ctags -y
sudo apt-get install nodejs npm libnss3-tools -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install python python-dev python-pip -y
sudo apt-get install python3 python3-dev python3-pip -y
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8
sudo pip3 install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8
npm install -g js-beautify standard eslint xo typescript-formatter sass ruby-beautify remark-cli
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo service ssh start
sudo service mysql start

# Vim Plugins
mkdir -p ~/.vim/bundle
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim +silent! +PlugInstall +qall
cd ~/.vim/plugged/YouCompleteMe
python install.py --clang-completer --tern-completer

# Oh-My-Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "[lin-vim] oh-my-zsh already installed"
fi
cp ~/.zshrc ~/.zshrc.old
sed 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g' ~/.zshrc > ~/.zshrc.temp.$$
mv ~/.zshrc.temp.$$ ~/.zshrc

# Powerline-Fonts
if [[ ! -d ~/.vim/.powerline-fonts ]]; then
    git clone https://github.com/powerline/fonts.git --depth=1 ~/.vim/.powerline-fonts
else
    cd ~/.vim/.powerline-fonts
    git pull origin master
fi
cd ~/.vim/.powerline-fonts
./install.sh

# Variable 
mkdir -p ~/.ssh
mkdir -p ~/devops
mkdir -p ~/devops/practice
mkdir -p ~/devops/project
echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> $DEVIMRC
echo "export PATH=\$PATH:~/.vim/commands" >> $DEVIMRC
echo "alias l=\"ls -la\"" >> $DEVIMRC
echo "alias ll=\"ls -l\"" >> $DEVIMRC
echo "ulimit -c unlimited" >> $DEVIMRC
echo "source $DEVIMRC" >> ~/.zshrc
echo "source $DEVIMRC" >> ~/.bashrc
source $DEVIMRC 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
source ~/.bashrc 1>/dev/null 2>&1

