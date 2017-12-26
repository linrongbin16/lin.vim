#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    find host by [ip]"
    echo "Usage:"
    echo "    $cmdname [ip]"
    echo "Try again"
    echo ""
}

if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

ipaddr="$(echo -e "$1" | sed 's/^ *//g' | sed 's/ *$//g')"
grep "$ipaddr" /etc/hosts | awk '{print $2}'
