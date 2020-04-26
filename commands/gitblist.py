#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" git show local/remote branches """

import sys
import os
import re
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. git show all branches")
    print("    2. git show only local branches")
    print("    3. git show only remote branches")
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s l/local" % util.get_command_name())
    print("    3. %s r/remote" % util.get_command_name())
    print("Try again")
    exit(1)


def local_branch():
    outstr, errstr = util.run("git", "branch")
    print("[boostscript] local branches")
    for o in outstr:
        print("  %s" % (o.strip()))


def remote_branch():
    outstr, errstr = util.run("git", "branch", "-r")
    print("[boostscript] remote branches")
    for o in outstr:
        print("  %s" % (o.strip()))

def all_branch():
    outstr, errstr = util.run("git", "branch", "-a")
    print("[boostscript] all branches")
    for o in outstr:
        print("  %s" % (o.strip()))


if __name__ == '__main__':
    util.check_help_message(help_msg)
    util.check_git_repository()
    if len(sys.argv) <= 1:
        all_branch()
    else:
        mode = util.get_sys_args_one_line()
        if mode.upper().startswith('L'):
            local_branch()
        elif mode.upper().startswith('R'):
            remote_branch()
        else:
            util.check_help_message(help_msg)
