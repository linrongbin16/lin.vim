#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" list *.[suffix] files in current directory """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. list all files in current directory")
    print("    2. list *.[suffix] file in current directory")
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [suffix]" % util.get_command_name())
    print("Try again")
    exit(1)


def list_suffix(file_list, suffix, rootdir):
    suffix = '.%s' % (suffix)
    for f in file_list:
        assert isinstance(f, str)
        if f.startswith('.'):
            continue
        if f.endswith(suffix):
            print('%s' % (os.path.relpath(f, rootdir)))


def list_all(file_list, rootdir):
    for f in file_list:
        assert isinstance(f, str)
        if f.startswith('.'):
            continue
        print('%s' % (os.path.relpath(f, rootdir)))


if __name__ == '__main__':
    util.check_help_message(help_msg)
    file_list = util.recursive_list_dir('.')
    if len(sys.argv) <= 1:
        list_all(file_list, os.getcwd())
    else:
        suffix = util.trim_quotation(sys.argv[1])
        list_suffix(file_list, suffix, os.getcwd())
