#!/bin/bash

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
    sudo pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint yapf chardet cmakelang cmake-language-server click
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
        local font_version=v2.1.0
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
    if [ -f $HOME/.vimrc ]; then
        mv $HOME/.vimrc $HOME/.vimrc.$(date +"%Y-%m-%d.%H-%M-%S")
    fi
    ln -s $VIM/lin.vim $HOME/.vimrc
}

function install_nvim_init() {
    $INSTALL/msg.sh "install ~/.config/nvim and ~/.config/nvim/init.vim for neovim"
    mkdir -p $CONFIG
    if [ -d $NVIM ]; then
        mv $NVIM $CONFIG/nvim.$(date +"%Y-%m-%d.$H-%M-%S")
    fi
    ln -s $VIM $NVIM
    if [ -f $NVIM/init.vim ]; then
        rm $NVIM/init.vim
    fi
    ln -s $VIM/lin.vim $NVIM/init.vim
}

function install_vim_plugin() {
    $INSTALL/msg.sh "install vim plugins"
    vim -E -c "PlugInstall" -c "qall"
}

function install_nvim_plugin() {
    $INSTALL/msg.sh "install neovim plugins"
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
