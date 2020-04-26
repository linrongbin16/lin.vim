#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" translate ipv4 address string to uint32 """

import sys
import os
import re
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    transform ipv4 from [ipstr] to uint32")
    print("Usage:")
    print("    %s [ipstr]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) != 2:
        help_msg()
    ipaddr = sys.argv[1]
    print(util.ipv4_string_to_uint32(ipaddr))
