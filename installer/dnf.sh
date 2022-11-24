#!/bin/bash

INSTALL_HOME=~/.vim/installer
OPT_DISABLE_VIM=$1
OPT_DISABLE_NEOVIM=$2
source $INSTALL_HOME/util.sh

message "install dependencies with dnf"
sudo dnf check-update

# vim
if [ $OPT_DISABLE_VIM -ne 1 ]; then
    install_or_skip "sudo dnf install -y vim" "vim"
    install_or_skip "sudo dnf install -y gvim" "gvim"
fi
# neovim
if [ $OPT_DISABLE_NEOVIM -ne 1 ]; then
    install_or_skip "sudo dnf install -y neovim" "nvim"
fi
install_or_skip "sudo dnf group install -y \"Development Tools\"" "gcc"
install_or_skip "sudo dnf group install -y \"Development Tools\"" "make"
install_or_skip "sudo dnf install -y curl" "curl"
install_or_skip "sudo dnf install -y wget" "wget"
install_or_skip "sudo dnf install -y autoconf" "autoconf"
install_or_skip "sudo dnf install -y automake" "automake"
install_or_skip "sudo dnf install -y pkg-config" "pkg-config"
install_or_skip "sudo dnf install -y cmake" "cmake"
install_or_skip "sudo dnf install -y xclip" "xclip"
install_or_skip "sudo dnf install -y wl-clipboard" "wl-copy"

# python3
install_or_skip "sudo dnf install -y python3 python3-devel python3-pip python3-docutils" "python3"

# nodejs
install_or_skip "sudo dnf install -y nodejs npm" "node"

# ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo dnf install -y libseccomp-devel
    sudo dnf install -y jansson-devel
    sudo dnf install -y libyaml-devel
    sudo dnf install -y libxml2-devel
    install_universal_ctags
else
    skip_message "ctags"
fi
