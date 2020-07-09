#!/usr/bin/env bash

function check_fail() {
    if [ $1 -ne 0 ]; then
        echo "[lin.vim] Download \"$2\" failed! Please check your network and try again."
        exit 3
    fi
}

sudo echo "[lin.vim] Install for Fedora" || { echo "[lin.vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    BAK=~/.linvimrc.$(date +%s).bak
    echo "[lin.vim] back up .linvimrc to $BAK"
    mv ~/.linvimrc $BAK
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
sudo dnf install -y git vim gvim neovim curl wget zsh
sudo dnf install -y gcc g++ clang autoconf automake make cmake pkgconfig
sudo dnf install -y openssl openssh openssh-server openssh-clients cryptopp-devel
sudo dnf install -y the_silver_searcher ripgrep unzip bzip2
sudo dnf install -y python3 python3-devel python3-pip python3-docutils nodejs npm
sudo dnf remove -y ctags
sudo dnf install -y libseccomp-devel jansson-devel libyaml-devel libxml2-devel
sudo pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim

# Universal-Ctags
cd ~/.vim
git clone https://github.com/universal-ctags/ctags.git universal-ctags
cd universal-ctags
./autogen.sh
./configure
make
sudo make install
rm -rf ~/.vim/universal-ctags

# GUI fonts
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
check_fail $? "Hack Nerd Font Complete Mono"
curl -fLo "Hack Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
check_fail $? "Hack Nerd Font Complete Mono"
curl -fLo "Hack Bold Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
check_fail $? "Hack Nerd Font Complete Mono"
curl -fLo "Hack Bold Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
check_fail $? "Hack Nerd Font Complete Mono"

# Vim Plugins
mkdir ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
check_fail $? "vim-plug"
ln -s ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
check_fail $? "oh-my-zsh"

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
