#!/usr/bin/env bash

echo "[devim] install macOS"


# Prepare Environment

DEVIMRC=~/.devimrc
touch $DEVIMRC

# Software

if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brew install curl wget clang gcc g++ autoconf automake cmake
brew install golang golang-go golang-src -y
brew install python python3 gperftools jemalloc glog -y
brew install libevent boost openssh openssl cryptopp leveldb -y

# tools
brew tap caskroom/versions
brew cask install java8
brew install git vim macvim zsh maven gradle
brew install cscope the_silver_searcher ctags
brew install nodejs npm bc unzip unrar
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint requests Scrapy Twisted
sudo pip3 install pyOpenSSL pyflakes pep8 flake8 pylint cpplint requests Scrapy Twisted
brew install mariadb redis mongodb

# Variable 

mkdir -p ~/.ssh
mkdir -p ~/devops
mkdir -p ~/devops/practice
mkdir -p ~/devops/project
mkdir -p ~/devops/go
mkdir -p ~/devops/go/src
mkdir -p ~/devops/go/bin
mkdir -p ~/devops/go/pkg
echo "alias vim=/usr/local/bin/vim" >> $DEVIMRC
echo "setopt HIST_IGNORE_ALL_DUPS" >> $DEVIMRC
echo "export PATH=\$PATH:/usr/local/opt/go/libexec/bin" >> $DEVIMRC
echo "export PATH=\$PATH:~/.vim/commands" >> $DEVIMRC
echo "export GOPATH=~/devops/go" >> $DEVIMRC
echo "export PATH=\$PATH:\$GOPATH/bin" >> $DEVIMRC
if [[ -d /Library/Java/JavaVirtualMachines ]]; then
    jdkhome=$(ls /Library/Java/JavaVirtualMachines | grep jdk | tail -n 1)
    if [[ "${jdkhome:0:3}" == "jdk" ]]; then
        sudo echo "export JAVA_HOME=/Library/Java/JavaVirtualMachines/$jdkhome/Contents/Home" >> $DEVIMRC
        sudo echo "export PATH=\$JAVA_HOME:\$PATH" >> $DEVIMRC
    else
        echo "[devim] WARNING: no \$JAVA_HOME is found"
    fi
else
    echo "[devim] WARNING: no \$JAVA_HOME is found"
fi
echo "alias l=\"ls -la\"" >> $DEVIMRC
echo "alias ll=\"ls -l\"" >> $DEVIMRC
echo "ulimit -c unlimited" >> $DEVIMRC
echo "source $DEVIMRC" >> ~/.zshrc
echo "source $DEVIMRC" >> ~/.bashrc
source $DEVIMRC 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
source ~/.bashrc 1>/dev/null 2>&1


# Third Party Software

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vim/devim.vim ~/.vimrc
vim +silent! +PluginInstall! +qall
cd ~/.vim/bundle/YouCompleteMe
python install.py --clang-completer --gocode-completer --tern-completer

if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "[devim] oh-my-zsh already installed"
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
