#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


# error 1: miss repository parameter
if len(sys.argv) <= 1:
    util.helpmsg(
            "list files which contain [text] of current directory recursively",
            "%s [text]" % sys.argv[0])
    exit(1)

ignore = "~/.vim/commands/ag.ignore"
if sys.platform[0:3] == "win":
    ignore = "%HOMEPATH%\\.vim\\commands\\ag.ignore"
os.system("ag -l --smart-case --depth -1 -p %s \"%s\" ." % (ignore, util.get_parameter()))
