#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" replace text of *.[suffix] files in current directory """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. replace [origin] with [text] of all files in current folder")
    print(
            "    2. replace [origin] with [text] of *.[suffix] files in current folder"
            )
    print("Usage:")
    print("    1. %s [origin] [text]" % util.get_command_name())
    print("    2. %s [origin] [text] [suffix]" % util.get_command_name())
    print("Try again")
    exit(1)


def replace_suffix(file_list, suffix, origin, text):
    suffix = '.%s' % (suffix)
    for f in file_list:
        assert isinstance(f, str)
        if f.startswith('.'):
            continue
        if not f.endswith(suffix):
            continue
        try:
            with open(f, 'r') as fp:
                content = fp.read()
                fp.close()
            with open(f, 'w') as fp:
                new_content = content.replace(origin, text)
                fp.write(new_content)
        except Exception as e:
            print("Error! file:%s, exception:%s" % (f, str(e)))


def replace_all(file_list, origin, text):
    for f in file_list:
        assert isinstance(f, str)
        if f.startswith('.'):
            continue
        try:
            with open(f, 'r') as fp:
                content = fp.read()
                fp.close()
            with open(f, 'w') as fp:
                new_content = content.replace(origin, text)
                fp.write(new_content)
                fp.close()
        except Exception as e:
            print("Error! file:%s, exception:%s" % (f, str(e)))


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) < 3:
        help_msg()
    if len(sys.argv) > 4:
        help_msg()
    origin = util.trim_quotation(sys.argv[1])
    text = util.trim_quotation(sys.argv[2])
    file_list = util.recursive_list_dir('.')
    if len(sys.argv) == 3:
        replace_all(file_list, origin, text)
    else:
        suffix = util.trim_quotation(sys.argv[3])
        replace_suffix(file_list, suffix, origin, text)
