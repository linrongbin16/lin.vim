#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import time
import datetime
import pdb
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    1. get current system datetime like '2018-02-13 13:04:57.781'",
        "    2. transform a unix/UTC [timestamp] to datetime",
        "       [timestamp] format in integer, float can be auto detected, such as '1518621382.267' '1518621382'",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [timestamp]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)

def parse_timestamp(ts):
    dt = datetime.datetime.fromtimestamp(ts)
    return dt.strftime('%Y-%m-%d %H:%M:%S.%f')[0:23]


if len(sys.argv) <= 1:
    print(parse_timestamp(time.time()))
elif len(sys.argv) > 1:
    print(parse_timestamp(float(util.merge_args())))
else:
    util.help_msg(msg_list)
