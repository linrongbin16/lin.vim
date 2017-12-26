#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


# error 1: miss repository parameter
if len(sys.argv) <= 1:
    util.helpmsg(
            "count [text] of current directory recursively",
            "{} [text]".format(sys.argv[0]))
    exit(1)

os.system("ag -c --smart-case --depth -1 -p {} \"{}\" .".format(util.ag_ignore, util.get_parameter()))
