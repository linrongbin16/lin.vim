#!/usr/bin/env bash

echo "[lin-vim] Install for MacOS"


# Prepare Environment

DEVIMRC=~/.devimrc
touch $DEVIMRC
touch ~/.zshrc
touch ~/.bashrc

# Software
if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade
brew install curl wget clang gcc g++ autoconf automake cmake
brew install openssh openssl cryptopp
brew install git vim macvim zsh maven gradle
brew install cscope the_silver_searcher ctags
brew install nodejs npm bc unzip unrar
brew tap caskroom/versions
brew cask install java8
brew install python
sudo pip install pyOpenSSL pyflakes pep8 flake8 pylint cpplint requests autopep8
npm install -g js-beautify standard eslint xo typescript-formatter sass remark-cli

# Vim Plugin
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
echo "alias vim=/usr/local/bin/vim" >> $DEVIMRC
echo "setopt HIST_IGNORE_ALL_DUPS" >> $DEVIMRC
echo "export PATH=\$PATH:/usr/local/opt/go/libexec/bin" >> $DEVIMRC
echo "export PATH=\$PATH:~/.vim/commands" >> $DEVIMRC
if [[ -d /Library/Java/JavaVirtualMachines ]]; then
    jdkhome=$(ls /Library/Java/JavaVirtualMachines | grep jdk | tail -n 1)
    if [[ "${jdkhome:0:3}" == "jdk" ]]; then
        sudo echo "export JAVA_HOME=/Library/Java/JavaVirtualMachines/$jdkhome/Contents/Home" >> $DEVIMRC
        sudo echo "export PATH=\$JAVA_HOME:\$PATH" >> $DEVIMRC
    else
        echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
    fi
else
    echo "[lin-vim] WARNING: no \$JAVA_HOME is found"
fi
echo "alias l=\"ls -la\"" >> $DEVIMRC
echo "alias ll=\"ls -l\"" >> $DEVIMRC
echo "ulimit -c unlimited" >> $DEVIMRC
echo "source $DEVIMRC" >> ~/.zshrc
echo "source $DEVIMRC" >> ~/.bashrc
source $DEVIMRC 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
source ~/.bashrc 1>/dev/null 2>&1

