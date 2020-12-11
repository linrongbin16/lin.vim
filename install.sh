#!/usr/bin/env bash

set -x

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
    elif cat /etc/*release | grep ^NAME | grep Debian 1>/dev/null 2>&1; then
        check_sudo "Debian"
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

# install hack nerd font
if [ $(uname) == "Darwin" ]; then
    cd ~/Library/Fonts
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font
else
    mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    FONT_REGULAR="Hack_Regular_Nerd_Font_Complete_Mono.ttf"
    FONT_ITALIC="Hack_Italic_Nerd_Font_Complete_Mono.ttf"
    FONT_BOLD="Hack_Bold_Nerd_Font_Complete_Mono.ttf"
    FONT_BOLD_ITALIC="Hack_Bold_Italic_Nerd_Font_Complete_Mono.ttf"
    if [ ! -f "$FONT_REGULAR" ]; then
        curl -fLo $FONT_REGULAR https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_REGULAR
    fi
    if [ ! -f "$FONT_ITALIC" ]; then
        curl -fLo $FONT_ITALIC https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_ITALIC
    fi
    if [ ! -f "$FONT_BOLD" ]; then
        curl -fLo $FONT_BOLD https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_BOLD
    fi
    if [ ! -f "$FONT_BOLD_ITALIC" ]; then
        curl -fLo $FONT_BOLD_ITALIC https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_BOLD_ITALIC
    fi
fi

# install vim-plug
if [ -f ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

# install user custom
cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json

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
cp ~/.vim/linvimrc.sh ~/.linvimrc
touch ~/.zshrc
echo "source ~/.linvimrc" >> ~/.zshrc
chsh -s $(which zsh)
source ~/.zshrc 1>/dev/null 2>&1
