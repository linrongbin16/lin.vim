#!/bin/bash

VIM_HOME=$HOME/.vim
CONFIG_HOME=$HOME/.config
NVIM_HOME=$CONFIG_HOME/nvim
INSTALL_HOME=$VIM_HOME/install
TEMPLATE_HOME=$VIM_HOME/template
OS="$(uname -s)"

MODE_NAME='full'
OPT_BASIC=0
OPT_FULL=1 # default mode
OPT_WITHOUT_CXX=0
OPT_WITHOUT_PYTHON=0
OPT_WITHOUT_MARKDOWN=0
OPT_WITHOUT_JSON=0
OPT_WITHOUT_JAVASCRIPT=0
OPT_WITHOUT_POWERSHELL=0
OPT_WITHOUT_BASH=0
OPT_WITHOUT_HIGHLIGHT=0
OPT_WITHOUT_COLOR=0
OPT_WITHOUT_GIT=0

function try_backup() {
    local src=$1
    if [ -f "$src" ]; then
        $INSTALL_HOME/msg.sh "backup '$src' to '$target'"
        mv $src $src.$(date +"%Y-%m-%d.%H-%M-%S.%6N")
    fi
}

function try_delete() {
    local src=$1
    if [ -f "$src" ]; then
        $INSTALL_HOME/msg.sh "remove '$src'"
        rm -rf $src
    fi
}

function platform_dependency() {
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
            $INSTALL_HOME/msg.sh "$OS is not supported, exit..."
            exit 1
            ;;
    esac
}

function rust_dependency() {
    $INSTALL_HOME/install_or_skip.sh "curl https://sh.rustup.rs -sSf | sh -s -- -y" "rustc"
    source $HOME/.cargo/env
    $INSTALL_HOME/install_or_skip.sh "cargo install ripgrep" "rg"
    $INSTALL_HOME/install_or_skip.sh "cargo install fd-find" "fd"
    $INSTALL_HOME/install_or_skip.sh "cargo install --locked bat" "bat"
}

function golang_dependency() {
    # see https://github.com/canha/golang-tools-install-script
    $INSTALL_HOME/install_or_skip.sh "wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash" "go"
    export PATH=$HOME/.go/bin:$PATH
}

function pip3_dependency() {
    $INSTALL_HOME/msg.sh "install python packages with pip3"
    sudo pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click
}

function npm_dependency() {
    $INSTALL_HOME/msg.sh "install node packages with npm"
    sudo npm install -g yarn prettier neovim
}

function guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        $INSTALL_HOME/msg.sh "install hack nerd font with brew"
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    else
        $INSTALL_HOME/msg.sh "install hack nerd font from github"
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
        local font_file=Hack.zip
        local font_version=v2.2.2
        local font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/$font_version/$font_file"
        if [ -f $font_file ]; then
            rm $font_file
        fi
        curl -L $font_url -o $font_file
        if [ $? -ne 0 ]; then
            $INSTALL_HOME/msg.sh "failed to download $font_file, skip..."
        else
            unzip -o $font_file
            $INSTALL_HOME/msg.sh "install hack nerd font from github - done"
        fi
    fi
}

function install_templates() {
    $INSTALL_HOME/msg.sh "install configurations from templates"
    cp $TEMPLATE_HOME/plugin-template.vim $VIM_HOME/plugin.vim
    cp $TEMPLATE_HOME/coc-settings-template.json $VIM_HOME/coc-settings.json
    cp $TEMPLATE_HOME/setting-template.vim $VIM_HOME/setting.vim
}

function install_vimrc() {
    $INSTALL_HOME/msg.sh "install .vimrc for vim"
    try_backup $HOME/.vimrc
    ln -s $VIM_HOME/lin.vim $HOME/.vimrc
    $INSTALL_HOME/msg.sh "install vim plugins"
    vim -E -c "PlugInstall" -c "qall"
}

function install_nvim_init() {
    $INSTALL_HOME/msg.sh "install ~/.config/nvim and ~/.config/nvim/init.vim for neovim"
    mkdir -p $CONFIG_HOME
    try_backup $NVIM_HOME/init.vim
    try_backup $NVIM_HOME
    ln -s $VIM_HOME $NVIM_HOME
    ln -s $VIM_HOME/lin.vim $NVIM_HOME/init.vim
    $INSTALL_HOME/msg.sh "install neovim plugins"
    nvim -E -c "PlugInstall" -c "qall"
}

function show_help() {
cat <<EOF
Install in one-line command with 3 modes: basic, limit and full.

Basic mode only install pure vim script settings, no vim plugins or any other third party softwares.
It is for production environment, which lacks of software sources or user authentication.

Limit mode installs limited features, no extra highlights, colors or all other language supports.
It is for better performance on some old devices, which lacks of CPU, memory or graphics.

Full mode is default mode, enable all features.
It is for best user experience, while consumes more CPU, memory and graphics.
In full mode you could use `--without-xxx` options to disable some specific feature.

Notice: 
The `--without-xxx` options are not compatible with `--basic` or `--limit` options.
The `--without-all-language --without-highlight --without-color` option is equivalent to `--limit`.

-h,--help                       Show help message.
-b,--basic                      Basic mode.
-l,--limit                      Limit mode.

--without-cxx                   Disable c/c++/cmake support.
--without-python                Disable python support.
--without-markdown              Disable markdown support.
--without-json                  Disable json support.
--without-javascript            Disable javascript support.
--without-powershell            Disable powershell support.
--without-bash                  Disable linux bash support.
--without-all-language          Disable all language supports above.

--without-highlight             Disable extra highlights such as cursor word highlight, fzf preview syntax highlight, etc.
--without-color                 Disable extra colors such as RGBs, random colorschemes, etc.
--without-git                   Disable git support.
EOF
}

function check_no_basic_option() {
    local has_basic_option
    local input_option
    has_basic_option=$1
    input_option=$2
    if [ $has_basic_option -eq 1 ]; then
        $INSTALL_HOME/msg.sh "error! cannot use $input_option along with --basic"
        exit 0
    fi
}

function check_no_limit_option() {
    local has_limit_option
    local input_option
    has_limit_option=$1
    input_option=$2
    if [ $has_limit_option -eq 1 ]; then
        $INSTALL_HOME/msg.sh "error! cannot use $input_option along with --limit"
        exit 0
    fi
}

function parse_options() {
    local options
    options=$(getopt -l "help,basic,limit,without-cxx,without-python,without-json,without-javascript,without-powershell,without-all-language,without-highlight,without-color,without-git" -o "hbl" -a -- "$@")
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

        MODE_NAME='basic'
        OPT_BASIC=1
        OPT_FULL=0
        ;;
    -l|--limit) 
        shift
        has_limit_option=1
        check_no_basic_option $has_basic_option "$1"

        MODE_NAME='limit'
        OPT_BASIC=0
        OPT_FULL=1
        OPT_WITHOUT_CXX=1
        OPT_WITHOUT_PYTHON=1
        OPT_WITHOUT_MARKDOWN=1
        OPT_WITHOUT_JSON=1
        OPT_WITHOUT_JAVASCRIPT=1
        OPT_WITHOUT_POWERSHELL=1
        OPT_WITHOUT_BASH=1
        OPT_WITHOUT_HIGHLIGHT=1
        OPT_WITHOUT_COLOR=1
        ;;
    --without-cxx) 
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_CXX=1
        ;;
    --without-python) 
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_PYTHON=1
        ;;
    --without-markdown) 
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_MARKDOWN=1
        ;;
    --without-json) 
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_JSON=1
        ;;
    --without-javascript) 
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_JAVASCRIPT=1
        ;;
    --without-powershell) 
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_POWERSHELL=1
        ;;
    --without-bash) 
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_BASH=1
        ;;
    --without-highlight)
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_HIGHLIGHT=1
        ;;
    --without-color)
        shift
        check_no_basic_option $has_basic_option "$1"
        check_no_limit_option $has_limit_option "$1"
        OPT_WITHOUT_COLOR=1
        ;;
    --without-git)
        shift
        check_no_basic_option $has_basic_option "$1"
        OPT_WITHOUT_GIT=1
        ;;
    *)
        $INSTALL_HOME/msg.sh "unknown options! please try ./install.sh --help for more information"
        exit 0
        ;;
    esac
    shift
    done
}

function main() {
    parse_options

    # install dependencies
    $INSTALL_HOME/msg.sh "install with mode - $MODE_NAME"
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
