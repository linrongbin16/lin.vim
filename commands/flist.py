#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import re
sys.path.append('.')
import util

save_dir = os.getcwd()

def list_suffix(directory, target):
    os.chdir(directory)
    for i in os.listdir('.'):
        if util.is_hidden_name(i):
            continue
        if os.path.isdir(i):
            list_suffix(i, target)
        elif os.path.isfile(i):
            # print('i: %s, target: %s, get_file_name_suffix: %s' % (i, target, util.get_file_name_suffix(i)))
            if util.get_file_name_suffix(i) == target:
                print('./%s' % (os.path.relpath(i, save_dir)))
    os.chdir('..')


def list_all(directory):
    os.chdir(directory)
    for i in os.listdir('.'):
        if util.is_hidden_name(i):
            continue
        if os.path.isdir(i):
            list_all(i)
        elif os.path.isfile(i):
            print('./%s' % (os.path.relpath(i, save_dir)))
    os.chdir('..')


pattern = re.compile(r'^$')

msg_list = [
        "Brief:",
        "    1. list all files in current directory",
        "    2. list all certain [suffix] files in current directory",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [suffix]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)

if len(sys.argv) == 1:
    list_all('.')
else:
    target_suffix = '.%s' % sys.argv[1]
    list_suffix('.', target_suffix)
