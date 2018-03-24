#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018- <linrongbin16@gmail.com>

import sys
import os
import threading
import platform
import datetime
import time
import re
import string


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
    branches = run('git', 'remote')
    remote_branches = set()
    for br in branches:
        remote_branches.add(br.strip())
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


def trim_quotation(s):
    s = s.strip()
    if s[0] == '\"' or s[0] == '\'':
        s = s[1:]
    if s[-1] == '\"' or s[-1] == '\'':
        s = s[:-1]
    return s

def is_hidden_name(filename):
    filename = filename.strip()
    if len(filename) > 1 and filename[0] == '.' and filename[1] != '.':
        return True
    return False


def get_file_name_suffix(name):
    if len(name) <= 0:
        return ''
    if name[0] == '.':
        return ''
    dot_pos = name.find('.')
    if dot_pos > 0:
        return name[dot_pos:]
    return ''


def get_file_base_name(name):
    if len(name) <= 0:
        return ''
    if name[0] == '.':
        return ''
    dot_pos = name.find('.')
    if dot_pos > 0:
        return name[:dot_pos]
    return name


def is_valid_ipv4(ipaddr):
    try:
        pattern = re.compile(r'^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$')
        if not pattern.match(ipaddr):
            return False
        ip_splits = ipaddr.split('.')
        if len(ip_splits) != 4:
            return False
        for each_ip in ip_splits:
            tmp = int(each_ip)
            if tmp < 0 or tmp > 255:
                return False
        return True
    except Exception as e:
        return False


def is_valid_ipv6(ipaddr):
    try:
        pattern = re.compile(r'^[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}$')
        if not pattern.match(ipaddr):
            return False
        ip_splits = ipaddr.split(':')
        if len(ip_splits) != 8:
            return False
        for each_ip in ip_splits:
            print('each_ip: %s' % (each_ip))
            if not all(c in string.hexdigits for c in each_ip):
                print('not hex string')
                return False
        return True
    except Exception as e:
        return False


def ip_string_to_uint32(ipstr):
    ip_split = ipstr.split('.')
    p1 = int(ip_split[0]) * 16777216
    p2 = int(ip_split[1]) * 65536
    p3 = int(ip_split[2]) * 256
    p4 = int(ip_split[3])
    return p1 + p2 + p3 + p4


def ip_uint32_to_string(ipint):
    p1 = int(ipint / 16777216) % 256
    p2 = int(ipint / 65536) % 256
    p3 = int(ipint / 256) % 256
    p4 = int(ipint) % 256
    return '%d.%d.%d.%d' % (p1, p2, p3, p4)


