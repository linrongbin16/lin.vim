#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


# error 1: git comment is a must
if len(sys.argv) <= 2:
    util.helpmsg(
            "git add current branch",
            util.command_name())
    exit(1)

os.system("git add -A .")
