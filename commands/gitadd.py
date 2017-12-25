#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


# error 1: git comment is a must
if len(sys.argv) <= 2:
    util.helpmsg(
            "git add and commit on current branch with [comment]",
            "%s [comment]" % sys.argv[0])
    exit(1)

os.system("git add -A .")
