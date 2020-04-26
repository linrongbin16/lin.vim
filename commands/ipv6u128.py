#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" translate ipv6 address string to uint128 """

import sys
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    transform ipv6 from [ipstr] to [uint128]")
    print("Usage:")
    print("    %s [ipstr]" % (util.get_command_name()))
    print("Try again")
    exit(1)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        help_msg()
    ipaddr = sys.argv[1]
    print(util.ipv6_string_to_uint128(ipaddr))
