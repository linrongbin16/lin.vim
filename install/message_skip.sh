#!/usr/bin/env bash

IFS_SAVE="$IFS"
IFS="\' \'"
text="$*"
IFS=$IFS_SAVE
printf "[lin.vim] - \'%s\' already exist, skip...\n" "$text"
