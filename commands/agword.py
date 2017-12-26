#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


# error 1: miss repository parameter
if len(sys.argv) <= 1:
    util.helpmsg(
        "find [word] of current directory recursively",
        "%s [word]" % util.command_name())
    exit(1)

os.system("ag -w --smart-case --depth -1 -p %s \"%s\" ." % (util.ag_ignore, util.get_parameter()))
