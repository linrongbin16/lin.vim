#!/usr/bin/env bash

echo "[lin-vim] install ubuntu"


# Prepare Environment

DEVIMRC=~/.devimrc
touch $DEVIMRC

## Software

sudo add-apt-repository ppa:hzwhuang/ss-qt5 -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
dpkg --list | grep linux | while read eachline
do
    flag=$(echo -e "$eachline" | awk '{print $1}')
    if [[ "$flag" == "rc" ]]; then
        package=$(echo -e  "$eachline" | awk '{print $2}')
        sudo apt-get purge "$package" -y
    fi
done
sudo apt-get install build-essential net-tools -y
sudo apt-get install git vim vim-gtk curl wget sqlite3 zsh apport unzip unrar sysstat -y
sudo apt-get install gcc g++ clang autoconf automake cmake bc -y
sudo apt-get install golang golang-go golang-src -y
sudo apt-get install libgoogle-perftools-dev google-perftools libjemalloc-dev libgoogle-glog-dev -y
sudo apt-get install libevent-dev libboost-all-dev openssh-server libssl-dev libcrypto++-dev -y
sudo apt-get install libmysqlclient-dev libmysql++-dev libmysqlcppconn-dev -y
sudo apt-get install libhiredis-dev libmongo-client-dev libsqlite3-dev libleveldb-dev -y
sudo apt-get install protobuf-compiler thrift-compiler icu-devtools libicu-dev -y
sudo apt-get install default-jdk maven gradle -y
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install mariadb-client mariadb-server -y
sudo apt-get install redis-server redis-tools mongodb mongodb-clients mongo-tools -y
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
sudo apt-get install ibus ibus-rime librime-data-pinyin-simp -y shadowsocks-qt5 -y
sudo apt-get install python python-dev python-pip -y
sudo apt-get install python3 python3-dev python3-pip -y
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL requests Scrapy Twisted
sudo pip3 install pyOpenSSL pyflakes pep8 flake8 pylint cpplint pyOpenSSL requests Scrapy Twisted
sudo apt-get install cscope silversearcher-ag exuberant-ctags -y
sudo apt-get install nodejs npm libnss3-tools -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo service ssh start
sudo service mysql start
sudo service redis start
sudo service mongodb start

# Variable 

mkdir -p ~/.ssh
mkdir -p ~/devops
mkdir -p ~/devops/practice
mkdir -p ~/devops/project
mkdir -p ~/devops/go
mkdir -p ~/devops/go/src
mkdir -p ~/devops/go/bin
mkdir -p ~/devops/go/pkg
echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> $DEVIMRC
echo "export PATH=\$PATH:~/.vim/commands" >> $DEVIMRC
echo "export GOPATH=~/devops/go" >> $DEVIMRC
echo "export PATH=\$PATH:\$GOPATH/bin" >> $DEVIMRC
echo "alias l=\"ls -la\"" >> $DEVIMRC
echo "alias ll=\"ls -l\"" >> $DEVIMRC
echo "ulimit -c unlimited" >> $DEVIMRC
echo "source $DEVIMRC" >> ~/.zshrc
echo "source $DEVIMRC" >> ~/.bashrc
source $DEVIMRC 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
source ~/.bashrc 1>/dev/null 2>&1

# Vim Plugins

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim +silent! +PluginInstall! +qall
cd ~/.vim/bundle/YouCompleteMe
python install.py --clang-completer --gocode-completer --tern-completer

# Oh-my-zsh

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
