#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util
import pathlib

msg_list = [
        "Brief:",
        "    1. compress current directory",
        "    2. compress [file/directory]",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [file/directory]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
target = os.getcwd()
if len(sys.argv) > 1:
    target = util.merge_args()

gzfile = pathlib.Path('%s.tar.gz' % os.path.abspath(target)).name
print('gzfile: %s, target: %s' % (gzfile, target))
if os.path.isfile(gzfile):
    print('mv "%s" "%s.old"' % (gzfile, gzfile))
    os.system('mv "%s" "%s.old"' % (gzfile, gzfile))
print('tar -zcvf "%s" "%s"' % (gzfile, target))
os.system('tar -zcvf "%s" "%s"' % (gzfile, target))
