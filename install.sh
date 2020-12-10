#!/usr/bin/env bash

function check_download() {
    if [ $1 -ne 0 ]; then
        echo "[lin.vim] Download \"$2\" failed! Please check your network and try again."
        exit 3
    fi
}

function start_install() {
    sudo echo "[lin.vim] Install for $1" || { echo "[lin.vim] sudo not found"; exit 1; }
}

function backup_linvimrc() {
    if [ -f ~/.linvimrc ]; then
        LINVIMRC_BAK=~/.linvimrc.$(date +%s).bak
        echo "[lin.vim] back up .linvimrc to $LINVIMRC_BAK"
        mv ~/.linvimrc $LINVIMRC_BAK
    fi
}

function install_gui_fonts() {
    if [ $(uname) == "Darwin" ]; then
        cd ~/Library/Fonts
    else
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    fi
    FONT_REGULAR="Hack_Regular_Nerd_Font_Complete_Mono.ttf"
    FONT_ITALIC="Hack_Italic_Nerd_Font_Complete_Mono.ttf"
    FONT_BOLD="Hack_Bold_Nerd_Font_Complete_Mono.ttf"
    FONT_BOLD_ITALIC="Hack_Bold_Italic_Nerd_Font_Complete_Mono.ttf"
    if [ ! -f "$FONT_REGULAR" ]; then
        curl -fLo $FONT_REGULAR https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_REGULAR
    fi
    if [ ! -f "$FONT_ITALIC" ]; then
        curl -fLo $FONT_ITALIC https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_ITALIC
    fi
    if [ ! -f "$FONT_BOLD" ]; then
        curl -fLo $FONT_BOLD https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_BOLD
    fi
    if [ ! -f "$FONT_BOLD_ITALIC" ]; then
        curl -fLo $FONT_BOLD_ITALIC https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
        check_download $? $FONT_BOLD_ITALIC
    fi
}

function install_pip3() {
    sudo pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim
}

function install_plugin() {
    mkdir ~/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    check_download $? "vim-plug"
    ln -s ~/.vim/lin.vim ~/.vimrc
    vim -c "PlugInstall" -c "qall"
}

function install_user_custom() {
    cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
    cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json
}

function install_neovim_config() {
    mkdir -p ~/.config
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vim/lin.vim ~/.config/nvim/init.vim
}

function install_path_variable() {
    touch ~/.linvimrc
    touch ~/.zshrc
    touch ~/.bashrc
    echo "#! /usr/bin/env bash" >> ~/.linvimrc
    echo "alias l=\"ls -lh\"" >> ~/.linvimrc
    echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
    echo "ulimit -c unlimited" >> ~/.linvimrc
    echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
    echo "export PATH=~/.vim/command:\$PATH" >> ~/.linvimrc
    echo "source ~/.linvimrc" >> ~/.zshrc
    echo "source ~/.linvimrc" >> ~/.bashrc
    source ~/.zshrc 1>/dev/null 2>&1
    source ~/.bashrc 1>/dev/null 2>&1
}

backup_linvimrc

if [ $(uname) == "Linux" ]; then
    if cat /etc/*release | grep ^NAME | grep Ubuntu 1>/dev/null 2>&1; then
        start_install "Ubuntu"
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Debian 1>/dev/null 2>&1; then
        start_install "Debian"
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Fedora 1>/dev/null 2>&1; then
        start_install "Fedora"
        bash ~/.vim/install/fedora.sh
    elif cat /etc/*release | grep ^NAME | grep Manjaro 1>/dev/null 2>&1; then
        start_install "Manjaro"
        bash ~/.vim/install/manjaro.sh
    elif cat /etc/*release | grep ^NAME | grep CentOS 1>/dev/null 2>&1; then
        start_install "CentOS"
        bash ~/.vim/install/centos.sh
    else
        echo "[lin.vim] OS not support, exiting installation!"
        exit 3
    fi
elif [ $(uname) == "FreeBSD" ]; then
    start_install "FreeBSD"
    bash ~/.vim/install/bsd.sh
elif [ $(uname) == "Darwin" ]; then
    start_install "MacOS"
    bash ~/.vim/install/macos.sh
else
    echo "[lin.vim] Unknown OS $(uname), exiting installation!"
    exit 3
fi

install_pip3
install_gui_fonts
install_plugin
install_user_custom
install_neovim_config
install_path_variable
