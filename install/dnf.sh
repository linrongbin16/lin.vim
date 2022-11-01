#!/bin/bash

INSTALL=~/.vim/install

$INSTALL/msg.sh "install dependencies with dnf"

sudo dnf check-update

# vim and neovim
sudo dnf install -y vim
sudo dnf install -y gvim

$INSTALL/install_or_skip.sh "sudo dnf group install -y \"Development Tools\"" "gcc"
$INSTALL/install_or_skip.sh "sudo dnf group install -y \"Development Tools\"" "make"
$INSTALL/install_or_skip.sh "sudo dnf install -y neovim" "nvim"
$INSTALL/install_or_skip.sh "sudo dnf install -y curl" "curl"
$INSTALL/install_or_skip.sh "sudo dnf install -y wget" "wget"
$INSTALL/install_or_skip.sh "sudo dnf install -y autoconf" "autoconf"
$INSTALL/install_or_skip.sh "sudo dnf install -y automake" "automake"
$INSTALL/install_or_skip.sh "sudo dnf install -y pkg-config" "pkg-config"
$INSTALL/install_or_skip.sh "sudo dnf install -y cmake" "cmake"
$INSTALL/install_or_skip.sh "sudo dnf install -y xclip" "xclip"
$INSTALL/install_or_skip.sh "sudo dnf install -y wl-clipboard" "wl-copy"

# python3
$INSTALL/install_or_skip.sh "sudo dnf install -y python3 python3-devel python3-pip python3-docutils" "python3"

# nodejs
$INSTALL/install_or_skip.sh "sudo dnf install -y nodejs npm" "node"

# ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo dnf install -y libseccomp-devel
    sudo dnf install -y jansson-devel
    sudo dnf install -y libyaml-devel
    sudo dnf install -y libxml2-devel
    $INSTALL/install_universal_ctags.sh
else
    $INSTALL/message_skip.sh "ctags"
fi
