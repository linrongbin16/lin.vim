#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    1. list git tags",
        "    2. create light git [tag]",
        "    3. create git [tag] with [comment]",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [tag]" % util.command_name(),
        "    3. %s [tag] [comment]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_repository()

branch = util.repository_branch()

if len(sys.argv) == 1:
    os.system('git pull --tags')
    os.system('git tag')
elif len(sys.argv) == 2:
    tag = sys.argv[1]
    print("[lin-vim] git tag on '%s', tag: '%s', path: '%s'" % (branch, tag, os.getcwd()))
    util.user_confirm()
    os.system('git pull --tags')
    os.system('git tag %s' % tag)
else:
    tag = sys.argv[1]
    comment = util.merge_args(1)
    print("[lin-vim] git tag on '%s', tag: '%s', comment: '%s', path: '%s'" % (branch, comment, os.getcwd()))
    util.user_confirm()
    os.system('git pull --tags')
    os.system('git tag -a $tagname -m "%s"' % (tag, comment))
