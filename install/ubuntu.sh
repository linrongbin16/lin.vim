#!/usr/bin/env bash

echo "[lin-vim] Install for Ubuntu"

# Prepare Environment
LINVIMRC=~/.linvimrc
if [ -f $LINVIMRC ]; then
    rm $LINVIMRC
fi
touch $LINVIMRC
touch ~/.bashrc
touch ~/.zshrc


# Software Dependency
if [ "$(whoami)" == "root" ]; then
    apt update -y
    apt install sudo -y
fi
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt install git vim vim-gtk curl wget apport zsh -y
sudo apt install gcc g++ clang autoconf automake cmake bc clang-format -y
sudo apt install pkg-config libpcre3-dev zlib1g-dev liblzma-dev -y
sudo apt install libssl-dev libcrypto++-dev openssh-server -y
sudo apt install default-jdk golang golang-src golang-go golang-doc -y
sudo apt install silversearcher-ag unzip bzip2 unrar -y
sudo apt install nodejs npm libnss3-tools -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt install python3 python3-dev python3-pip -y
sudo pip3 install pyOpenSSL pyflakes pep8 flake8 pylint cpplint autopep8 pathlib autopep8 yapf
sudo npm install js-beautify standard eslint xo typescript-formatter sass remark-cli -g
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

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

# Maven Gradle
maven_version=3.5.4
wget http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${maven_version}/binaries/apache-maven-${maven_version}-bin.tar.gz
tar -zxvf apache-maven-${maven_version}-bin.tar.gz
if [ -d /opt/maven ]; then
    sudo rm -rf /opt/maven
fi
sudo mkdir -p /opt/maven
sudo mv apache-maven-${maven_version} /opt/maven
rm -rf apache-maven-${maven_version}-bin.tar.gz
gradle_version=4.9
wget https://services.gradle.org/distributions/gradle-${gradle_version}-bin.zip
unzip gradle-${gradle_version}-bin.zip -d gradle-${gradle_version}-bin
if [ -d /opt/gradle ]; then
    sudo rm -rf /opt/gradle
fi
sudo mkdir -p /opt/gradle
sudo mv gradle-${gradle_version}-bin/gradle-${gradle_version} /opt/gradle
rm -rf gradle-${gradle_version}-bin.zip
rm -rf gradle-${gradle_version}-bin

# Universal Ctags
git clone https://github.com/universal-ctags/ctags.git universal-ctags
cd universal-ctags
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
python3 install.py --clang-completer --go-completer --java-completer --js-completer

# Install GuiFonts
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
cd ~/.vim/guifonts
find_command="find $HOME/.vim/guifonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Install PowerlineFonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

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
if [ -d /usr/lib/jvm ]; then
    javahome=$(ls /usr/lib/jvm | grep openjdk | grep java | tail -n 1)
    if [ "${javahome:0:4}" == "java" ]; then
        echo "export JAVA_HOME=/usr/lib/jvm/$javahome" >> $LINVIMRC
        echo "export CLASSPATH=.:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar" >> $LINVIMRC
    else
        echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
    fi
else
    echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
fi
echo "export GOPATH=~/go" >> $LINVIMRC
echo "export PATH=\$PATH:\$GOPATH/bin" >> $LINVIMRC
echo "export PATH=\$PATH:\$GOROOT/bin" >> $LINVIMRC
echo "export PATH=\$PATH:/opt/maven/apache-maven-${maven_version}/bin" >> $LINVIMRC
echo "export PATH=\$PATH:/opt/gradle/gradle-${gradle_version}/bin" >> $LINVIMRC
echo "alias l=\"ls -la\"" >> $LINVIMRC
echo "alias ll=\"ls -l\"" >> $LINVIMRC
echo "ulimit -c unlimited" >> $LINVIMRC
echo "source $LINVIMRC" >> ~/.bashrc
echo "source $LINVIMRC" >> ~/.zshrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
