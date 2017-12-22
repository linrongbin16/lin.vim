#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    replace [regex] to [text] of all text files in current directory recursively"
    echo "Usage:"
    echo "    $cmdname [regex] [text]"
    echo "Try again"
    echo ""
}

# error 1: miss parameter
if [[ $# -lt 2 ]]; then
    helpmsg
    exit 1
fi

newtext="$1"
oldregex="$2"
backup=$PWD.old
while [[ -d $backup ]]; do
    backup=$backup.old
done
echo "[lin-vim] replace $oldregex with $newtext in $PWD, backup is $backup"
cp -rf $PWD $backup

file_text_file() {
    onefile=$1
    tempfile=$onefile.$$.tmp
    while [[ -f $tempfile ]]; do
        tempfile=$tempfile.tmp
    done
    sed "s/$newtext/$oldregex/g" < $onefile >$tempfile
    mv $tempfile $onefile
}

file_text_dir() {
    curdir=$1
    cd $curdir
    for i in $(ls); do
        if [[ -d $i ]]; then
            if [[ ${i:0:1} != '.' ]]; then
                file_text_dir $i
            fi
        elif [[ -f $i ]]; then
            file_text_file "$i"
        fi
    done
    cd ..
}

file_text_dir .
