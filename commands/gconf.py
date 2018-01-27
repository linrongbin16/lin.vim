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
        "    git add",
        "Usage:",
        "    %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
os.system('git config --global core.fileMode false')
os.system('git config --global core.longpaths true')
os.system('git config --global push.default simple')
os.system('git config --global pull.default simple')

if util.repository_root() is None:
    os.system('git config core.fileMode false')
    os.system('git config core.longpaths true')
    os.system('git config push.default simple')
    os.system('git config pull.default simple')
