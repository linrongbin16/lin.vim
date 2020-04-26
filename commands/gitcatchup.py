#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" git catchup(rebase) the newest changes from master """

import sys
import os
import re
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. git catchup(rebase) newest changes from master")
    print("    2. git catchup(rebase) newest changes from [branch]")
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [branch]" % util.get_command_name())
    print("Try again")
    exit(1)


def catchup(branch):
    util.check_user_confirm("[boostscript] git catchup(rebase) to '%s', yes? " % (branch))
    os.system("git rebase %s" % branch)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    util.check_git_repository()
    branch = 'master'
    if len(sys.argv) >= 2:
        branch = util.get_sys_args_one_line()
    catchup(branch)
