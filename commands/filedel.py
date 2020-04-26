#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" delete *.[suffix] files in current directory """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. delete *.[suffix] file")
    print("    2. delete file which has no suffix")
    print("Usage:")
    print("    1. %s [suffix]" % util.get_command_name())
    print("    2. %s" % util.get_command_name())
    print("Try again")
    exit(1)


def delete_suffix(file_list, suffix):
    suffix = '.%s' % suffix
    for f in file_list:
        assert isinstance(f, str)
        relname = os.path.relpath(f)
        if relname.startswith('.'):
            continue
        if relname.endswith(suffix):
            print('[boostscript] remove %s' % f)
            os.remove(f)


def delete_no_suffix(file_list):
    for f in file_list:
        assert isinstance(f, str)
        relname = os.path.relpath(f)
        if relname.startswith('.'):
            continue
        if relname.find('.') < 0:
            print('[boostscript] remove %s' % f)
            os.remove(f)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) > 2:
        help_msg()
    file_list = util.recursive_list_dir('.')
    if len(sys.argv) <= 1:
        delete_no_suffix(file_list)
    else:
        suffix = util.trim_quotation(sys.argv[1])
        delete_suffix(file_list, suffix)
