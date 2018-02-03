#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import re
sys.path.append('.')
import util


pattern = re.compile(r'^$')


def line_file(filename):
    count = 0
    fp = open(filename, 'r')
    for line in fp.xreadlines():
        if not pattern.match(line):
            count += 1
    fp.close()
    return count


def line_suffix(count, directory, target):
    os.chdir(directory)
    for i in os.listdir('.'):
        if not os.path.isdir(i):
            count = line_suffix(count, i, target)
        elif os.path.isfile(i):
            if i.find('.') < 0:
                continue
            dot_pos = i.find('.')
            suffix = i[dot_pos:]
            prefix = i[:dot_pos]
            if len(suffix) > 0 and len(prefix) > 0 and suffix == target:
                count += line_file(i)
    os.chdir('..')
    return count


def line_all(count, directory):
    os.chdir(directory)
    for i in os.listdir('.'):
        if not os.path.isdir(i):
            count = line_all(count, i)
        elif os.path.isfile(i):
            if i.find('.') >= 0:
                continue
            count += line_file(i)
    os.chdir('..')
    return count


msg_list = [
        "Brief:",
        "    1. count lines of all text files in current directory",
        "    2. count lines of certain [suffix] files in current directory",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [suffix]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)

if len(sys.argv) == 1:
    print(line_all(0, '.'))
else:
    target_suffix = sys.argv[1]
    print(line_suffix(0, '.', target_suffix))
