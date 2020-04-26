#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" translate uint128 ipv6 string to string """

import sys
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    transform ipv6 from [uint128] to ipstr")
    print("Usage:")
    print("    %s [uint128]" % (util.get_command_name()))
    print("Try again")
    exit(1)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        help_msg()
    ipaddr = sys.argv[1]
    print(util.ipv6_uint128_to_string(ipaddr))
