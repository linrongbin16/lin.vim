#!/usr/bin/env bash

sudo dnf install -y epel-release
sudo dnf install -y git
sudo dnf install -y vim
sudo dnf install -y gvim
sudo dnf install -y neovim # epel
sudo dnf install -y curl
sudo dnf install -y wget
sudo dnf install -y zsh
sudo dnf install -y gcc
sudo dnf install -y gcc-c++
sudo dnf install -y clang
sudo dnf install -y autoconf
sudo dnf install -y automake
sudo dnf install -y make
sudo dnf install -y cmake
sudo dnf install -y pkgconfig
sudo dnf install -y openssl
sudo dnf install -y cryptopp-devel
sudo dnf install -y the_silver_searcher
# sudo dnf install -y ripgrep
sudo dnf install -y rust
sudo dnf install -y cargo
sudo dnf install -y unzip
sudo dnf install -y bzip2
sudo dnf install -y python3
sudo dnf install -y python3-devel
sudo dnf install -y python3-pip
sudo dnf install -y python3-docutils

# Node
sudo dnf install -y nodejs
sudo dnf install -y npm

sudo dnf install -y libseccomp-devel
sudo dnf install -y jansson-devel
# sudo dnf install -y libyaml-devel
sudo dnf install -y libxml2-devel

# Ctags
sudo dnf remove -y ctags
if ! type "ctags" > /dev/null; then
    cd ~/.vim
    git clone https://github.com/universal-ctags/ctags.git universal-ctags
    cd universal-ctags
    ./autogen.sh
    ./configure
    make
    sudo make install
    rm -rf ~/.vim/universal-ctags
else
    echo "[lin.vim] ctags already installed, skipping..."
fi

if ! type "rg" > /dev/null; then
    cd ~/.vim
    git clone https://github.com/BurntSushi/ripgrep
    cd ripgrep
    cargo build --release --features 'pcre2'
    sudo mv ./target/release/rg /usr/bin/rg
else
    echo "[lin.vim] ripgrep already installed, skipping..."
fi
