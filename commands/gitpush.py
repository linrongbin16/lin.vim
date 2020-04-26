#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" git push all changes to current branch """

import sys
import os
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. git push local commits to remote repository")
    print(
        "    2. git add and push all changes to remote repository with [comment]"
    )
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [comment]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_git_repository()
    util.check_help_message(help_msg)

    # remote repository count
    remote_count = util.get_git_remote_repository_count()
    # error: remote repository not exist
    if remote_count == 0:
        print("[lin-boost] remote repository not exist!")
        exit(1)

    branch = util.get_git_current_branch()
    remote_repo = util.get_git_remote_repository()

    # case 1
    if len(sys.argv) == 1:
        util.check_user_confirm("[lin-boost] git push to \'%s/%s\', yes? " %
                                (remote_repo, branch))
        os.chdir(util.get_git_root())
        os.system("git push %s %s" % (remote_repo, branch))
    # case 2
    else:
        comment = util.get_sys_args_one_line()
        util.check_user_confirm(
            "[lin-boost] git push to \'%s/%s\' with \'%s\', yes? " %
            (remote_repo, branch, comment))
        os.chdir(util.get_git_root())
        os.system("git add -A .")
        os.system("git commit -m \"%s\"" % (comment))
        os.system("git push %s %s" % (remote_repo, branch))
