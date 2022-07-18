#!/bin/bash

COMMAND="$1"
TARGET="$2"

if ! type "$TARGET" >/dev/null 2>&1; then
    eval "$COMMAND"
else
    $INSTALL/msg.sh "\'${TARGET}\' already exist, skip...\n"
fi
