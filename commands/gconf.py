#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    git add",
        "Usage:",
        "    %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.run_silent('git config --global core.fileMode false')
util.run_silent('git config --global core.longpaths true')
util.run_silent('git config --global push.default simple')
util.run_silent('git config --global pull.default simple')

if util.git_root() is None:
    util.run_silent('git config core.fileMode false')
    util.run_silent('git config core.longpaths true')
    util.run_silent('git config push.default simple')
    util.run_silent('git config pull.default simple')
