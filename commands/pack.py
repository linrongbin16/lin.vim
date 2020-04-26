#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" compress *.tar.gz """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. compress [file/directory] to *.tar.gz")
    print("    2. compress [file/directory] to *.[type] ")
    print("Usage:")
    print("    1. %s [file/directory]" % util.get_command_name())
    print("    2. %s [file/directory] [type](tar.gz/tgz/tar.bz2/zip) " %
          util.get_command_name())
    print("Try again")
    exit(1)


def compressTargz(target):
    tarname = "%s.tar.gz" % target
    util.backup_file(tarname)
    os.system('tar czvf "%s" "%s"' % (tarname, target))
    print("[lin-boost] compress '%s' to '%s'" % (target, tarname))


def compressTgz(target):
    tarname = "%s.tgz" % target
    util.backup_file(tarname)
    os.system('tar czvf "%s" "%s"' % (tarname, target))
    print("[lin-boost] compress '%s' to '%s'" % (target, tarname))


def compressTarbz2(target):
    tarname = "%s.tar.bz2" % target
    util.backup_file(tarname)
    os.system('tar czvf "%s" "%s"' % (tarname, target))
    print("[lin-boost] compress '%s' to '%s'" % (target, tarname))


def compressZip(target):
    tarname = "%s.zip" % target
    util.backup_file(tarname)
    os.system('zip -r "%s" "%s"' % (tarname, target))
    print("[lin-boost] compress '%s' to '%s'" % (target, tarname))


PackMapping = {
    'tar.gz': compressTargz,
    'tgz': compressTgz,
    'zip': compressZip,
    'tar.bz2': compressTarbz2
}

if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        help_msg()
    target = util.get_file_name(sys.argv[1])
    if target in ('.', '..'):
        help_msg()
    tp = 'tar.gz'
    if len(sys.argv) == 3:
        tp = sys.argv[2]
    if tp not in PackMapping.keys():
        help_msg()
    packer = PackMapping[tp]
    packer(target)
