#!/usr/bin/env bash

echo "[lin-vim] Install for MacOS"


# Prepare Environment

LINVIMRC=~/.linvimrc
touch $LINVIMRC
touch ~/.bashrc
touch ~/.zshrc

# Software
if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade
brew install curl wget clang gcc g++ autoconf automake cmake
brew install openssh openssl cryptopp zsh
brew install git vim macvim
brew install cscope the_silver_searcher
brew install nodejs npm bc unzip unrar golang
brew tap caskroom/versions
brew cask install java8 maven gradle
brew install python
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint requests autopep8 pathlib
sudo npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli

# Git Config
git config core.filemode false
git config push.default simple
git config pull.default simple
git config core.editor vim

# Maven Gradle
maven_version=3.5.4
wget http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${maven_version}/binaries/apache-maven-${maven_version}-bin.tar.gz
tar -zxvf apache-maven-${maven_version}-bin.tar.gz
sudo mkdir -p /opt/maven
sudo mv apache-maven-${maven_version} /opt/maven
rm -rf apache-maven-${maven_version}-bin.tar.gz
gradle_version=4.9
wget https://services.gradle.org/distributions/gradle-${gradle_version}-bin.zip
unzip gradle-${gradle_version}-bin.zip -d gradle-${gradle_version}-bin
sudo mkdir -p /opt/gradle
sudo mv gradle-${gradle_version}-bin/gradle-${gradle_version} /opt/gradle
rm -rf gradle-${gradle_version}-bin.zip
rm -rf gradle-${gradle_version}-bin

# Universal Ctags
git clone https://github.com/universal-ctags/ctags.git universal-ctags
cd ctags
./autogen.sh
./configure
make
sudo make install
rm -rf universal-ctags

# Vim Plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin-vim.vimrc ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python install.py --clang-completer --go-completer --java-completer

# Install Monaco
font_dir="$HOME/Library/Fonts"
mkdir -p $font_dir
cd ~/.vim/guifonts
find_command="find $HOME/.vim/guifonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Variable 
mkdir -p ~/.ssh
mkdir -p ~/workspace
mkdir -p ~/workspace/practice
mkdir -p ~/workspace/project
mkdir -p ~/go/bin
mkdir -p ~/go/src
mkdir -p ~/go/pkg
echo "alias vim=/usr/local/bin/vim" >> $LINVIMRC
echo "setopt HIST_IGNORE_ALL_DUPS" >> $LINVIMRC
echo "export PATH=\$PATH:/usr/local/opt/go/libexec/bin" >> $LINVIMRC
if [ -d /Library/Java/JavaVirtualMachines ]; then
    jdkhome=$(ls /Library/Java/JavaVirtualMachines | grep jdk | tail -n 1)
    if [ "${jdkhome:0:3}" == "jdk" ]; then
        echo "export JAVA_HOME=/Library/Java/JavaVirtualMachines/$jdkhome/Contents/Home" >> $LINVIMRC
        echo "export PATH=\$JAVA_HOME:\$PATH" >> $LINVIMRC
    else
        echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
    fi
else
    echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
fi
echo "alias l=\"ls -la\"" >> $LINVIMRC
echo "alias ll=\"ls -l\"" >> $LINVIMRC
echo "export GOPATH=~/go" >> $LINVIMRC
echo "export PATH=\$PATH:\$GOPATH/bin" >> $LINVIMRC
echo "export PATH=\$PATH:/opt/maven/apache-maven-${maven_version}/bin" >> $LINVIMRC
echo "export PATH=\$PATH:/opt/gradle/gradle-${gradle_version}/bin" >> $LINVIMRC
echo "ulimit -c unlimited" >> $LINVIMRC
echo "source $LINVIMRC" >> ~/.bashrc
echo "source $LINVIMRC" >> ~/.zshrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
