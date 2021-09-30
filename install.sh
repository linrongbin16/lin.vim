#!/usr/bin/env bash

function check_download() {
    if [ $1 -ne 0 ]; then
        echo "[lin.vim] Download \"$2\" failed! Please check your network and try again."
        exit 3
    fi
}

function check_sudo() {
    sudo echo "[lin.vim] Install for $1" || { echo "[lin.vim] sudo not found"; exit 1; }
}

# backup old .linvimrc
if [ -f ~/.linvimrc ]; then
    LINVIMRC_BAK=~/.linvimrc.$(date +%s).bak
    echo "[lin.vim] back up .linvimrc to $LINVIMRC_BAK"
    mv ~/.linvimrc $LINVIMRC_BAK
fi

if [ $(uname) == "Linux" ]; then
    if cat /etc/*release | grep ^NAME | grep Ubuntu 1>/dev/null 2>&1; then
        check_sudo "Ubuntu"
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Fedora 1>/dev/null 2>&1; then
        check_sudo "Fedora"
        bash ~/.vim/install/fedora.sh
    elif cat /etc/*release | grep ^NAME | grep Manjaro 1>/dev/null 2>&1; then
        check_sudo "Manjaro"
        bash ~/.vim/install/manjaro.sh
    else
        echo "[lin.vim] OS not support, exiting installation!"
        exit 3
    fi
elif [ $(uname) == "FreeBSD" ]; then
    check_sudo "FreeBSD"
    bash ~/.vim/install/bsd.sh
elif [ $(uname) == "Darwin" ]; then
    check_sudo "MacOS"
    bash ~/.vim/install/macos.sh
else
    echo "[lin.vim] Unknown OS $(uname), exiting installation!"
    exit 3
fi

# install python3 pip packages
sudo pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim

# install nodejs npm packages
sudo npm install -g yarn prettier

# install hack nerd font
if [ $(uname) == "Darwin" ]; then
    cd ~/Library/Fonts
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
else
    mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    if [ ! -f Hack.zip ]; then
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    fi
    check_download $? "Hack Nerd Fonts"
    unzip -o Hack.zip
fi

# install vim-plug
if [ -f ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

# install user custom
cp ~/.vim/template/vim-plug-template.vim ~/.vim/vim-plug.vim
cp ~/.vim/template/user-settings-template.vim ~/.vim/user-settings.vim
cp ~/.vim/template/coc-settings-template.json ~/.vim/coc-settings.json

# install neovim config
mkdir -p ~/.config
if [ -d ~/.config/nvim ]; then
    rm ~/.config/nvim
fi
ln -s ~/.vim ~/.config/nvim
if [ -f ~/.config/nvim/init.vim ]; then
    rm ~/.config/nvim/init.vim
fi
ln -s ~/.vim/lin.vim ~/.config/nvim/init.vim


# install environment
cp ~/.vim/template/linvimrc-template.sh ~/.linvimrc
touch ~/.zshrc
echo "source ~/.linvimrc" >> ~/.zshrc
chsh -s $(which zsh)
source ~/.zshrc 1>/dev/null 2>&1
