#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


if len(sys.argv) > 1:
    util.helpmsg(
            "git pull on current branch",
            util.command_name())
    exit(1)

branch = util.run("git status | head -n 1 | awk '{print $3}'")
print("[lin-vim] git pull on branch: '%s', path: '%s'" % (branch, os.getcwd()))
os.system("git pull origin %s" % branch)
os.system("git pull --tags")
