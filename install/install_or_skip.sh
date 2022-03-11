#!/usr/bin/env bash

INSTALL_COMMAND="$1"
INSTALL_TARGET="$2"

if ! type "$INSTALL_TARGET" > /dev/null; then
    eval "$INSTALL_COMMAND"
else
    printf "[lin.vim] - \'%s\' already exist, skip...\n" "$INSTALL_TARGET"
fi
