#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    1. delete file that suffix is [type]"
    echo "    2. delete file that has no suffix"
    echo "Usage:"
    echo "    1. $cmdname [type]"
    echo "    2. $cmdname"
    echo "Try again"
    echo ""
}

file_delete_no_suffix_dir() {
    cd $1
    for i in $(ls); do
        ext="${i##*.}"
        if [[ -f $i ]]; then
            if [[ -z $ext || $ext == "$i" ]]; then
                echo "remove $PWD/$i"
                rm "$i"
            fi
        fi
        if [[ -d $i && ${i:0:1} != '.' ]]; then
            file_delete_no_suffix_dir $i
        fi
    done
    cd ..
}

file_delete_suffix_dir() {
    cd $1
    for i in $(ls); do
        ext="${i##*.}"
        if [[ -f $i ]]; then
            if [[ $ext == "${pattern}" && $ext != "$i" ]]; then
                echo "remove $PWD/$i"
                rm "$i"
            fi
        fi
        if [[ -d $i && ${i:0:1} != '.' ]]; then
            file_delete_suffix_dir $i
        fi
    done
    cd ..
}

pattern="${1##*/}"


# error 1: miss repository parameter
if [[ $# -gt 1 ]]; then
    helpmsg
    exit 1
elif [[ $# -lt 1 ]]; then
    file_delete_no_suffix_dir .
else
    file_delete_suffix_dir .
fi
