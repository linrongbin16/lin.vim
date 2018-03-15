#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import re
sys.path.append('.')
import util


def replace_file(filename, regex, text):
    sed_command = 'sed -i -- \'s/%s/%s/g\' %s' % (regex, text, filename)
    # print('sed command: %s' % (sed_command))
    os.system(sed_command)


def replace_suffix(directory, suffix, regex, text):
    os.chdir(directory)
    for i in os.listdir('.'):
        if util.is_hidden_name(i):
            continue
        if os.path.isdir(i):
            replace_suffix(i, suffix, regex, text)
        elif os.path.isfile(i):
            if util.get_file_name_suffix(i) == suffix:
                replace_file(i, regex, text)
    os.chdir('..')


def replace_all(directory, regex, text):
    os.chdir(directory)
    for i in os.listdir('.'):
        if util.is_hidden_name(i):
            continue
        if os.path.isdir(i):
            replace_all(i, regex, text)
        elif os.path.isfile(i):
            replace_file(i, regex, text)
    os.chdir('..')


pattern = re.compile(r'^$')
msg_list = [
        "Brief:",
        "    1. replace old [\"regex\"] with new [\"text\"] of all files in current folder",
        "    2. replace old [\"regex\"] with new [\"text\"] of the [suffix] files in current folder",
        "Usage:",
        "    1. %s [\"regex\"] [\"text\"]" % util.command_name(),
        "    2. %s [\"regex\"] [\"text\"] [suffix]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
if len(sys.argv) < 3:
    util.help_msg(msg_list)

regex = util.trim_quotation(sys.argv[1])
text = util.trim_quotation(sys.argv[2])

if len(sys.argv) < 4:
    replace_all('.', regex, text)
else:
    target_suffix = '.%s' % sys.argv[3]
    replace_suffix('.', target_suffix, regex, text)
