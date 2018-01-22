#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    goto git repository root path, stay if cannot find repository"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}


if [ $# -gt 1 ]; then
    helpmsg
    exit 1
fi

lastdir=
curdir=$PWD
while [[ ! -d ".git" && "$lastdir" != "$curdir" ]]; do
    cd ..
    lastdir=$curdir
    curdir=$PWD
done

if [[ -d .git ]]; then
    echo $PWD
else
    exit 1
fi
