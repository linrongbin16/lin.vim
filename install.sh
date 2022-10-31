#!/bin/bash

VIM=$HOME/.vim
CONFIG=$HOME/.config
NVIM=$CONFIG/nvim
INSTALL=$VIM/install
TEMPLATE=$VIM/template
OS="$(uname -s)"

OPT_BASIC=0
OPT_FULL=1
OPT_DISABLE_CXX=0
OPT_DISABLE_PYTHON=0
OPT_DISABLE_MARKDOWN=0
OPT_DISABLE_JSON=0
OPT_DISABLE_JAVASCRIPT=0
OPT_DISABLE_POWERSHELL=0
OPT_DISABLE_BASH=0
OPT_DISABLE_SPELLCHECK=0
OPT_DISABLE_HIGHLIGHT=0
OPT_DISABLE_COLOR=0

function try_backup() {
    local src=$1
    if [ -f "$src" ]; then
        $INSTALL/msg.sh "backup '$src' to '$target'"
        mv $src $src.$(date +"%Y-%m-%d.%H-%M-%S.%6N")
    fi
}

function try_delete() {
    local src=$1
    if [ -f "$src" ]; then
        $INSTALL/msg.sh "remove '$src'"
        rm -rf $src
    fi
}

function platform_dependency() {
    case "$OS" in
        Linux)
            if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
                $INSTALL/pacman.sh
            elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
                $INSTALL/dnf.sh
            elif [ -f "/etc/gentoo-release" ]; then
                $INSTALL/emerge.sh
            else
                # assume apt
                $INSTALL/apt.sh
            fi
            ;;
        FreeBSD)
            $INSTALL/pkg.sh
            ;;
        NetBSD)
            $INSTALL/pkgin.sh
            ;;
        OpenBSD)
            $INSTALL/pkg_add.sh
            ;;
        Darwin)
            $INSTALL/brew.sh
            ;;
        *)
            $INSTALL/msg.sh "$OS is not supported, exit..."
            exit 1
            ;;
    esac
}

function rust_dependency() {
    $INSTALL/install_or_skip.sh "curl https://sh.rustup.rs -sSf | sh -s -- -y" "rustc"
    source $HOME/.cargo/env
    $INSTALL/install_or_skip.sh "cargo install ripgrep" "rg"
    $INSTALL/install_or_skip.sh "cargo install fd-find" "fd"
    $INSTALL/install_or_skip.sh "cargo install --locked bat" "bat"
}

function golang_dependency() {
    # see https://github.com/canha/golang-tools-install-script
    $INSTALL/install_or_skip.sh "wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash" "go"
    export PATH=$HOME/.go/bin:$PATH
}

function pip3_dependency() {
    $INSTALL/msg.sh "install python packages with pip3"
    sudo pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click
}

function npm_dependency() {
    $INSTALL/msg.sh "install node packages with npm"
    sudo npm install -g yarn prettier neovim
}

function guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        $INSTALL/msg.sh "install hack nerd font with brew"
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    else
        $INSTALL/msg.sh "install hack nerd font from github"
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
        local font_file=Hack.zip
        local font_version=v2.2.2
        local font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/$font_version/$font_file"
        if [ -f $font_file ]; then
            rm $font_file
        fi
        curl -L $font_url -o $font_file
        if [ $? -ne 0 ]; then
            $INSTALL/msg.sh "failed to download $font_file, skip..."
        else
            unzip -o $font_file
            $INSTALL/msg.sh "install hack nerd font from github - done"
        fi
    fi
}

function install_templates() {
    $INSTALL/msg.sh "install configurations from templates"
    cp $TEMPLATE/plugin-template.vim $VIM/plugin.vim
    cp $TEMPLATE/coc-settings-template.json $VIM/coc-settings.json
    cp $TEMPLATE/setting-template.vim $VIM/setting.vim
}

function install_vimrc() {
    $INSTALL/msg.sh "install .vimrc for vim"
    try_backup $HOME/.vimrc
    ln -s $VIM/lin.vim $HOME/.vimrc
    $INSTALL/msg.sh "install vim plugins"
    vim -E -c "PlugInstall" -c "qall"
}

function install_nvim_init() {
    $INSTALL/msg.sh "install ~/.config/nvim and ~/.config/nvim/init.vim for neovim"
    mkdir -p $CONFIG
    try_backup $NVIM/init.vim
    try_backup $NVIM
    ln -s $VIM $NVIM
    ln -s $VIM/lin.vim $NVIM/init.vim
    $INSTALL/msg.sh "install neovim plugins"
    nvim -E -c "PlugInstall" -c "qall"
}

function show_help() {
cat << EOF
Usage: ./install.sh [options]

Installer has 3 modes: basic, limit and full.

Basic mode only install pure vim script settings, no vim plugins or any other third party softwares.
It is for production environment, which lacks of software sources or user authentication.

Limit mode installs limited features, no extra highlights, colors or all other language supports.
It is for better performance on some old devices, which lacks of CPU, memory or graphics.

Full mode is default mode, enable all features.
It is for best user experience, while consumes more CPU, memory and graphics.
You could use extra disable options to disable some specific feature.
Notice `--disable-all-language --disable-highlight --disable-color` is equivalent to `--limit`.

-h,--help       Show help message.

-b,--basic      Install pure vim script settings, no vim plugins or any other third party softwares.
                This mode is for production environment, which lacks of third party support.

-l,--limit      Install limited features, no extra highlight, extra colors, all other language supports.
                This mode is for old devices, disable some features for better performance.

--disable-cxx                   Disable c/c++/cmake support.
--disable-python                Disable python support.
--disable-markdown              Disable markdown support.
--disable-json                  Disable json support.
--disable-javascript            Disable javascript support.
--disable-powershell            Disable powershell support.
--disable-bash                  Disable linux bash support.
--disable-spellcheck            Disable english spell check.
--disable-all-language          Disable all language supports above.

--disable-highlight             Disable extra highlights such as cursor word highlight, fzf preview syntax highlight, etc.
--disable-color                 Disable extra colors such as RGBs, random colorschemes, etc.
EOF
}

function check_no_basic_option() {
    local has_basic_option
    local input_option
    has_basic_option=$1
    input_option=$2
    if [ $has_basic_option -eq 1 ]; then
        $INSTALL/msg.sh "error! cannot use $input_option along with --basic"
        exit 0
    fi
}

function check_no_limit_option() {
    local has_limit_option
    local input_option
    has_limit_option=$1
    input_option=$2
    if [ $has_limit_option -eq 1 ]; then
        $INSTALL/msg.sh "error! cannot use $input_option along with --limit"
        exit 0
    fi
}

function parse_options() {
    local options
    options=$(getopt -l "help,basic,limit,disable-cxx,disable-python,disable-json,disable-javascript,disable-powershell,disable-all-language,disable-highlight,disable-color,disable-spellcheck" -o "hbl" -a -- "$@")
    eval set -- "$options"

    local has_basic_option=0
    local has_limit_option=0

    while true
    do
    case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
    -b|--basic)
        shift
        has_basic_option=1
        check_no_limit_option $has_limit_option "$1"

        OPT_BASIC=1
        OPT_FULL=0
        ;;
    -l|--limit) 
        shift
        has_limit_option=1
        check_no_basic_option $has_basic_option "$1"

        OPT_BASIC=0
        OPT_FULL=1
        OPT_DISABLE_CXX=1
        OPT_DISABLE_PYTHON=1
        OPT_DISABLE_MARKDOWN=1
        OPT_DISABLE_JSON=1
        OPT_DISABLE_JAVASCRIPT=1
        OPT_DISABLE_POWERSHELL=1
        OPT_DISABLE_BASH=1
        OPT_DISABLE_SPELLCHECK=1
        OPT_DISABLE_HIGHLIGHT=1
        OPT_DISABLE_COLOR=1
        ;;
    --disable-cxx) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_CXX=1
        ;;
    --disable-python) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_PYTHON=1
        ;;
    --disable-markdown) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_MARKDOWN=1
        ;;
    --disable-json) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_JSON=1
        ;;
    --disable-javascript) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_JAVASCRIPT=1
        ;;
    --disable-powershell) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_POWERSHELL=1
        ;;
    --disable-bash) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_BASH=1
        ;;
    --disable-spellcheck) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_SPELLCHECK=1
        ;;
    --disable-highlight) 
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_HIGHLIGHT=1
        ;;
    --disable-color)
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_DISABLE_COLOR=1
        ;;
    *)
        $INSTALL/msg.sh "unknown options! please try --help for more information"
        exit 0
        ;;
    esac
    shift
    done
}

function main() {
    parse_options

    # install dependencies
    platform_dependency
    rust_dependency
    golang_dependency
    pip3_dependency
    npm_dependency
    guifont_dependency

    # install files
    install_templates
    install_vimrc
    install_nvim_init
}

main
