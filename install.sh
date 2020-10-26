#!/usr/bin/env bash

function lin_vim_check_fail() {
    if [ $1 -ne 0 ]; then
        echo "[lin.vim] Download \"$2\" failed! Please check your network and try again."
        exit 3
    fi
}

function lin_vim_start_install() {
    sudo echo "[lin.vim] Install for $1" || { echo "[lin.vim] sudo not found"; exit 1; }
}

function lin_vim_backup() {
    if [ -f ~/.linvimrc ]; then
        LINVIMRC_BAK=~/.linvimrc.$(date +%s).bak
        echo "[lin.vim] back up .linvimrc to $LINVIMRC_BAK"
        mv ~/.linvimrc $LINVIMRC_BAK
    fi
}

function lin_vim_gui_fonts() {
    if [ $(uname) == "Darwin" ]; then
        cd ~/Library/Fonts
    else
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    fi
    FONT_REGULAR="Hack Regular Nerd Font Complete Mono.ttf"
    FONT_ITALIC="Hack Italic Nerd Font Complete Mono.ttf"
    FONT_BOLD="Hack Bold Nerd Font Complete Mono.ttf"
    FONT_BOLD_ITALIC="Hack Bold Italic Nerd Font Complete Mono.ttf"
    if [ ! -f $FONT_REGULAR ]; then
        curl -fLo $FONT_REGULAR https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
        check_fail $? $FONT_REGULAR
    fi
    if [ ! -f $FONT_ITALIC ]; then
        curl -fLo $FONRI https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
        check_fail $? $FONRI
    fi
    if [ ! -f $FONT_BOLD ]; then
        curl -fLo $FONT_BOLD https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
        check_fail $? $FONT_BOLD
    fi
    if [ ! -f $FONT_BOLD_ITALIC ]; then
        curl -fLo $FONT_BOLD_ITALIC https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
        check_fail $? $FONT_BOLD_ITALIC
    fi
}

function lin_vim_pip3() {
    sudo pip3 install pyOpenSSL pep8 flake8 pylint black chardet jedi neovim
}

function lin_vim_plugin() {
    mkdir ~/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    check_fail $? "vim-plug"
    ln -s ~/.vim/lin.vim ~/.vimrc
    vim -c "PlugInstall" -c "qall"
}

function lin_vim_user_custom() {
    cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
    cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json
}

function lin_vim_neovim_config() {
    mkdir -p ~/.config
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vim/lin.vim ~/.config/nvim/init.vim
}

function lin_vim_path_variable() {
    touch ~/.linvimrc
    touch ~/.zshrc
    echo "#! /usr/bin/env bash" >> ~/.linvimrc
    echo "alias l=\"ls -lh\"" >> ~/.linvimrc
    echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
    echo "ulimit -c unlimited" >> ~/.linvimrc
    echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
    echo "export PATH=~/.vim/command:\$PATH" >> ~/.linvimrc
    echo "source ~/.linvimrc" >> ~/.zshrc
    source ~/.zshrc 1>/dev/null 2>&1
}

lin_vim_backup

if [ $(uname) == "Linux" ]; then
    if cat /etc/*release | grep ^NAME | grep Ubuntu 1>/dev/null 2>&1; then
        lin_vim_start_install "Ubuntu"
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Debian 1>/dev/null 2>&1; then
        lin_vim_start_install "Debian"
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Fedora 1>/dev/null 2>&1; then
        lin_vim_start_install "Fedora"
        bash ~/.vim/install/fedora.sh
    elif cat /etc/*release | grep ^NAME | grep Manjaro 1>/dev/null 2>&1; then
        lin_vim_start_install "Manjaro"
        bash ~/.vim/install/manjaro.sh
    else
        echo "[lin.vim] OS not supprot, exiting installation!"
        exit 3
    fi
elif [ $(uname) == "FreeBSD" ]; then
    lin_vim_start_install "FreeBSD"
    bash ~/.vim/install/bsd.sh
elif [ $(uname) == "Darwin" ]; then
    lin_vim_start_install "MacOS"
    bash ~/.vim/install/macos.sh
else
    echo "[lin.vim] Unknown OS $(uname), exiting installation!"
    exit 3
fi

lin_vim_pip3
lin_vim_gui_fonts
lin_vim_plugin
lin_vim_user_custom
lin_vim_neovim_config
lin_vim_path_variable
