#! /usr/bin/env sh

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    git list all modifies"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}

if [ $# -eq 1 ]; then
    if [ "$1" == "--help" || "$1" == "-h" ]; then
        helpmsg
        exit 1
    fi
fi

# error: not a git repository
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

git ls-files -m
