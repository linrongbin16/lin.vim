#! /usr/bin/env python
#-*- coding:utf-8 -*-

helpmsg() {
    echo "Brief:"
    echo "    1. list all host-ip mapping"
    echo "    2. find specified [host/ip] mapping"
    echo "Usage:"
    echo "    1. $cmdname"
    echo "    2. $cmdname [host/ip]"
    echo "Try again"
    echo ""
}

if [[ $# -lt 1 ]]; then
    while IFS='' read -r oneline || [[ -n "$oneline" ]]; do
        oneline="$(echo -e "$oneline" | sed 's/^ *//g' | sed 's/ *$//g')"
        if [[ -n "$oneline" && ${oneline:0:1} != '#' ]]; then
            echo "$oneline"
        fi
    done < "$zh_hosts"
    echo ""
else
    for i in $@; do
        i="$(echo -e "$i" | sed 's/^ *//g' | sed 's/ *$//g')"
        grep "$i" $zh_hosts
        echo ""
    done
fi
