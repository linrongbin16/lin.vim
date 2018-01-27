#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util


msg_list = [
        "Brief:",
        "    list files which contain [text] of current directory recursively",
        "Usage:",
        "    %s [text]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)

# error: missing text parameter
if len(sys.argv) < 1:
    util.help_msg(msg_list)

text = util.merge_args()
ignore = os.path.expanduser('~') + '/.vim/commands/ag.ignore'

util.run('ag', '-l', '--smart-case', '--depth', '-1', '-p', ignore, text, '.')
