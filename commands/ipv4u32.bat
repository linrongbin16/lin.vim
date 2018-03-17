#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    transform ipv4 from [string] to uint32"
    echo "Usage:"
    echo "    $cmdname [string]"
    echo "Try again"
    echo ""
}

if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

converter() {
    ipaddr=$1
    ipnumber=0
    for (( i=0; i<4; ++i )); do
        ((ipnumber+=${ipaddr%%.*}*$((256**$((3-${i}))))))
        ipaddr=${ipaddr#*.}
    done
    echo $ipnumber
}

converter "$1"
