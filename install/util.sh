#!/bin/bash

function message() {
    local content="$*"
    printf "[lin.vim] - %s\n" "$content"
}


function message_skip() {
    local target=$1
    message "'$target' already exist, skip..."
}
