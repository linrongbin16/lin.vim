#!/bin/bash

INSTALL=~/.vim/install

$INSTALL/msg.sh "install dependencies with apt"

sudo apt-get update

# vim
$INSTALL/msg.sh "install 'vim' from ppa:jonathonf/vim"
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install -y vim vim-gtk3

# neovim
$INSTALL/msg.sh "install 'nvim' from ppa:neovim-ppa/stable"
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim

$INSTALL/install_or_skip.sh "sudo apt-get install -y build-essential" "gcc"
$INSTALL/install_or_skip.sh "sudo apt-get install -y build-essential" "make"
$INSTALL/install_or_skip.sh "sudo apt-get install -y curl" "curl"
$INSTALL/install_or_skip.sh "sudo apt-get install -y wget" "wget"
$INSTALL/install_or_skip.sh "sudo apt-get install -y autoconf" "autoconf"
$INSTALL/install_or_skip.sh "sudo apt-get install -y automake" "automake"
$INSTALL/install_or_skip.sh "sudo apt-get install -y pkg-config" "pkg-config"
$INSTALL/install_or_skip.sh "sudo apt-get install -y cmake" "cmake"
$INSTALL/install_or_skip.sh "sudo apt-get install -y xclip" "xclip"
$INSTALL/install_or_skip.sh "sudo apt-get install -y wl-clipboard" "wl-copy"


# python3
$INSTALL/install_or_skip.sh "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "python3"
$INSTALL/install_or_skip.sh "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "pip3"

# nodejs
if ! type "node" > /dev/null; then
    $INSTALL/msg.sh "install nodejs from deb.nodesource.com..."
    curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    $INSTALL/msg_skip.sh 'node'
fi

# ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo apt-get install -y libseccomp-dev
    sudo apt-get install -y libjansson-dev
    sudo apt-get install -y libyaml-dev
    sudo apt-get install -y libxml2-dev
    $INSTALL/install_universal_ctags.sh
else
    $INSTALL/msg_skip.sh 'ctags'
fi

# locale
sudo locale-gen en_US
sudo locale-gen en_US.UTF-8
sudo update-locale
