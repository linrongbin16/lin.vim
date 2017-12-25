#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


if len(sys.argv) > 1:
    util.helpmsg(
            "git status",
            util.command_name())
    exit(1)

os.system("git status")
