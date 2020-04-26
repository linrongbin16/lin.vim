#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" git revert to last n commits(you don't need `git push --force` to override remote) """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. git revert to last commit")
    print("    2. git revert to last [n] commit, NOTICE: `%s 1` equals `%s`" %
            (util.get_command_name(), util.get_command_name()))
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [n]" % util.get_command_name())
    print("Try again")


if __name__ == '__main__':
    util.check_help_message(help_msg)
    util.check_git_repository()
    branch = util.get_git_current_branch()
    n = 1
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    commit_name = util.get_git_last_commit(n - 1)
    util.check_user_confirm(
            "[boostscript] git revert to last '%d' commits '%s' on '%s', yes? " %
            (n, commit_name, branch))
    save_dir = os.getcwd()
    os.chdir(util.get_git_root())
    os.system("git revert %s" % commit_name)
    if os.path.exists(save_dir):
        os.chdir(save_dir)
