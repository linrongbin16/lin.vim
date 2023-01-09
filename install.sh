#!/bin/bash

# debug
# set -x

VIM_HOME=$HOME/.vim
NVIM_HOME=$HOME/.config/nvim
INSTALL_HOME=$VIM_HOME/installer
OS="$(uname -s)"

MODE_NAME='full' # default mode
OPT_BASIC=0
OPT_DISABLE_VIM=0
OPT_DISABLE_NEOVIM=0

source $INSTALL_HOME/util.sh

# dependency
rust_dependency() {
    install_or_skip "curl https://sh.rustup.rs -sSf | sh -s -- -y" "rustc"
    source $HOME/.cargo/env
    install_or_skip "cargo install ripgrep" "rg"
    install_or_skip "cargo install fd-find" "fd"
    install_or_skip "cargo install --locked bat" "bat"
}

golang_dependency() {
    # https://github.com/kerolloz/go-installer
    install_or_skip "bash <(curl -sL https://git.io/go-installer)" "go"
    if [ -d $HOME/.go/bin ]; then
        export PATH=$HOME/.go/bin:$PATH
    fi
}

pip3_dependency() {
    message "install python packages with pip3"
    install_or_skip "sudo pip3 install flake8" "flake8"
    install_or_skip "sudo pip3 install pylint" "pylint"
    install_or_skip "sudo pip3 install black" "black"
    sudo pip3 install neovim pynvim cmakelang click
}

npm_dependency() {
    message "install node packages with npm"
    install_or_skip "sudo npm install -g yarn" "yarn"
    install_or_skip "sudo npm install -g prettier" "prettier"
    sudo npm install -g neovim
}

nerdfont_latest_release_tag() {
    local org="$1"
    local repo="$2"
    local uri="https://github.com/$org/$repo/releases/latest"
    curl -f -L $uri | grep "href=\"/$org/$repo/releases/tag" | grep -Eo 'href="/[a-zA-Z0-9#~.*,/!?=+&_%:-]*"' | head -n 1 | cut -d '"' -f2 | cut -d "/" -f6
}

guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        message "install hack nerd font with brew"
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    else
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
        local org="ryanoasis"
        local repo="nerd-fonts"
        local font_file=Hack.zip
        local font_version=$(nerdfont_latest_release_tag $org $repo)
        local font_url="https://github.com/$org/$repo/releases/download/$font_version/$font_file"
        message "install hack($font_version) nerd font from github"
        if [ -f $font_file ]; then
            rm $font_file
        fi
        curl -L $font_url -o $font_file
        if [ $? -ne 0 ]; then
            message "failed to download $font_file, skip..."
        else
            unzip -o $font_file
            message "install hack($font_version) nerd font from github - done"
        fi
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

# parse options

requires_an_argument_error() {
    error_message "option '$a' requires an argument."
    exit 1
}

unknown_option_error() {
    error_message "unknown option, please try --help for more information."
    exit 1
}

args_length=$#
args=("$@")
for ((i=0; i < args_length; i++)); do
    a="${args[i]}"
    case "$a" in
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
    --static-color*|--disable-plugin*|--disable-highlight|--disable-language|--disable-editing|--disable-ctrl-keys|--disable-color)
        # nothing here
        ;;
    --disable-vim)
        OPT_DISABLE_VIM=1
        ;;
    --disable-neovim)
        OPT_DISABLE_NEOVIM=1
        ;;
    *)
        unknown_option_error
    esac
done

message "install with $MODE_NAME mode"
if [ $OPT_BASIC -gt 0 ]; then
    install_basic
else
    # dependency
    case "$OS" in
        Linux)
            if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
                $INSTALL_HOME/pacman.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
                $INSTALL_HOME/dnf.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            elif [ -f "/etc/gentoo-release" ]; then
                $INSTALL_HOME/emerge.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            else
                # assume apt
                $INSTALL_HOME/apt.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            fi
            ;;
        FreeBSD)
            $INSTALL_HOME/pkg.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            ;;
        NetBSD)
            $INSTALL_HOME/pkgin.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            ;;
        OpenBSD)
            $INSTALL_HOME/pkg_add.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            ;;
        Darwin)
            $INSTALL_HOME/brew.sh $OPT_DISABLE_VIM $OPT_DISABLE_NEOVIM
            ;;
        *)
            message "$OS is not supported, exit..."
            exit 1
            ;;
    esac
    rust_dependency
    golang_dependency
    pip3_dependency
    npm_dependency
    guifont_dependency

    # vim settings
    message "install settings for vim"
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
fi
message "install with $MODE_NAME mode - done"
