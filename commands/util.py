#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018- <linrongbin16@gmail.com>

import sys
import os
import threading
import platform


def command_home():
    if platform.system() == 'Windows':
        return 'C:\\' + os.path.expanduser('~') + '\\.vim\\commands'
    else:
        return os.path.expanduser('~') + '/.vim/commands/'


def ag_ignore():
    if platform.system() == 'Windows':
        return 'C:\\' + os.path.expanduser('~') + '\\.vim\\commands\\ag.ignore'
    else:
        return os.path.expanduser('~') + '/.vim/commands/ag.ignore'


def command_name():
    name = sys.argv[0]
    name = name[:-3]
    left_slash = name.rfind('/')
    right_slash = name.rfind('\\')
    if left_slash >= 0:
        name = name[left_slash + 1:]
    if right_slash >= 0:
        name = name[right_slash + 1:]
    return name


def help_msg(msg_list):
    assert isinstance(msg_list, list)
    for i in msg_list:
        print(i)
    print("")
    exit(1)


def run(*cmd):
    exe = ''
    for i in cmd:
        exe = exe + ' ' + i
    tmp_out = 'lin-vim.tmp_out.pid-%s.tid-%s' % (str(os.getpid()), str(threading.current_thread().ident))
    exe = '%s >%s' % (exe, tmp_out)
    os.system(exe)
    fp_out = open(tmp_out, 'r')
    result_out = fp_out.readlines()
    fp_out.close()
    os.system('rm %s' % (tmp_out))
    return result_out


def merge_args():
    result = ''
    args_len = len(sys.argv)
    for i in xrange(args_len):
        if i == 0:
            continue
        result = result + ' ' + sys.argv[i]
    return result.strip()


def check_help(*msg_list):
    if len(sys.argv) < 2:
        return
    if sys.argv[1] == "--help" or sys.argv[1] == "-h":
        help_msg(msg_list)


def repository_root():
    save_dir = os.getcwd()
    current_dir = os.getcwd()
    last_dir = ''
    os.chdir(current_dir)
    while '.git' not in os.listdir(current_dir) and last_dir != current_dir:
        last_dir = current_dir
        os.chdir('..')
        current_dir = os.getcwd()
    os.chdir(save_dir)
    if '.git' in os.listdir(current_dir):
        return current_dir
    else:
        return None


def user_confirm():
    yes = raw_input("yes? ")
    if yes.lower() != "yes" and yes.lower() != "y":
        print("error: user not confirm")
        exit(1)


def check_repository():
    if repository_root() is None:
        print("error: not a git repository")
        exit(1)


def repository_branch():
    lines = run('git', 'status')
    return lines[0].split(' ')[2].strip()