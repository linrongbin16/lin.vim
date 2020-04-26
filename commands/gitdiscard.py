#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" git discard all changes """

import sys
import os
import re
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print("    1. git discard all changes")
    print("    2. git discard the specified [filename/directory]")
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [filename/directory]" % util.get_command_name())
    print("Try again")
    exit(1)


def discard_all():
    branch = util.get_git_current_branch()
    util.check_user_confirm(
        "[boostscript] git discard all changes on \'%s\', yes? " % (branch))

    save_dir = os.getcwd()
    os.chdir(util.get_git_root())
    modifies = util.get_git_modified_files()
    untracts = util.get_git_untract_files()
    discard_file_impl(modifies, modifies, untracts)
    discard_file_impl(untracts, modifies, untracts)
    if os.path.exists(save_dir):
        os.chdir(save_dir)


def discard_file_impl(file_list, modifies, untracts):
    for i in file_list:
        if i in modifies:
            print('[boostscript] discard: %s' % (i + ' '))
            os.system('git checkout %s' % (i + ' '))
        elif i in untracts:
            print('[boostscript] remove: %s' % (i + ' '))
            os.system('rm %s' % (i + ' '))


def discard_file(file_name):
    branch = util.get_git_current_branch()
    util.check_user_confirm(
        "[boostscript] git discard file \'%s\' on \'%s\', yes? " %
        (file_name, branch))

    save_dir = os.getcwd()
    os.chdir(util.get_git_root())
    modifies = util.get_git_modified_files()
    untracts = util.get_git_untract_files()
    discard_file_impl([file_name], modifies, untracts)
    if os.path.exists(save_dir):
        os.chdir(save_dir)


def discard_dir(dir_name):
    branch = util.get_git_current_branch()
    util.check_user_confirm(
        "[boostscript] git discard folder \'%s\' on \'%s\', yes? " %
        (dir_name, branch))

    save_dir = os.getcwd()
    os.chdir(util.get_git_root())

    file_list = util.recursive_list_dir_relative(dir_name)
    modifies = util.get_git_modified_files()
    untracts = util.get_git_untract_files()
    discard_file_impl(file_list, modifies, untracts)
    if os.path.exists(save_dir):
        os.chdir(save_dir)


if __name__ == '__main__':
    util.check_help_message(help_msg)
    util.check_git_repository()
    if len(sys.argv) > 2:
        help_msg()
    if len(sys.argv) <= 1:
        discard_all()
    else:
        target = util.get_sys_args_one_line()
        if os.path.isfile(target):
            discard_file(target)
        else:
            discard_dir(target)
