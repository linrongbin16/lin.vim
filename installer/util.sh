#!/bin/bash

function message() {
    local content="$*"
    printf "[lin.vim] - %s\n" "$content"
}


function skip_message() {
    local target="$1"
    message "'$target' already exist, skip..."
}

function error_message() {
    local content="$*"
    message "error! $content"
}

function try_backup() {
    local src=$1
    if [[ -f "$src" || -d "$src" ]]; then
        local target=$src.$(date +"%Y-%m-%d.%H-%M-%S.%6N")
        message "backup '$src' to '$target'"
        mv $src $target
    fi
}

function try_delete() {
    local src=$1
    if [[ -f "$src" || -d "$src" ]]; then
        message "delete '$src'"
        rm -rf $src
    fi
}

function reset_file() {
    echo -n ''>$1
}

function install_or_skip() {
    local command="$1"
    local target="$2"
    if ! type "$target" >/dev/null 2>&1; then
        message "install '$target' with command: '$command'"
        eval "$command"
    else
        skip_message $target
    fi
}

function install_universal_ctags() {
    local VIM_HOME=$HOME/.vim
    local CTAGS_HOME=$VIM_HOME/universal-ctags

    message "install universal-ctags from source"
    cd $VIM_HOME
    git clone https://github.com/universal-ctags/ctags.git $CTAGS_HOME
    cd $CTAGS_HOME
    ./autogen.sh
    ./configure
    make
    sudo make install
}
