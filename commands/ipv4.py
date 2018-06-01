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
        "    check if [ipv4] address is valid",
        "Usage:",
        "    %s [ipv4]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
ipaddr = sys.argv[1]
if util.is_valid_ipv4(ipaddr):
    print(1)
else:
    print(0)
