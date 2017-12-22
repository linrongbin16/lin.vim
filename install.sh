#!/usr/bin/env bash

echo "[lin-vim] installing Lin Rongbin's Vim Distribution"
echo ""

cd ~/.vim
git pull origin master

if [[ $(uname) == "Linux" ]]; then
    if cat /etc/*release | grep ^NAME | grep CentOS 1>/dev/null 2>&1; then
        bash ~/.vim/setup/centos.sh
    elif cat /etc/*release | grep ^NAME | grep Red 1>/dev/null 2>&1; then
        bash ~/.vim/setup/redhat.sh
    elif cat /etc/*release | grep ^NAME | grep Fedora 1>/dev/null 2>&1; then
        bash ~/.vim/setup/fedora.sh
    elif cat /etc/*release | grep ^NAME | grep Ubuntu 1>/dev/null 2>&1; then
        bash ~/.vim/setup/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Debian 1>/dev/null 2>&1; then
        bash ~/.vim/setup/debian.sh
    elif cat /etc/*release | grep ^NAME | grep Mint 1>/dev/null 2>&1; then
        bash ~/.vim/setup/mint.sh
    elif cat /etc/*release | grep ^NAME | grep Knoppix 1>/dev/null 2>&1; then
        bash ~/.vim/setup/kanoppix.sh
    else
        echo "[lin-vim] OS not detected, cannot setup"
        exit 1;
    fi
elif [[ $(uname) == "FreeBSD" ]]; then
    bash ~/.vim/setup/bsd.sh
elif [[ $(uname) == "Darwin" ]]; then
    bash ~/.vim/setup/macos.sh
else
	echo "[lin-vim] Windows not support"
fi
