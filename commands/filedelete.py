#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


def no_ext(workdir):
    os.chdir(workdir)
    for i in os.listdir('.'):
        file_ext = None
        dot_pos = i.find('.')
        if dot_pos > 0:
            file_ext = i[dot_pos + 1:]
        if os.path.isfile(i):
            if file_ext is None or len(file_ext) == 0 or file_ext == i:
                print("remove ")
                os.remove(i)
        if os.path.isdir(i) and i[0:1] != '.':
            no_ext(i)
    os.chdir('..')


def ext(workdir, pattern):
    os.chdir(workdir)
    for i in os.listdir('.'):
        file_ext = None
        dot_pos = i.find('.')
        if dot_pos > 0:
            file_ext = i[dot_pos + 1:]
        if os.path.isfile(i):
            if file_ext == pattern and file_ext != i:
                print("remove ")
                os.remove(i)
        if os.path.isdir(i) and i[0:1] != '.':
            ext(i, pattern)
    os.chdir('..')


if len(sys.argv) <= 1:
    no_ext('.')
elif len(sys.argv) == 2:
    pattern = sys.argv[1].strip()
    ext('.')
else:
    util.helpmsg(
            [
                "1. delete file which extension is [ext]. i.e. 'txt' in 'temp.txt'",
                "2. delete file which has no extention. i.e. '/etc/profile'"],
            [
                "1. %s [ext]" % util.command_name(),
                "2. %s" % util.command_name()])
    exit(1)
