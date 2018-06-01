#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util


msg_list = [
        "Brief:",
        "    create cscope.out for current folder, based on 'cscope'",
        "Usage:",
        "    %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)


def list_directory(fp, folder):
    os.chdir(folder)
    for i in os.listdir('.'):
        if os.path.isfile(i):
            fp.write('%s\n' % (os.path.abspath(i)))
        elif os.path.isdir(i):
            list_directory(fp, i)
    os.chdir('..')


def make_cscope_files(folder):
    os.chdir(folder)
    if os.path.exists(cscope_files):
        os.system('rm %s' % (cscope_files))
    fp = open(cscope_files, 'w')
    list_directory(fp, '.')


print("[lin-vim] generate cscope.out at %s" % (os.getcwd()))
cscope_files = "%s/cscope.files" % (os.getcwd())
if util.is_windows():
    cscope_files = "%s\\cscope.files" % (os.getcwd())
save_dir = os.getcwd()
make_cscope_files('.')
os.chdir(save_dir)
os.system('cscope -Rbq -i %s &' % (cscope_files))
