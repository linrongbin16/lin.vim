#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    1. show current directory info"
    echo "    2. show [file] info"
    echo "    3. show [directory] info"
    echo "Usage:"
    echo "    1. $cmdname"
    echo "    2. $cmdname [file]"
    echo "    3. $cmdname [directory]"
    echo "Try again"
    echo ""
}

targetflie=.

# error 1: miss repository parameter
if [[ $# -ge 1 ]]; then
    targetflie=$1
fi

file_info_dir() {
    cd $1
    for i in `ls`; do
        if [[ "${i##*/}" == "${pattern}" ]]; then
            echo "remove $PWD/$i"
            rm "$i"
        fi
        if [[ ${i:0:1} != '.' ]]; then
            file_info_dir $i
        fi
    done
    cd ..
}

file_info_file() {
    echo ""
}

pattern="${1##*/}"

file_info_dir .
