#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util
import git


msg_list = [
        "Brief:",
        "    git pull",
        "Usage:",
        "    %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_repository()

if len(sys.argv) > 2:
    util.help_msg(msg_list)

branch = util.repository_branch()

if len(sys.argv) == 1:
    print("[lin-vim] git push on '%s', path: '%s'" % (branch, os.getcwd()))
    os.system('git pull')
    os.system('git push')
else:
    comment = util.merge_args()

    print("[lin-vim] git push on '%s', comment: '%s', path: '%s'" % (branch, comment, os.getcwd()))
    util.user_confirm()
    os.system('git pull')
    os.system('git add -A %s' % util.repository_root())
    os.system('git commit -m "%s"' % comment)
    os.system('git push')
