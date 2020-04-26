#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" git create/switch to new/existed branch """

import sys
import os
import re
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print(
        "    git move to [branch] by creating new if not exist, or switching to it if existed"
    )
    print("Usage:")
    print("    %s [branch]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    util.check_git_repository()
    if len(sys.argv) <= 1:
        help_msg()

    branch = util.get_sys_args_one_line()
    git_branches, errstr = util.run("git", "branch")
    local_branches = list()
    for b in git_branches:
        if b.strip().startswith('* '):
            local_branches.append(b.strip()[2:])
        else:
            local_branches.append(b.strip())
    if branch not in local_branches:
        os.system("git checkout -b %s" % (branch))
    else:
        os.system("git checkout %s" % (branch))
