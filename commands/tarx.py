#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util
import pathlib


def backup(filename):
    if not os.path.exists(filename):
        return
    if os.path.exists('%s.old' % (filename)):
        os.system('rm -rf "%s.old"' % (filename))
    os.system('mv "%s" "%s.old"' % (filename, filename))


msg_list = [
        "Brief:",
        "    extract compressed [file] such as: *.rar, *.zip, *.tar.gz, *.tax, *.jar etc",
        "Usage:",
        "    %s [file]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
if len(sys.argv) <= 1:
    util.help_msg(msg_list)

target = pathlib.Path(util.merge_args())
basename = target.stem
extname = target.suffix
if target.name.count('.') > 1:
    extname = ''.join(target.suffixes)
    basename = target.name[:len(extname)]
print('target: %s, basename: %s, extname: %s' % (target, basename, extname))

backup(basename)

if extname == '.zip':
    os.system('unzip "%s" -d "%s"' % (target.name, basename))
elif extname == '.gz' or extname == '.tar.gz' or extname == '.tar':
    os.system('tar -zxvf "%s"' % (target.name))
elif extname == '.rar':
    os.system('mkdir "%s"' % (basename))
    os.system('mv "%s" "%s"' % (target.name, basename))
    os.system('cd "%s"' % (basename))
    os.system('unrar x "%s"' % (target.name))
    os.system('mv "%s" ..' % (target.name))
    os.system('cd ..')
elif extname == ".jar":
    os.system('mkdir "%s"' % (basename))
    os.system('mv "%s" "%s"' % (target.name, basename))
    os.system('cd "%s"' % (basename))
    os.system('jar xf "%s"' % (target.name))
    os.system('mv "%s" ..' % (target.name))
    os.system('cd ..')
else:
    os.system('tar -zxvf "%s"' % (target.name))
