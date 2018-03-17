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
        "    transform ipv4 from [string] to uint32",
        "Usage:",
        "    %s [string]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
if len(sys.argv) <= 1:
    util.help_msg(msg_list)

ipaddr = sys.argv[1]
print(util.ip_string_to_uint32(ipaddr))
