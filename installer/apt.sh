#!/bin/bash

INSTALL_HOME=~/.vim/installer
OPT_DISABLE_VIM=$1
OPT_DISABLE_NEOVIM=$2
source $INSTALL_HOME/util.sh

message "install dependencies with apt"
sudo apt-get update

# vim
if [ $OPT_DISABLE_VIM -ne 1 ]; then
    if ! type vim >/dev/null 2>&1; then
        message "install 'vim' from ppa:jonathonf/vim"
        sudo apt-get install -y software-properties-common
        sudo add-apt-repository -y ppa:jonathonf/vim
        sudo apt-get update
        sudo apt-get install -y vim vim-gtk3
    else
        skip_message 'vim'
    fi
fi
# neovim
if [ $OPT_DISABLE_NEOVIM -ne 1 ]; then
    if ! type nvim >/dev/null 2>&1; then
        message "install 'nvim' from ppa:neovim-ppa/stable"
        sudo add-apt-repository -y ppa:neovim-ppa/stable
        sudo apt-get update
        sudo apt-get install -y neovim
    else
        skip_message 'nvim'
    fi
fi

install_or_skip "sudo apt-get install -y build-essential" "gcc"
install_or_skip "sudo apt-get install -y build-essential" "make"
install_or_skip "sudo apt-get install -y curl" "curl"
install_or_skip "sudo apt-get install -y wget" "wget"
install_or_skip "sudo apt-get install -y autoconf" "autoconf"
install_or_skip "sudo apt-get install -y automake" "automake"
install_or_skip "sudo apt-get install -y pkg-config" "pkg-config"
install_or_skip "sudo apt-get install -y cmake" "cmake"
install_or_skip "sudo apt-get install -y xclip" "xclip"
install_or_skip "sudo apt-get install -y wl-clipboard" "wl-copy"

# locale
sudo locale-gen en_US
sudo locale-gen en_US.UTF-8
sudo update-locale

# python3
install_or_skip "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "python3"
install_or_skip "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "pip3"

# nodejs
if ! type "node" > /dev/null; then
    message "install nodejs from deb.nodesource.com"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    skip_message 'node'
fi

# ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo apt-get install -y libseccomp-dev
    sudo apt-get install -y libjansson-dev
    sudo apt-get install -y libyaml-dev
    sudo apt-get install -y libxml2-dev
    install_universal_ctags
else
    skip_message 'ctags'
fi
