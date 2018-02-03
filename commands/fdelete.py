#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util


def delete_suffix(directory, target):
    os.chdir(directory)
    for i in os.listdir('.'):
        if not os.path.isdir(i):
            delete_suffix(i, target)
        elif os.path.isfile(i):
            if i.find('.') < 0:
                continue
            dot_pos = i.find('.')
            suffix = i[dot_pos:]
            prefix = i[:dot_pos]
            if len(suffix) > 0 and len(prefix) > 0 and suffix == target:
                print('remove %s' % os.path.abspath(i))
                os.system('rm %s' % i)
    os.chdir('..')


def delete_no_suffix(directory):
    os.chdir(directory)
    for i in os.listdir('.'):
        if not os.path.isdir(i):
            delete_no_suffix(i)
        elif os.path.isfile(i):
            if i.find('.') >= 0:
                continue
            print('remove %s' % os.path.abspath(i))
            os.system('rm %s' % i)
    os.chdir('..')


msg_list = [
        "Brief:",
        "    1. delete file that suffix is [suffix]",
        "    2. delete file that has no suffix",
        "Usage:",
        "    1. %s [suffix]" % util.command_name(),
        "    2. %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)

if len(sys.argv) == 1:
    delete_no_suffix('.')
else:
    target_suffix = sys.argv[1]
    delete_suffix('.', target_suffix)
