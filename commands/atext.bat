@ECHO OFF

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    find [text] of current directory recursively"
    echo "Usage:"
    echo "    $cmdname [text]"
    echo "Try again"
    echo ""
}

# error 1: miss repository parameter
if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

text=$@
ignore=~/.vim/commands/ag.ignore

ag --smart-case --depth -1 -p $ignore "$text" .
