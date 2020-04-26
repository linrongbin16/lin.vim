#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" git fetch and catch up all commits in current branch """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. git fetch and pull all commits in current branch")
    print("    2. git fetch and merge all commits from other [branch]")
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [branch]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_git_repository()
    util.check_help_message(help_msg)

    # remote repository count
    remote_count = util.get_git_remote_repository_count()
    # error: remote repository not exist
    if remote_count == 0:
        print("[boostscript] remote repository not exist!")
        exit(1)

    branch = util.get_git_current_branch()
    remote_repo = util.get_git_remote_repository()

    # case 1
    if len(sys.argv) == 1:
        os.chdir(util.get_git_root())
        print("[boostscript] git pull from \'%s/%s\'" % (remote_repo, branch))
        os.system("git fetch")
        os.system("git pull %s %s" % (remote_repo, branch))
    # case 2
    else:
        remote_branch = util.get_sys_args_one_line()
        util.check_user_confirm(
            "[boostscript] git merge \'%s/%s\'(remote) to \'%s\'(local), yes? "
            % (remote_repo, remote_branch, branch))
        os.chdir(util.get_git_root())
        os.system("git fetch")
        os.system("git pull %s %s" % (remote_repo, remote_branch))
