#!/usr/bin/env bash

# use https://github.com/canha/golang-tools-install-script
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
export PATH=$HOME/.go/bin:$PATH
