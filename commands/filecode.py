#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" translate file encoding """

import sys
import os
from chardet.universaldetector import UniversalDetector
from chardet import detect
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. translate [file] from detected encoding to UTF-8 encoding")
    print(
        "    2. translate [file] from detected encoding to target [encoding]")
    print("Usage:")
    print("    1. %s [file]" % util.get_command_name())
    print("    2. %s [file] [encoding]" % util.get_command_name())
    print("Try again")
    exit(1)


def detect_encoding(file_name):
    with open(file_name, 'rb') as f:
        rawdata = f.read()
    result = detect(rawdata)['encoding']
    return result


def convert_encoding(src_file, detect_encoding, target_encoding):
    dest_file = "%s.%s" % (src_file, target_encoding)
    util.backup_file(dest_file)
    try:
        with open(src_file, 'r', encoding=detect_encoding) as s, open(
                dest_file, 'w', encoding=target_encoding) as d:
            text = s.read()
            d.write(text)
    except UnicodeDecodeError as de:
        print('[boostscript] unicode decode exception %s' % (de))
    except UnicodeEncodeError as ee:
        print('[boostscript] unicode encode exception %s' % (ee))


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        help_msg()
    file_name = sys.argv[1]
    detect_encoding = detect_encoding(file_name)
    target_encoding = 'UTF-8'
    if len(sys.argv) == 3:
        target_encoding = sys.argv[2].strip()
    if target_encoding == detect_encoding:
        print('[boostscript] origin and target encoding are the same \"%s\"' %
              (target_encoding))
        exit(1)
    convert_encoding(file_name, detect_encoding, target_encoding)
