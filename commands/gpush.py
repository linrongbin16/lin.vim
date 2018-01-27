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
util.check_repository()

branch = util.repository_branch()

if len(sys.argv) == 1:
    print("[lin-vim] git push on '%s', path: '%s'" % (branch, os.getcwd()))
    os.system('git push')
else:
    comment = util.merge_args()
    print("[lin-vim] git push on '%s', comment: '%s', path: '%s'" % (branch, comment, os.getcwd()))
    util.user_confirm()
    os.system('git add -A %s' % util.repository_root())
    os.system('git commit -m "%s"' % comment)
    os.system('git push')
