#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" translate uint32 ipv4 address to string """

import sys
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    transform an ipv4 [uint32] to ipstr")
    print("Usage:")
    print("    %s [uint32]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) != 2:
        help_msg()
    ipaddr = int(sys.argv[1])
    print(util.ipv4_uint32_to_string(ipaddr))
