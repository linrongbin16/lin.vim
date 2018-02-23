#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util


msg_list = [
        "Brief:",
        "    git commit with [comment]",
        "    1. update .gitignore for All",
        "    2. update .gitignore for C and CXX",
        "    3. update .gitignore for Java",
        "    4. update .gitignore for PHP",
        "    5. update .gitignore for JavaScript",
        "    6. update .gitignore for Golang",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s cxx" % util.command_name(),
        "    3. %s java" % util.command_name(),
        "    4. %s php" % util.command_name(),
        "    5. %s js" % util.command_name(),
        "    6. %s go" % util.command_name(),
        "Try again"]


def ignore_for_common(fp):
    ignore_list = [
            '#',
            '# [lin-vim] gomit',
            '#',
            '.idea',
            '.svn',
            '.hg',
            'tags',
            "cscope.out",
            "cscope.in.out",
            "cscope.po.out",
            "cscope.files",
            "ncscope.out",
            ".ycm_extra_conf.py",
            ".vscode",
            ".vscode/*",
            "*.vsproj",
            "*.vsproj/*",
            ".DS_Store",
            "*/.DS_Store",
            "*.xcuserdata",
            "*.log",
            "*.iml"
            ]
    for i in ignore_list:
        fp.write(i + '\n')


def ignore_for_cxx(fp):
    ignore_list = [
            "cmake-build-debug",
            "CMakeCache.txt",
            "CMakeFiles",
            "cmake_install.cmake",
            "install_manifest.txt",
            "*.slo",
            "*.lo",
            "*.o",
            "*.obj",
            "*.pro.user",
            "*.so",
            "*.so.*",
            "*.dylib",
            "*.dylib.*",
            "*.dll",
            "*.dll.*",
            "*.swp",
            "*.lai",
            "*.la",
            "*.a",
            "*.a.*",
            "*.lib",
            "*.lib.*",
            "*.rdb",
            "*.exe",
            "*.out",
            "*.app"
            ]
    for i in ignore_list:
        fp.write(i + '\n')


def ignore_for_java(fp):
    ignore_list = [
            ".gradle",
            ".gradle/*",
            "gradle",
            "gradle/*",
            ".m2",
            ".m2/*",
            "MANIFEST.MF",
            "Manifest.mf",
            "manifest.mf",
            "*.jar",
            "*.class"
            ]
    for i in ignore_list:
        fp.write(i + '\n')


def ignore_for_python(fp):
    ignore_list = [
            "__pycache__",
            "*.pyc"
            ]
    for i in ignore_list:
        fp.write(i + '\n')


util.check_help(msg_list)
util.check_git()

save_dir = os.getcwd()

os.chdir(util.git_root())
fp = None
if os.path.exists('.gitignore'):
    fp = open('.gitignore', 'a')
else:
    fp = open('.gitignore', 'w')

if len(sys.argv) == 1:
    ignore_for_common(fp)
else:
    lang = util.merge_args()
    if lang == 'cxx' or lang == 'c++' or lang == 'c' or lang == 'cpp' or lang == 'cc':
        ignore_for_cxx(fp)
    elif lang == 'java':
        ignore_for_java(fp)
    elif lang == 'py' or lang == 'python':
        ignore_for_python(fp)
    else:
        print('[lin-vim] Sorry we don\'t support %s' % (lang))
