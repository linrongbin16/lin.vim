#!/usr/bin/env bash

function check_fail() {
    if [ $1 -ne 0 ]; then
        echo "[lin.vim] Download \"$2\" failed! Please check your network and try again."
        exit 3
    fi
}

sudo echo "[lin.vim] Install for Manjaro" || { echo "[lin.vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    BAK=~/.linvimrc.$(date +%s).bak
    echo "[lin.vim] back up .linvimrc to $BAK"
    mv ~/.linvimrc $BAK
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
yes | sudo pacman -Rs vim
yes | sudo pacman -S git gvim neovim curl wget zsh ctags gcc clang make autoconf automake cmake openssh openssl crypto++
yes | sudo pacman -S the_silver_searcher ripgrep unrar unzip bzip2 zip p7zip python python-pip nodejs npm
sudo pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim

# GUI fonts
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
FONTR="Hack Regular Nerd Font Complete Mono.ttf"
FONTI="Hack Italic Nerd Font Complete Mono.ttf"
FONTB="Hack Bold Nerd Font Complete Mono.ttf"
FONTBI="Hack Bold Italic Nerd Font Complete Mono.ttf"
if [ ! -f $FONTR ]; then
    curl -fLo $FONTR https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
    check_fail $? $FONTR
fi
if [ ! -f $FONTI ]; then
    curl -fLo $FONRI https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
    check_fail $? $FONRI
fi
if [ ! -f $FONTB ]; then
    curl -fLo $FONTB https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
    check_fail $? $FONTB
fi
if [ ! -f $FONTBI ]; then
    curl -fLo $FONTBI https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
    check_fail $? $FONTBI
fi

# Vim Plugins
mkdir ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
check_fail $? "vim-plug"
ln -s ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

# Oh-My-Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    check_fail $? "oh-my-zsh"
fi

# User Custom
cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json

# neovim
mkdir -p ~/.config
if [ -f ~/.config/nvim ]; then
    rm -rf ~/.config/nvim
fi
if [ -f ~/.config/nvim/init.vim ]; then
    rm -rf ~/.config/nvim/init.vim
fi
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/lin.vim ~/.config/nvim/init.vim

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "alias l=\"ls -lh\"" >> ~/.linvimrc
echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
echo "export PATH=~/.vim/command:\$PATH" >> ~/.linvimrc

echo "source ~/.linvimrc" >> ~/.zshrc
source ~/.zshrc 1>/dev/null 2>&1
