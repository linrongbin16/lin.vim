#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    git pull",
        "Usage:",
        "    %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_git()

if len(sys.argv) != 1:
    util.help_msg(msg_list)

branch = util.git_branch()
print("[lin-vim] git pull on '%s', path: '%s'" % (branch, os.getcwd()))
util.run_silent('git pull')
util.run_silent('git pull --tags')
