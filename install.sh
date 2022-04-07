#!/usr/bin/env bash

set -eo pipefail

VIM_HOME=$HOME/.vim
CONFIG_HOME=$HOME/.config
NVIM_HOME=$CONFIG_HOME/nvim
INSTALL_HOME=$VIM_HOME/install
TEMPLATE_HOME=$VIM_HOME/template
OS="$(uname -s)"

function detect_platform() {
    case "$OS" in
        Linux)
            if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
                $INSTALL_HOME/message.sh "install for archlinux/artix based linux"
            elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
                $INSTALL_HOME/message.sh "install for fedora/redhat based linux"
            elif [ -f "/etc/gentoo-release" ]; then
                $INSTALL_HOME/message.sh "install for gentoo based linux"
            else
                # assume apt
                $INSTALL_HOME/message.sh "install for debian/ubuntu based linux"
            fi
            ;;
        FreeBSD)
            $INSTALL_HOME/message.sh "install for freebsd"
            ;;
        NetBSD)
            $INSTALL_HOME/message.sh "install for netbsd"
            ;;
        OpenBSD)
            $INSTALL_HOME/message.sh "install for openbsd"
            ;;
        Darwin)
            $INSTALL_HOME/message.sh "install for macos"
            ;;
        *)
            $INSTALL_HOME/message.sh "OS $OS not supported, exit..."
            exit 1
            ;;
    esac
}

function check_command_exist() {
    if type "$1" >/dev/null 2>&1; then
        $INSTALL_HOME/message.sh "check $1 - installed"
    else
        $INSTALL_HOME/message.sh "check $1 - not found, exit..."
        exit 1
    fi
}

function check_optional_command_exist() {
    if type "$1" >/dev/null 2>&1; then
        $INSTALL_HOME/message.sh "check $1 - installed"
    else
        $INSTALL_HOME/message.sh "check $1 - not found, skip..."
    fi
}

function check_either_two_commands_exist() {
    if type "$1" >/dev/null 2>&1; then
        $INSTALL_HOME/message.sh "check $1 - installed"
    elif type "$2" >/dev/null 2>&1; then
        $INSTALL_HOME/message.sh "check $2 - installed"
    else
        $INSTALL_HOME/message.sh "check $1 or $2 - not found, exit..."
        exit 1
    fi
}

function check_dependencies() {
    check_command_exist git
    check_command_exist curl
    check_command_exist vim
    check_command_exist nvim
    check_either_two_commands_exist gcc clang
    check_command_exist make
    check_command_exist cmake
    check_command_exist rustc
    check_command_exist cargo
    check_command_exist go
    check_command_exist python3
    check_command_exist pip3
    check_command_exist node
    check_command_exist npm
    check_command_exist ctags
    check_command_exist unzip
}

function install_rust_dependency_if_not_exist() {
    if type "$1" >/dev/null 2>&1; then
        $INSTALL_HOME/message.sh "check $1 - installed"
    else
        $INSTALL_HOME/message.sh "check $1 - not found, install with cargo..."
        eval "$2"
    fi
}

function rust_dependency() {
    install_rust_dependency_if_not_exist rg "cargo install ripgrep"
    install_rust_dependency_if_not_exist bat "cargo install --locked bat"
    install_rust_dependency_if_not_exist fd "cargo install fd-find"
}

function pip3_dependency() {
    # install python3 pip packages
    sudo pip3 install pyOpenSSL pep8 flake8 pylint yapf chardet neovim pynvim cmakelang cmake-language-server click
}

function npm_dependency() {
    # install nodejs npm packages
    sudo npm install -g yarn prettier neovim
}

function guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        cd ~/Library/Fonts
    else
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    fi
    local font_file=Hack.zip
    local font_version=v2.1.0
    local font_download_url=https://github.com/ryanoasis/nerd-fonts/releases/download/$font_version/$font_file
    if [ ! -f $font_file ]; then
        curl $font_download_url -o $font_file
        if [ $? -ne 0 ]; then
            $INSTALL_HOME/message.sh "download $font_file failed, skip..."
        fi
    fi
    unzip -o $font_file
}

function install_templates() {
    cp $TEMPLATE_HOME/plugin-template.vim $VIM_HOME/plugin.vim
    cp $TEMPLATE_HOME/coc-settings-template.json $VIM_HOME/coc-settings.json
    cp $TEMPLATE_HOME/ginit-template.vim $VIM_HOME/ginit.vim
    cp $TEMPLATE_HOME/setting-template.vim $VIM_HOME/setting.vim
}

function install_vimrc() {
    if [ -f $HOME/.vimrc ]; then
        mv $HOME/.vimrc $HOME/.vimrc.$(date +"%Y-%m-%d.%H-%M-%S")
    fi
    ln -s $VIM_HOME/lin.vim $HOME/.vimrc
}

function install_nvim_init() {
    mkdir -p $CONFIG_HOME
    if [ -d $NVIM_HOME ]; then
        mv $NVIM_HOME $CONFIG_HOME/nvim.$(date +"%Y-%m-%d.$H-%M-%S")
    fi
    ln -s $VIM_HOME $NVIM_HOME
    if [ -f $NVIM_HOME/init.vim ]; then
        rm $NVIM_HOME/init.vim
    fi
    ln -s $NVIM_HOME/lin.vim $NVIM_HOME/init.vim
}

function install_vim_plugin() {
    vim -E -c "PlugInstall" -c "qall"
}

function install_nvim_plugin() {
    nvim -E -c "PlugInstall" -c "qall"
}

function main() {
    # install dependencies
    detect_platform
    check_dependencies
    rust_dependency
    pip3_dependency
    npm_dependency
    guifont_dependency

    # install files
    install_templates
    install_vimrc
    install_nvim_init

    # install plugins
    install_vim_plugin
    install_nvim_plugin
}

main
