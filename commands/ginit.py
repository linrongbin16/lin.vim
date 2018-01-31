#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    1. init a git repository at current folder",
        "    2. init a git [repository]",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [git]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)

if len(sys.argv) > 2:
    util.help_msg(msg_list)
elif len(sys.argv) <= 1:
    util.run_silent('git init')
    util.run_silent('touch README.md')
    util.run_silent('touch .gitignore')
    util.run_silent('git add README.md')
    util.run_silent('git add .gitignore')
    util.run_silent('git commit -m "initialize git"')
else:
    repo = sys.argv[1]
    dot_git = None
    use_left_slash = True

    while repo[-1] == '/' or repo[-1] == '\\':
        repo = repo[:-1]
    if repo.find('/') >= 0 and repo.find('\\') >= 0:
        print("error: not a valid path")
        exit(1)
    if repo.find('\\') >= 0:
        dot_git = repo + '\\.git'
    else:
        dot_git = repo + '/.git'
    if os.path.exists(dot_git):
        print("error: git repository already exist")
        exit(1)
    if not os.path.exists(repo):
        util.run_silent('mkdir -p %s' % repo)
    os.chdir(repo)
    util.run_silent('git init')
    util.run_silent('touch README.md')
    util.run_silent('touch .gitignore')
    util.run_silent('git add README.md')
    util.run_silent('git add .gitignore')
    util.run_silent('git commit -m "initialize git"')
