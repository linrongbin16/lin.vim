#! /usr/bin/env bash

import sys
sys.path.append('.')
import os
import util


if len(sys.argv) <= 1:
    util.helpmsg(
            "create new git [branch]",
            "%s [branch]" % util.command_name())
    exit(1)

branch = util.get_parameter()
os.system("git checkout -b %s" % branch)
