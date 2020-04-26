#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" unpack *.tar.gz *.zip *.tgz *.rar *.tax *.jar files """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    extract compressed [file]")
    print("Usage:")
    print("    %s [file]" % util.get_command_name())
    print("Try again")
    exit(1)


def unpackTarGz(target):
    os.system('tar zxvf "%s"' % (target))


def unpackTar(target):
    os.system('tar xvf "%s"' % (target))


def unpackTarBz2(target):
    os.system('tar xvf "%s"' % (target))


def unpackZip(target):
    os.system('unzip "%s"' % (target))


def unpackJar(target):
    os.system('jar xf "%s"' % (target))


UnpackMapping = {
    'tar.gz': unpackTarGz,
    'tgz': unpackTarGz,
    'tar': unpackTar,
    'tar.bz2': unpackTarBz2,
    'zip': unpackZip,
    'jar': unpackJar,
}

if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) != 2:
        help_msg()
    target = util.get_sys_args_one_line()
    if target == "." or target == "..":
        help_msg()
    foldname = target[:target.index(".")]
    util.backup_file(foldname)
    ts = util.get_file_name_all_suffix(target)
    if ts not in UnpackMapping.keys():
        help_msg()
    unpacker = UnpackMapping[ts]
    unpacker(target)
    print("[lin-boost] extract '%s' to '%s'" % (target, foldname))
