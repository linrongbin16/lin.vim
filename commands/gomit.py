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
            '.idea/*',
            '.iml',
            '.svn',
            '.svn/*',
            '.hg',
            '.hg/*',
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
            "*.log"
            ]
    for i in ignore_list:
        fp.write(i + os.linesep)


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
    "*.obj" >> $ignorefile
    "*.pro.user" >> $ignorefile
    "*.so" >> $ignorefile
    "*.so.*" >> $ignorefile
    "*.dylib" >> $ignorefile
    "*.dylib.*" >> $ignorefile
    "*.dll" >> $ignorefile
    "*.dll.*" >> $ignorefile
    "*.swp" >> $ignorefile
    "*.lai" >> $ignorefile
    "*.la" >> $ignorefile
    "*.a" >> $ignorefile
    "*.a.*" >> $ignorefile
    "*.lib" >> $ignorefile
    "*.lib.*" >> $ignorefile
    "*.rdb" >> $ignorefile
    "*.exe" >> $ignorefile
    "*.out" >> $ignorefile
    "*.app" >> $ignorefile


def ignore_for_java():
    ignorefile=$1
    echo ".gradle" >> $ignorefile
    echo ".gradle/*" >> $ignorefile
    echo ".m2" >> $ignorefile
    echo ".m2/*" >> $ignorefile
    echo "MANIFEST.MF" >> $ignorefile
    echo "Manifest.mf" >> $ignorefile
    echo "manifest.mf" >> $ignorefile
    echo "*.jar" >> .gitignore
    echo "*.class" >> .gitignore


def ignore_for_python():
    ignorefile=$1
    echo "__pycache__" >> .gitignore
    echo "*.pyc" >> .gitignore


util.check_help(msg_list)
util.check_repository()

save_dir = os.getcwd()

os.chdir(util.repository_root())
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
