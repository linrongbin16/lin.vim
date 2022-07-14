#!/usr/bin/env bash

set -eo pipefail

VIM=$HOME/.vim
CONFIG=$HOME/.config
NVIM=$CONFIG/nvim
INSTALL=$VIM/install
TEMPLATE=$VIM/template
OS="$(uname -s)"

function platform_dependency() {
    case "$OS" in
        Linux)
            if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
                $INSTALL/pacman.sh "$INSTALL"
            elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
                $INSTALL/dnf.sh "$INSTALL"
            elif [ -f "/etc/gentoo-release" ]; then
                $INSTALL/emerge.sh "$INSTALL"
            else
                # assume apt
                $INSTALL/apt.sh "$INSTALL"
            fi
            ;;
        FreeBSD)
            $INSTALL/pkg.sh "$INSTALL"
            ;;
        NetBSD)
            $INSTALL/pkgin.sh "$INSTALL"
            ;;
        OpenBSD)
            $INSTALL/pkg_add.sh "$INSTALL"
            ;;
        Darwin)
            $INSTALL/brew.sh "$INSTALL"
            ;;
        *)
            $INSTALL/message.sh "OS $OS is not supported, exit..."
            exit 1
            ;;
    esac
}

function rust_dependency() {
    if ! type "rustc" >/dev/null 2>&1; then
        $INSTALL/install_or_skip.sh "curl https://sh.rustup.rs -sSf | sh -s -- -y" "rustc"
    fi
    source $HOME/.cargo/env
    cargo install ripgrep
    cargo install fd-find
    cargo install --locked bat
}

function golang_dependency() {
    # see https://github.com/canha/golang-tools-install-script
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
    export PATH=$HOME/.go/bin:$PATH
}

function pip3_dependency() {
    sudo pip3 install pyOpenSSL pep8 flake8 pylint yapf chardet neovim pynvim cmakelang cmake-language-server click
}

function npm_dependency() {
    sudo npm install -g yarn prettier neovim
}

function guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    else
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
        local font_file=Hack.zip
        local font_version=v2.1.0
        local font_download_url=https://github.com/ryanoasis/nerd-fonts/releases/download/$font_version/$font_file
        if [ ! -f $font_file ]; then
            curl $font_download_url -o $font_file
            if [ $? -ne 0 ]; then
                $INSTALL/message.sh "download $font_file failed, skip..."
            fi
        fi
        unzip -o $font_file
    fi
}

function install_templates() {
    cp $TEMPLATE/plugin-template.vim $VIM/plugin.vim
    cp $TEMPLATE/coc-settings-template.json $VIM/coc-settings.json
    cp $TEMPLATE/setting-template.vim $VIM/setting.vim
}

function install_vimrc() {
    if [ -f $HOME/.vimrc ]; then
        mv $HOME/.vimrc $HOME/.vimrc.$(date +"%Y-%m-%d.%H-%M-%S")
    fi
    ln -s $VIM/lin.vim $HOME/.vimrc
}

function install_nvim_init() {
    mkdir -p $CONFIG
    if [ -d $NVIM ]; then
        mv $NVIM $CONFIG/nvim.$(date +"%Y-%m-%d.$H-%M-%S")
    fi
    ln -s $VIM $NVIM
    if [ -f $NVIM/init.vim ]; then
        rm $NVIM/init.vim
    fi
    ln -s $NVIM/lin.vim $NVIM/init.vim
}

function install_vim_plugin() {
    vim -E -c "PlugInstall" -c "qall"
}

function install_nvim_plugin() {
    nvim -E -c "PlugInstall" -c "qall"
}

function main() {
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

    # install plugins
    install_vim_plugin
    install_nvim_plugin
}

main
