#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" get datetime like '2018-06-04 13:04:28.821' from now or from timestamp """

import sys
import time
import datetime
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. get 'yyyy-MM-dd HH:mm:ss.SSS' datetime")
    print(
        "    2. convert [timestamp](such as '1528088668.821') to local datetime string in 'yyyy-MM-dd HH:mm:ss.SSS' format"
    )
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [timestamp]" % util.get_command_name())
    print("Try again")
    exit(1)


def date_string(ts):
    dt = datetime.datetime.fromtimestamp(ts)
    return dt.strftime('%Y-%m-%d %H:%M:%S.%f')[0:23]


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) <= 1:
        print(date_string(time.time()))
    else:
        print(date_string(float(util.get_sys_args_one_line())))
