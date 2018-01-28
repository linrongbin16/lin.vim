#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    git status",
        "Usage:",
        "    %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_repository()

if len(sys.argv) > 1:
    util.help_msg(msg_list)

os.system('git status')
