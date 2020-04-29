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
    print("    1. config proxy for git")
    print("    2. enable ss-proxy")
    print("    3. disable ss-proxy")
    print("Usage:")
    print("    1. %s [proxy]" % util.get_command_name())
    print("    2. %s cat" % util.get_command_name())
    print("    3. %s y/yes/e/enable" % util.get_command_name())
    print("    4. %s n/no/d/disable" % util.get_command_name())
    print("Try again")
    exit(1)


def enable_proxy():
    px = util.read_file(db)
    if px is None:
        print(
            '[lin-boost] git proxy not configured yet, please use \'gitproxy [proxy]\' first'
        )
        exit(0)
    httpcmd = 'git config --global http.proxy %s' % px
    httpscmd = 'git config --global https.proxy %s' % px
    os.system(httpcmd)
    os.system(httpscmd)


def disable_proxy():
    os.system('git config --global --unset https.proxy')
    os.system('git config --global --unset http.proxy')
    if util.get_git_root() is not None:
        os.system('git config --unset https.proxy')
        os.system('git config --unset http.proxy')


if __name__ == '__main__':
    db = util.get_command_home() + '/gitproxy.db'
    util.check_help_message(help_msg)
    if len(sys.argv) <= 1:
        help_msg()
        exit(0)
    proxy = util.get_sys_args_one_line()
    if proxy.lower() in ['y', 'yes', 'e', 'enable']:
        enable_proxy()
    elif proxy.lower() in ['n', 'no', 'd', 'disable']:
        disable_proxy()
    elif proxy.lower() == 'cat':
        print('[lin-boost] %s' % util.read_file(db))
    else:
        util.write_file(db, proxy)
