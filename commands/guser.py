#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    git config [username]",
        "Usage:",
        "    %s [username]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_repository()

name = util.merge_args()
os.system('git config --global user.name "%s"' % name)
