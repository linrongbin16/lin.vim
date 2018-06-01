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
        "    transform an ipv4 [uint32] to string",
        "Usage:",
        "    %s [uint32]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
if len(sys.argv) <= 1:
    util.help_msg(msg_list)

ipaddr = int(sys.argv[1])
print(util.ip_uint32_to_string(ipaddr))
