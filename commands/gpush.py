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

remote = util.git_remote()
remote_str = ""
push_one = True

if len(remote) < 1:
    print("error: remote repository doesn\'t exist")
    util.help_msg(msg_list)

if len(remote) > 1:
    for r in remote:
        remote_str = remote_str + ', ' + str(r)
    print('[lin-vim] detect multiple git remote repositories: %s' % (remote_str))
    user_input = raw_input('[lin-vim] which one do you want to push (all if empty)?')
    if not util.is_empty_str(user_input):
        remote_str = user_input
    else:
        push_one = False

if len(remote) == 1:
    remote_str = list(remote)[0]

if len(sys.argv) == 1:
    print("[lin-vim] git push to '%s', branch: '%s', path: '%s'" % (remote_str, branch, os.getcwd()))
    if push_one:
        os.system('git push %s %s' % (remote_str, branch))
        os.system('git push --tags')
    else:
        for r in remote:
            os.system('git push %s %s' % (r, branch))
            os.system('git push --tags')
else:
    comment = util.merge_args()
    print("[lin-vim] git push to '%s', branch: '%s', comment: '%s', path: '%s'" % (remote_str, branch, comment, os.getcwd()))
    util.user_confirm()
    os.system('git add -A %s' % util.git_root())
    os.system('git commit -m "%s"' % comment)
    if push_one:
        os.system('git push %s %s' % (remote_str, branch))
        os.system('git push --tags')
    else:
        for r in remote:
            os.system('git push %s %s' % (r, branch))
            os.system('git push --tags')
