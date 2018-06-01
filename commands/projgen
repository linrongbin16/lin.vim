#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    create tags and cscope.out for project, based on 'ctags' and 'cscope'"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}

make_project() {
    curdir=$1
    cd $curdir
    while true; do
        if [ -d ".git" ]; then
            break
        fi
        if [ -d ".svn" ]; then
            break
        fi
        if [ -d ".idea" ]; then
            break
        fi
        if [ -f ".ycm_extra_conf.py" ]; then
            break
        fi
        if [ -f "tags" ]; then
            break
        fi
        if [ -f "cscope.out" ]; then
            break
        fi
        if [ "$PWD" == "/" ]; then
            cd $curdir
            break
        fi
        cd ..
    done
    projcscope
    projtags
}

make_project .
