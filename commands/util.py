#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018- <linrongbin16@gmail.com>

import sys
import os
import threading
import platform


def is_windows():
    return platform.system() == 'Windows'


def command_home():
    if is_windows():
        return 'C:\\' + os.path.expanduser('~') + '\\.vim\\commands'
    else:
        return os.path.expanduser('~') + '/.vim/commands/'


def ag_ignore():
    if is_windows():
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
    if is_windows():
        exe = '%s >%s 2>nul' % (exe, tmp_out)
    else:
        exe = '%s >%s 2>/dev/null' % (exe, tmp_out)
    os.system(exe)
    fp_out = open(tmp_out, 'r')
    result_out = fp_out.readlines()
    fp_out.close()
    os.system('rm %s' % (tmp_out))
    return result_out


def merge_args(start=1):
    result = ''
    args_len = len(sys.argv)
    for i in xrange(args_len):
        if i < start:
            continue
        result = result + ' ' + sys.argv[i]
    return result.strip()


def check_help(msg_list):
    if len(sys.argv) < 2:
        return
    if sys.argv[1] == "--help" or sys.argv[1] == "-h":
        help_msg(msg_list)


def git_root():
    root = run('git', 'rev-parse', '--show-toplevel')
    if len(root) > 0:
        root = root[0]
        return root.strip()
    else:
        return None


def user_confirm():
    yes = raw_input("yes? ")
    if yes.lower() != "yes" and yes.lower() != "y":
        print("error: user not confirm")
        exit(1)


def check_git():
    if git_root() is None:
        print("error: not a git git")
        exit(1)


def git_branch():
    lines = run('git', 'status')
    return lines[0].split(' ')[2].strip()


def git_last_log(n):
    if n <= 0:
        return None
    rawlines = run('git', 'log', '-n', '%d' % n)
    i = 1
    for eachline in rawlines:
        if eachline[0:6] == 'commit':
            if i == n:
                return eachline.split(' ')[1]
            i += 1
    return None


def git_list_modifies():
    return run('git', 'ls-files', '-m')


def git_list_untracts():
    return run('git', 'ls-files', '--others', '--exclude-standard')
