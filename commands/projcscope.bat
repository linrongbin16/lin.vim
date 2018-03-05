#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    create cscope.out for project, based on 'cscope'"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}

cscfile="$PWD/cscope.files"

list_file_dir() {
    curdir=$1
    cd $curdir
    for i in $(ls); do
        if [ -f $i ]; then
            if [ ${i:0:1} != "." && ${i} != "tags" ]; then
                echo "$PWD/$i" >> $cscfile
            fi
        fi
        if [ -d $i ]; then
            if [ ${i:0:1} != "." ]; then
                list_file_dir $i
            fi
        fi
    done
    cd ..
}

make_cscope_files() {
    curdir=$1
    cd $curdir
    if [ -f $cscfile ]; then
        rm $cscfile
    fi
    touch $cscfile
    list_file_dir .
}

echo "[lin-vim] generate cscope.out at $PWD"
origdir=$PWD
make_cscope_files .
cd $origdir
if [ ! -f $cscfile ]; then
    helpmsg
    exit 1
fi
cscope -Rbq -i $cscfile &
