#!/usr/bin/env bash

echo "[lin-vim] Install for Ubuntu"

# Prepare Environment
DEVIMRC=~/.devimrc
touch $DEVIMRC
touch ~/.zshrc
touch ~/.bashrc

## Software
sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get install git vim vim-gtk curl wget zsh apport unzip unrar -y
sudo apt-get install gcc g++ autoconf automake cmake bc clang-format -y
sudo apt-get install libssl-dev libcrypto++-dev -y
sudo apt-get install default-jdk maven gradle -y
sudo apt-get install cscope silversearcher-ag exuberant-ctags -y
sudo apt-get install nodejs npm libnss3-tools -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install python python-dev python-pip -y
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL autopep8
npm install -g js-beautify standard eslint xo typescript-formatter sass ruby-beautify remark-cli
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# Vim Plugins
curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python install.py --clang-completer --js-completer

# Oh-My-Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "[lin-vim] oh-my-zsh already installed"
fi
cp ~/.zshrc ~/.zshrc.old
cp ~/.vim/install/lin-agnoster.zsh-theme ~/.oh-my-zsh/theme
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
echo "source $DEVIMRC" >> ~/.zshrc
echo "source $DEVIMRC" >> ~/.bashrc
source $DEVIMRC 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
source ~/.bashrc 1>/dev/null 2>&1
