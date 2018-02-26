#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018- <linrongbin16@gmail.com>

import sys
import os
import threading
import platform
import datetime
import time


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


def run_silent(cmd):
    exe = ''
    if is_windows():
        exe = '%s >nul 2>nul' % (cmd)
    else:
        exe = '%s >/dev/null 2>/dev/null' % (cmd)
    os.system(exe)


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
    yes = raw_input("[lin-vim] yes? ")
    if yes.lower() != "yes" and yes.lower() != "y":
        print("error: user not confirm")
        exit(1)


def check_git():
    if git_root() is None:
        print("error: not a git repository")
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


def date_to_second(d):
    assert isinstance(d, datetime.date)
    return time.mktime(d.timetuple())


def datetime_to_second(dt):
    assert isinstance(dt, datetime.datetime)
    return time.mktime(dt.timetuple())


def number_to_string(n):
    if isinstance(n, int) or isinstance(n, long):
        return str(n)
    else:
        n_int = long(n)
        n_int_float = float(n_int)
        if n_int_float == n:
            return str(n_int)
        else:
            return str(n)


def git_remote():
    branches = run('git', 'branch', '-a')
    remote_branches = set()
    for br in branches:
        b = br.strip()
        if b[:7] == 'remotes':
            first_slash_pos = None
            second_slash_pos = None
            first_slash_pos = b.find('/')
            if first_slash_pos >= 0:
                second_slash_pos = b[first_slash_pos + 1:].find('/')
            rb = b[first_slash_pos + 1: first_slash_pos + second_slash_pos + 1]
            remote_branches.add(rb)
    return remote_branches


def is_empty_str(s):
    if s is None:
        return True
    if len(s.strip()) == 0:
        return True
    return False


def git_is_behind():
    status = run('git', 'status')
    for s in status:
        if s.find('Your branch is behind') >= 0:
            return True
    return False


def git_is_ahead():
    status = run('git', 'status')
    for s in status:
        if s.find('Your branch is ahead') >= 0:
            return True
    return False


def git_last_commit(n):
    commits = run('git', 'log', '--pretty=oneline')
    return commits[n].split(' ')[0]
