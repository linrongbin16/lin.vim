#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    make git [tag] with optional [comment]"
    echo "Usage:"
    echo "    $cmdname [tag]"
    echo "    $cmdname [tag] [comment]"
    echo "Try again"
    echo ""
}

makesure() {
    read yes
    confirm=0
    if [[ $yes == "yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Y" ]]; then
        confirm=1
    fi
    if [[ $yes == "y" ]]; then
        confirm=1
    fi
    if [[ $confirm -eq 0 || "$confirm" == "0" ]]; then
        echo "error: user not confirm"
        exit 1
    fi
}

# error: miss parameters
if [[ $# -lt 1 ]]; then
    echo "error: miss parameter tag"
    helpmsg
    exit 1
fi

comment=
lighttag=1
tagname=$1

if [[ $# -ge 1 ]]; then
    shift
    comment="$@"
fi

# error: not a git repository
if ! git status 1>/dev/null 2>&1; then
    echo "error: not a git repository"
    helpmsg
    exit 1
fi

git pull --tags
if [[ $comment ]]; then
    echo "[lin-vim] git annotated tag: '$tagname', comment: '$comment', path: '$PWD'"
    lighttag=0
else
    echo "[lin-vim] git light tag: '$tagname', path: '$PWD'"
fi
echo -n "[lin-vim] yes? "
makesure

if [[ $lighttag -eq 1 || "$lighttag" == "1" ]]; then
    git tag $tagname
else
    git tag -a $tagname -m "$comment"
fi
git push --tags
