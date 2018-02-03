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
        "    transform an ipv4 [uint32] to string"
        "Usage:",
        "    %s [uint32]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
ipaddr = sys.argv[1]

for i in xrange(4):
    s = ipaddr & 256
    ipaddr = ipaddr / 256
    sys.stdout.write(str(s))
    if i < 3:
        sys.stdout.write('.')
    else:
        sys.stdout.write(os.linesep())
