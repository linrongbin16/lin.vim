#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" validate ipv6 address """

import sys
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    check if [ipv6] address is valid")
    print("Usage:")
    print("    %s [ipv6]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) != 2:
        help_msg()
    ipaddr = sys.argv[1]
    if util.check_valid_ipv6(ipaddr):
        print(1)
    else:
        print(0)
