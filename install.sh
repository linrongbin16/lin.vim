#!/bin/bash

# debug
set -x

VIM_HOME=$HOME/.vim
NVIM_HOME=$HOME/.config/nvim
INSTALL_HOME=$VIM_HOME/install
OS="$(uname -s)"

MODE_NAME='full' # default mode
OPT_BASIC=0
OPT_DISABLE_VIM=0
OPT_DISABLE_NEOVIM=0

source $INSTALL_HOME/util.sh

# dependency
platform_dependency() {
    case "$OS" in
        Linux)
            if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
                $INSTALL_HOME/pacman.sh
            elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
                $INSTALL_HOME/dnf.sh
            elif [ -f "/etc/gentoo-release" ]; then
                $INSTALL_HOME/emerge.sh
            else
                # assume apt
                $INSTALL_HOME/apt.sh
            fi
            ;;
        FreeBSD)
            $INSTALL_HOME/pkg.sh
            ;;
        NetBSD)
            $INSTALL_HOME/pkgin.sh
            ;;
        OpenBSD)
            $INSTALL_HOME/pkg_add.sh
            ;;
        Darwin)
            $INSTALL_HOME/brew.sh
            ;;
        *)
            message "$OS is not supported, exit..."
            exit 1
            ;;
    esac
}

rust_dependency() {
    install_or_skip "curl https://sh.rustup.rs -sSf | sh -s -- -y" "rustc"
    source $HOME/.cargo/env
    install_or_skip "cargo install ripgrep" "rg"
    install_or_skip "cargo install fd-find" "fd"
    install_or_skip "cargo install --locked bat" "bat"
}

golang_dependency() {
    # see https://github.com/canha/golang-tools-install-script
    install_or_skip "wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash" "go"
    if [ -d $HOME/.go/bin ]; then
        export PATH=$HOME/.go/bin:$PATH
    fi
}

pip3_dependency() {
    message "install python packages with pip3"
    sudo pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click
}

npm_dependency() {
    message "install node packages with npm"
    sudo npm install -g yarn prettier neovim
}

guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        message "install hack nerd font with brew"
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    else
        message "install hack nerd font from github"
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
        local font_file=Hack.zip
        local font_version=v2.2.2
        local font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/$font_version/$font_file"
        if [ -f $font_file ]; then
            rm $font_file
        fi
        curl -L $font_url -o $font_file
        if [ $? -ne 0 ]; then
            message "failed to download $font_file, skip..."
        else
            unzip -o $font_file
            message "install hack nerd font from github - done"
        fi
    fi
}

dependency() {
    platform_dependency
    rust_dependency
    golang_dependency
    pip3_dependency
    npm_dependency
    guifont_dependency
}

# full
install_full() {
    message "install configs"
    python3 $VIM_HOME/generator.py "$@"
    if [ $? -ne 0 ]; then
        exit 1
    fi
    if [ $OPT_DISABLE_VIM -ne 1 ]; then
        vim -E -c "PlugInstall" -c "qall"
    fi
    if [ $OPT_DISABLE_NEOVIM -ne 1 ]; then
        nvim -E -c "PlugInstall" -c "qall"
    fi
}

# basic
install_basic_vimrc() {
    if [ $OPT_DISABLE_VIM -ne 1 ]; then
        message "install ~/.vimrc for vim"
        try_backup $HOME/.vimrc
        ln -s $VIM_HOME/standalone/basic.vim $HOME/.vimrc
    fi
}

install_basic_neovim_init() {
    if [ $OPT_DISABLE_NEOVIM -ne 1 ]; then
        message "install ~/.config/nvim/init.vim for neovim"
        try_backup $NVIM_HOME/init.vim
        try_backup $NVIM_HOME
        mkdir -p $HOME/.config
        ln -s $VIM_HOME $NVIM_HOME
        ln -s $VIM_HOME/standalone/basic.vim $NVIM_HOME/init.vim
    fi
}

install_basic() {
    install_basic_vimrc
    install_basic_neovim_init
}

show_help() {
    cat $INSTALL_HOME/help.txt
}

parse_options() {
    while [ $# -gt 0 ]; do
        case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -b|--basic)
            MODE_NAME='basic'
            OPT_BASIC=1
            ;;
        -l|--limit)
            MODE_NAME='limit'
            ;;
        --disable-vim)
            OPT_DISABLE_VIM=1
            ;;
        --disable-neovim)
            OPT_DISABLE_NEOVIM=1
            ;;
        esac
        shift
    done
}

main() {
    message "install with $MODE_NAME mode"
    if [ $OPT_BASIC -gt 0 ]; then
        install_basic
    else
        dependency
        install_full "$@"
    fi
    message "install with $MODE_NAME mode - done"
}

parse_options "$@"
main
