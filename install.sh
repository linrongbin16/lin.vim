#!/usr/bin/env bash

cd ~/.vim

if [ $(uname) == "Linux" ]; then
    if cat /etc/*release | grep ^NAME | grep Ubuntu 1>/dev/null 2>&1; then
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Debian 1>/dev/null 2>&1; then
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Fedora 1>/dev/null 2>&1; then
        bash ~/.vim/install/fedora.sh
    elif cat /etc/*release | grep ^NAME | grep Manjaro 1>/dev/null 2>&1; then
        bash ~/.vim/install/manjaro.sh
    else
        echo "[lin.vim] OS not supprot"
        exit 1;
    fi
elif [ $(uname) == "FreeBSD" ]; then
    bash ~/.vim/install/bsd.sh
elif [ $(uname) == "Darwin" ]; then
    bash ~/.vim/install/macos.sh
else
    echo [lin.vim] Unknown OS, installation error!
fi
