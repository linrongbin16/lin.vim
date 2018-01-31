#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    1. git push",
        "    2. git add, commit, and push with [comment]",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [comment]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_git()

branch = util.git_branch()

if len(sys.argv) == 1:
    print("[lin-vim] git push on '%s', path: '%s'" % (branch, os.getcwd()))
    util.run_silent('git push')
    util.run_silent('git push --tags')
else:
    comment = util.merge_args()
    print("[lin-vim] git push on '%s', comment: '%s', path: '%s'" % (branch, comment, os.getcwd()))
    util.user_confirm()
    util.run_silent('git add -A %s' % util.git_root())
    util.run_silent('git commit -m "%s"' % comment)
    util.run_silent('git push')
    util.run_silent('git push --tags')
