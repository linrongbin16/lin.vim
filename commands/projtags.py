#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util


msg_list = [
        "Brief:",
        "    1. generate all language tags for project, need 'ctags'"
        "    2. generate specified [language] tags for project, need 'ctags'"
        "Usage:",
        "    1. %s"
        "    2. %s [c/cxx/cpp/cc/h/hpp/hh]"
        "    3. %s [python]"
        "    4. %s [php]"
        "    5. %s [perl]"
        "    6. %s [java]"
        "    7. %s [js]"
        "Try again"]

util.check_help(msg_list)


def make_cpp():
    os.system('ctags --languages=c++ --langmap=c++:+.in.x.inl.c.h --c++-kinds=+px --fields=+iaKSz --extra=+qf -R &')


def make_python():
    os.system('ctags --languages=python --langmap=python:+.py3.python.python3 --fields=+iaS --extra=+q -R &')


def make_php():
    os.system('ctags --languages=php --langmap=php:+.php3.php4.php5.php6.php7 --fields=+iaS --extra=+q -R &')


def make_perl():
    os.system('ctags --languages=perl --perl-kinds=+px --fields=+iaS --extra=+q -R &')


def make_java():
    os.system('ctags --languages=java --langmap=java:+.j --java-kinds=+p --fields=+iaS --extra=+q -R &')


def make_javascript():
    os.system('ctags --languages=javascript --langmap=javascript:+.javascript.html.htm --javascript-kinds=+px --fields=+iaS --extra=+q -R &')


def make_common():
    os.system('ctags -R &')


def make_ctags(curdir, language):
    maker_mapper = {
            'c': make_cpp,
            'cc': make_cpp,
            'cpp': make_cpp,
            'cxx': make_cpp,
            'h': make_cpp,
            'hpp': make_cpp,
            'hh': make_cpp,
            'hxx': make_cpp,
            'hxx': make_cpp,
            'py': make_python,
            'python': make_python,
            'php': make_php,
            'perl': make_perl,
            'pl': make_perl,
            'java': make_java,
            'js': make_javascript,
            'javascript': make_javascript,
            'any': make_common
            }
    os.chdir(curdir)
    maker = maker_mapper[language]
    maker()


target = 'any'
if len(sys.argv) > 1:
    target = util.merge_args()

print("[lin-vim] generate tags for %s language at %s" % (target, os.getcwd()))
make_ctags(os.getcwd(), target)
