#!/usr/bin/env bash

# if you need customize rust installer, please use below
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install rust interactively with default settings
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
