#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    transform ipv6 from [uint128] to string"
    echo "Usage:"
    echo "    $cmdname [uint128]"
    echo "Try again"
    echo ""
}

if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

converter() {
    echo -n $(($(($(($((${1}/256))/256))/256))%256)).
    echo -n $(($(($((${1}/256))/256))%256)).
    echo -n $(($((${1}/256))%256)).
    echo $((${1}%256))
}

ipaddr="$1"
converter "$ipaddr"
