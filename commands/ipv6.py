#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import re
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    check if [ipv6] address is valid",
        "Usage:",
        "    %s [ipv6]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
if len(sys.argv) <= 1:
    util.help_msg(msg_list)

ipaddr = sys.argv[1]
if util.is_valid_ipv6(ipaddr):
    print(1)
else:
    print(0)
