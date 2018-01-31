#! /usr/bin/env python
# -*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    1. git reset to last 1 commit, and push force to remote",
        "    2. git reset to last [N] commit, and push force to remote",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [N]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_git()

branch = util.git_branch()
n = int(sys.argv[1])
log = util.git_log(n)
print("[lin-vim] git reset to last '%s' commit on '%s', log '%s', path: '%s'" % (branch, log, os.getcwd()))
util.user_confirm()

save_dir = os.getcwd()

os.chdir(util.git_root())

if os.path.exists(save_dir):
    os.chdir(save_dir)
