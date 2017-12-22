#! /usr/bin/env python
#-*- coding:utf-8 -*-

cmdname = sys.argv[0]

def helpmsg():
    print("Brief:")
    print("    find [text] of current directory recursively")
    print("Usage:")
    print("    $cmdname [text]")
    echo "Try again"
    echo ""

# error 1: miss repository parameter
if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

text=$@
ignore=~/.vim/commands/.ignore

ag --smart-case --depth -1 -p $ignore "$text" .
