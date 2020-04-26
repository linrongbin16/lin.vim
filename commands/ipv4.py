#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" validate ipv4 address """

import sys
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    check if [ipv4] address is valid")
    print("Usage:")
    print("    %s [ipv4]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) != 2:
        help_msg()
    if util.check_valid_ipv4(sys.argv[1]):
        print(1)
    else:
        print(0)
