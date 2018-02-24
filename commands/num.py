#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import re
sys.path.append('.')
import util
import numexpr

msg_list = [
        "Brief:",
        "    calculate math [expression]",
        "Usage:",
        "    %s [expression]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
if len(sys.argv) <= 1:
    util.help_msg(msg_list)

expression = util.merge_args()
print(numexpr.evaluate(expression))
