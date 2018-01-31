#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util


msg_list = [
        "Brief:",
        "    git commit with [comment]",
        "Usage:",
        "    %s [comment]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_git()

if len(sys.argv) != 2:
    util.help_msg(msg_list)

comment = util.merge_args()

branch = util.git_branch()
print("[lin-vim] git commit on branch: '%s', comment: '%s', path: '%s'" % (branch, comment, os.getcwd()))
util.user_confirm()
util.run_silent('git add -A %s' % util.git_root())
util.run_silent('git commit -m "%s"' % comment)
