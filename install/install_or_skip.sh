#!/bin/bash

INSTALL=~/.vim/install
COMMAND="$1"
TARGET="$2"

if ! type "$TARGET" >/dev/null 2>&1; then
    $INSTALL/msg.sh "install '$TARGET' with command: '$COMMAND'"
    eval "$COMMAND"
else
    $INSTALL/msg_skip.sh $TARGET
fi
