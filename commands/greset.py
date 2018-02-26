#! /usr/bin/env python
# -*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    1. git reset to last commit",
        "    2. git reset to last [N] commit",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [N]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_git()

branch = util.git_branch()
n = 1
if len(sys.argv) > 1:
    n = int(sys.argv[1])
commit_number = util.git_last_commit(n - 1)
print("[lin-vim] git reset to last '%s' commit '%s', branch: '%s', path: '%s'" % (branch, commit_number, os.getcwd()))
util.user_confirm()

save_dir = os.getcwd()
os.chdir(util.git_root())
os.system('git commit -m "save previous work before reset to git commit %s"' % (commit_number))
os.system('git reset HEAD~')
os.system('git add -A .')
os.system('git commit -m "reset to git commit %s"' % (commit_number))
print("[lin-vim] reset to '%s' success, use 'gpush -f' overwriting remote repository" % (commit_number))
if os.path.exists(save_dir):
    os.chdir(save_dir)
