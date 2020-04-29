#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" lin-boost help document """

import sys
import os
import time
import datetime
sys.path.append('.')
import util


def commands_help():
    save_dir = os.getcwd()
    os.chdir(util.get_command_home())
    sys.path.append('.')
    cmd = list()
    command_list = [x for x in os.listdir('.') if x.endswith('.py')]
    command_list.sort()
    space_cnt = max(
        [len(x)
         for x in command_list if util.get_file_name_suffix(x) == 'py']) - 2
    for i in command_list:
        if util.get_file_name_suffix(i) != 'py':
            continue
        command_name = util.get_file_name_base(i)
        command_module = __import__(command_name)
        command_doc = command_module.__doc__
        if command_doc is None:
            continue
        if command_name == util.get_command_name():
            continue
        spaces = ' ' * (space_cnt - len(command_name))
        cmd.append("    %s%s- %s" % (command_name, spaces, command_doc))
    print("[lin-boost] Usage:")
    for c in cmd:
        print(c)
    print("Use -h/--help for more detail. Enjoy :)")
    if os.path.exists(save_dir):
        os.chdir(save_dir)


def ssh_gen_help():
    print(
        "[lin-boost] SSH Configuration Help: generate ssh token for [your_email@email.com]"
    )
    print(
        "    remove old 'id_rsa' and 'id_rsa.pub' in '~/.ssh' before generation."
    )
    print("    $ ssh-keygen -t rsa -b 4096 -C 'your_email@email.com'")
    print("    $ Generating public/private rsa key pair.")
    print(
        "    $ Enter file in which to save the key (~/.ssh/id_rsa) `type ENTER`"
    )
    print("    $ Enter passphrase (empty for no passphrase) `type ENTER`")
    print("    $ Enter same passphrase again: `type ENTER`")
    print("    $ chmod 700 -R ~/.ssh")
    print("    $ chmod 600 ~/.ssh/authorized_keys")
    print("    $ chmod 600 ~/.ssh/id_rsa")
    print("    $ chmod 644 ~/.ssh/id_rsa.pub")
    print("")


def ssh_login_help():
    print(
        "[lin-boost] SSH Login Help: login ssh server without username & password"
    )
    print(
        "    copy generated '~/.ssh/id_rsa.pub' to ssh server and login ssh server."
    )
    print("    $ cat id_rsa.pub >> ~/.ssh/authorized_keys")
    print("    $ ssh-add ~/.ssh/id_rsa")
    print("")


if __name__ == '__main__':
    ssh_gen_help()
    ssh_login_help()
    commands_help()
