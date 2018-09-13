#!/usr/bin/env bash

cd ~/.vim
git pull

if [ $(uname) == "Linux" ]; then
    if cat /etc/*release | grep ^NAME | grep CentOS 1>/dev/null 2>&1; then
        bash ~/.vim/install/centos.sh
    elif cat /etc/*release | grep ^NAME | grep Red 1>/dev/null 2>&1; then
        bash ~/.vim/install/redhat.sh
    elif cat /etc/*release | grep ^NAME | grep Fedora 1>/dev/null 2>&1; then
        bash ~/.vim/install/fedora.sh
    elif cat /etc/*release | grep ^NAME | grep Ubuntu 1>/dev/null 2>&1; then
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Debian 1>/dev/null 2>&1; then
        bash ~/.vim/install/debian.sh
    elif cat /etc/*release | grep ^NAME | grep Mint 1>/dev/null 2>&1; then
        bash ~/.vim/install/mint.sh
    elif cat /etc/*release | grep ^NAME | grep Knoppix 1>/dev/null 2>&1; then
        bash ~/.vim/install/kanoppix.sh
    else
        echo "[lin-vim] OS not detected, cannot install"
        exit 1;
    fi
elif [ $(uname) == "FreeBSD" ]; then
    bash ~/.vim/install/bsd.sh
elif [ $(uname) == "Darwin" ]; then
    bash ~/.vim/install/macos.sh
else
    echo "[lin-vim] Please try 'cmd install.bat'"
fi
