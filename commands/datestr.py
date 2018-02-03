#! /usr/bin/env sh

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    transform [timestamp] to date-time"
    echo "Usage:"
    echo "    $cmdname [timestamp]"
    echo "Try again"
    echo ""
}

if [ "$1" == "--help" || "$1" == "-h" ]; then
    helpmsg
    exit 1
fi

# error: missing parameter
if [ $# -lt 1 ]; then
    helpmsg
    exit 1
fi

utc=$1

date -r "$utc" "+%Y-%m-%d %H:%M:%S"
