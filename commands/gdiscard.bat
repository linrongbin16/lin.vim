#! /usr/bin/env sh

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    git commit with [comment]"
    echo "Usage:"
    echo "    $cmdname [comment]"
    echo "Try again"
    echo ""
}

makesure() {
    read yes
    confirm=0
    if [ $yes == "yes" ]; then
        confirm=1
    fi
    if [ $yes == "Yes" ]; then
        confirm=1
    fi
    if [ $yes == "Y" ]; then
        confirm=1
    fi
    if [ $yes == "y" ]; then
        confirm=1
    fi
    if [ $confirm -eq 0 || "$confirm" == "0" ]; then
        echo "error: user not confirm"
        exit 1
    fi
}

# error: missing comment parameter
if [ $# -lt 1 ]; then
    helpmsg
    exit 1
fi

comment="$@"

# error: not a git repository
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

branch=$(git status | head -n 1 | awk '{print $3}')
echo "[lin-vim] git commit on branch: '$branch', comment: '$comment', path: '$PWD'"
echo -n "[devim] yes? "
makesure

cd $(groot)
git add -A .
git commit -m "$comment"
