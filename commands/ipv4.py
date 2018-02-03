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
valid = False
pattern = re.compile(r'^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$')
if pattern.match(ipaddr):
    splits = ipaddr.split('.')
    part0 = splits[0]
    part1 = splits[1]
    part2 = splits[2]
    part3 = splits[3]
    if part0 >= 0 and part0 <= 255 and part1 >= 0 and part1 <= 255 and part2 >= 0 and part2 <= 255 and part3 >= 0 and part3 <= 255:
        print(1)
        exit(0)

print(0)
exit(0)
