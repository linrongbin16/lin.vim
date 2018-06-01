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
remote = util.git_remote()
remote_str = ""

if len(remote) < 1:
    print("error: remote repository doesn\'t exist")
    util.help_msg(msg_list)

if len(remote) > 1:
    for r in remote:
        remote_str = remote_str + ', ' + str(r)
    print('[lin-vim] detect multiple git remote repositories: %s' % (remote_str))
    user_input = raw_input('[lin-vim] which one do you want to pull (first one if empty)?')
    if not util.is_empty_str(user_input):
        remote_str = user_input
    else:
        remote_str = list(remote)[0]

if len(remote) == 1:
    remote_str = list(remote)[0]

print("[lin-vim] git pull from '%s', branch: '%s', path: '%s'" % (remote_str, branch, os.getcwd()))
os.system('git pull %s %s' % (remote_str, branch))
os.system('git pull --tags')
