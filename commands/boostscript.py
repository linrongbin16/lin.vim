#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" boostscript help document """

import sys
import os
import time
import datetime
sys.path.append('.')
import util


def auto_echo(command_home):
    os.chdir(command_home)
    sys.path.append('.')
    echo = list()
    command_list = [x for x in os.listdir('.') if x.endswith('.py')]
    command_list.sort()
    space_cnt = max(
        [len(x)
         for x in command_list if util.get_file_name_suffix(x) == 'py']) - 2
    for i in command_list:
        if util.get_file_name_suffix(i) != 'py':
            continue
        command_name = util.get_file_name_base(i)
        command_module = __import__(command_name)
        command_doc = command_module.__doc__
        if command_doc is None:
            continue
        if command_name == util.get_command_name():
            continue
        spaces = ' ' * (space_cnt - len(command_name))
        echo.append("    %s%s- %s" % (command_name, spaces, command_doc))
    return echo


def print_echo(echo):
    print("Usage:")
    for e in echo:
        print(e)
    print("")
    print("Use -h/--help for more detail. Enjoy :)")


if __name__ == '__main__':
    echo = list()
    echo.extend(auto_echo(util.get_command_home()))
    print_echo(echo)
