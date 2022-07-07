#!/usr/bin/env bash

INSTALL_HOME="$1"

$INSTALL_HOME/message.sh "install dependencies with dnf"

sudo dnf check-update
$INSTALL_HOME/install_or_skip.sh "sudo dnf group install -y \"Development Tools\"" "gcc" "g++"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y vim" "vim"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y gvim" "gvim"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y neovim" "nvim"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y curl" "curl"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y wget" "wget"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y clang" "clang"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y autoconf" "autoconf"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y automake" "automake"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y cmake" "cmake"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y go" "go"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y unzip" "unzip"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y zip" "zip"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y bzip2" "bzip2"
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y p7zip p7zip-plugins" "p7zip"

# Python3
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y python3 python3-devel python3-pip python3-docutils" "python3"

# Node
$INSTALL_HOME/install_or_skip.sh "sudo dnf install -y nodejs npm" "node"

# Ctags
# Ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo dnf install -y libseccomp-devel
    sudo dnf install -y jansson-devel
    sudo dnf install -y libyaml-devel
    sudo dnf install -y libxml2-devel
    $INSTALL_HOME/message.sh "install universal-ctags from source..."
    $INSTALL_HOME/install_universal_ctags.sh
else
    $INSTALL_HOME/message_skip.sh "ctags"
fi
