#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    find [text] of current directory recursively",
        "Usage:",
        "    %s [text]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)

# error: miss text parameter
if len(sys.argv) < 1:
    util.help_msg(msg_list)

os.system('ag --smart-case --depth -1 -p %s %s .' % (util.ag_ignore(), util.merge_args()))
