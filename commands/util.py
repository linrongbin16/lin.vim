#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018- <linrongbin16@gmail.com>

import sys
import os
import threading
import platform
import datetime
import time
import re
import string
import subprocess
import calendar
import scandir

# platform utils


def is_windows():
    return platform.system() == 'Windows'


def is_linux():
    return platform.system() == 'Linux'


def is_ubuntu():
    if platform.system() == 'Linux':
        import distro
        return distro.linux_distribution()[0].find('Ubuntu') >= 0
    return False


def is_debian():
    if platform.system() == 'Linux':
        import distro
        return distro.linux_distribution()[0].find('Debian') >= 0
    return False


def is_manjaro():
    if platform.system() == 'Linux':
        import distro
        return distro.linux_distribution()[0].find('Manjaro') >= 0
    return False


def is_macos():
    return platform.system() == 'Darwin'


def get_platform_name():
    if is_windows():
        return 'windows'
    elif is_macos():
        return 'macos'
    elif is_linux():
        if is_ubuntu():
            return 'ubuntu'
        elif is_manjaro():
            return 'manjaro'
        else:
            return None
    else:
        return None


# path utils


def get_file_name_suffix(name):
    if len(name) <= 0:
        return ''
    if name[0] == '.':
        return ''
    dot_pos = name.rfind('.')
    if dot_pos >= 0:
        return name[dot_pos + 1:]
    return ''


def get_file_name_all_suffix(name):
    if len(name) <= 0:
        return ''
    if name[0] == '.':
        return ''
    dot_pos = name.find('.')
    if dot_pos >= 0:
        return name[dot_pos + 1:]
    return ''


def get_file_name_base(name):
    if len(name) <= 0:
        return ''
    if name[0] == '.':
        return ''
    dot_pos = name.rfind('.')
    if dot_pos >= 0:
        return name[:dot_pos]
    return name


def read_file(name):
    try:
        fp = open(name, 'r')
        data = fp.read()
        fp.close()
        return data
    except Exception:
        return None


def readlines_file(name):
    try:
        fp = open(name, 'r')
        lines = fp.readlines()
        fp.close()
        return lines
    except Exception:
        return list()


def write_file(name, text):
    try:
        fp = open(name, 'w')
        if isinstance(text, list):
            fp.writelines(text)
        else:
            fp.write(text)
        fp.close()
    except Exception:
        pass


def append_file(name, text):
    try:
        fp = open(name, 'a+')
        if isinstance(text, list):
            fp.writelines(text)
        else:
            fp.write(text)
        fp.close()
    except Exception:
        pass


def purge_file(name):
    try:
        fp = open(name, 'w')
        fp.close()
    except Exception:
        pass


def get_command_home():
    if is_windows():
        return os.path.expanduser('~') + '\\.vim\\commands'
    else:
        return os.path.expanduser('~') + '/.vim/commands'


def get_command_name():
    py_name = sys.argv[0]
    left_slash = py_name.rfind('/')
    right_slash = py_name.rfind('\\')
    py_name = py_name[left_slash + 1:] if left_slash >= 0 else py_name
    py_name = py_name[right_slash + 1:] if right_slash >= 0 else py_name
    return py_name


def get_file_name(file_name):
    if file_name[0] == "/":
        file_name = file_name[1:]
    if file_name[0] == "\\":
        file_name = file_name[1:]
    if file_name[-1] == "/":
        file_name = file_name[:-1]
    if file_name[-1] == "\\":
        file_name = file_name[:-1]
    return file_name


def find_file_up_impl(start_path, file_name):
    os.chdir(start_path)
    if os.path.exists(file_name):
        return start_path
    if os.path.abspath(".") == os.path.abspath("/"):
        return None
    for ch in string.ascii_uppercase:
        if os.path.abspath(".") == os.path.abspath("%s:\\" % (ch)):
            return None
    return find_file_up_impl(os.path.abspath(".."), file_name)


def find_file_up(start_path, file_name):
    save_dir = os.path.abspath(".")
    result = find_file_up_impl(os.path.abspath("."), file_name)
    if os.path.exists(save_dir):
        os.chdir(save_dir)
    return result


def backup_file(target):
    if not os.path.exists(target):
        return
    bakname = ".%s.bak" % (target)
    check_user_confirm("[lin-command] backup existed '%s' to '%s', yes? " %
                       (target, bakname))
    if os.path.exists(bakname):
        os.rmdir(bakname)
    os.rename(target, bakname)


def is_hidden_file_impl(file_name):
    files = [x for x in file_name.split('/') if len(x) > 0]
    for f in files:
        if f != '.' and f != '..' and f.startswith('.'):
            return True
    return False


def walk_dir(directory, include_hidden):
    save_dir = os.getcwd()
    os.chdir(directory)
    file_list = list()
    walk = scandir.walk('.')
    for item in walk:
        folder = item[0]
        if include_hidden is not True and is_hidden_file_impl(folder):
            continue
        files = item[2]
        for f in files:
            if include_hidden is not True and f.startswith('.'):
                continue
            file_list.append('%s/%s' % (folder, f))
    if os.path.exists(save_dir):
        os.chdir(save_dir)
    return file_list


# process utils


def run(*cmd):
    try:
        proc = subprocess.Popen(cmd,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        stdout_str = iter(proc.stdout.readline, b"")
        stderr_str = iter(proc.stderr.readline, b"")
    except subprocess.CalledProcessError:
        exit(3)
    outstr = [x.decode() for x in stdout_str if len(x) > 0]
    errstr = [x.decode() for x in stderr_str if len(x) > 0]
    return outstr, errstr


# args utils


def get_sys_args_one_line(start=1):
    args = [sys.argv[i] for i in range(len(sys.argv)) if i >= start]
    return ' '.join(args).strip()


def check_help_message(help_msg_func):
    if len(sys.argv) >= 2:
        if sys.argv[1] in ("--help", "-h", "-help"):
            help_msg_func()


def check_user_confirm(msg):
    yes = input(msg)
    if not yes.lower().startswith('y'):
        print("[boostcript] error: user not confirm")
        exit(3)


# date time utils


def date_to_second(d, local=True):
    assert isinstance(d, datetime.date)
    if local:
        return time.mktime(d.timetuple())
    else:
        utc = time.gmtime(time.mktime(d.timetuple()))
        return time.mktime(utc)


def datetime_to_second(dt, local=True):
    assert isinstance(dt, datetime.datetime)
    if local:
        return time.mktime(dt.timetuple())
    else:
        utc = time.gmtime(time.mktime(dt.timetuple()))
        return time.mktime(utc)


# number string utils


def number_to_string(n):
    if isinstance(n, int):
        return str(n)
    else:
        n_int = int(n)
        if float(n_int) == float(n):
            return str(n_int)
        else:
            return str(n)


def is_empty_str(s):
    return True if (s is None) else (len(s.strip()) == 0)


def trim_quotation(s):
    s = s.strip()
    if s[0] == '\"' or s[0] == '\'':
        s = s[1:]
    if s[-1] == '\"' or s[-1] == '\'':
        s = s[:-1]
    return s


# git utils


def get_git_root():
    root, _ = run('git', 'rev-parse', '--show-toplevel')
    return root[0].strip() if (len(root) > 0) else None


def check_git_repository():
    if get_git_root() is None:
        print("[lin-command] error: not a git repository")
        exit(3)


def get_git_current_branch():
    lines, _ = run('git', 'status')
    return lines[0].split(' ')[2].strip()


def get_git_modified_files():
    result, _ = run('git', 'ls-files', '-m')
    return [modified_file.strip() for modified_file in result]


def get_git_untract_files():
    result, _ = run('git', 'ls-files', '--others', '--exclude-standard')
    return [untract_file.strip() for untract_file in result]


def get_git_remote_repository_count():
    repos, _ = run('git', 'remote')
    return len(repos)


def get_git_remote_repository():
    repos, _ = run('git', 'remote')
    repos = [x.strip() for x in repos]
    if len(repos) <= 0:
        return None
    repos.sort()
    repo_str = ', '.join(
        ['\'%s\'[%d]' % (repos[i], i) for i in range(len(repos))])
    print('[lin-command] detected remote repositories: %s' % (repo_str))
    user_input = input(
        '[lin-command] choose remote repository 0-%d, by default: \'%s\'[0]: '
        % (len(repos), repos[0]))
    if is_empty_str(user_input):
        repo_str = list(repos)[0]
    else:
        try:
            repo_str = repos[int(user_input)]
        except Exception:
            print('[lin-command] error input: %s' % (user_input))
            exit(3)
    return repo_str


def get_git_remote_branch():
    branches, _ = run('git', 'status')
    branches = [x.strip() for x in branches]
    branch = branches[0].split(' ')[2].strip()
    user_input = input('[lin-command] choose branch, by default: \'%s\': ' %
                       (branch))
    return branch if is_empty_str(user_input) else user_input


def check_git_is_behind():
    os.system('git fetch')
    status, _ = run('git', 'status')
    return len([s for s in status if s.find('Your branch is behind') >= 0]) > 0


def check_git_is_ahead():
    os.system('git fetch')
    status, _ = run('git', 'status')
    return len([s for s in status if s.find('Your branch is ahead') >= 0]) > 0


def get_git_last_commit(n):
    commits, _ = run('git', 'log', '--pretty=oneline')
    return commits[n].split(' ')[0]


def git_has_branch(target_br):
    os.system('git fetch')
    branches, _ = run('git', 'branch', '-a')
    return len([b for b in branches if b.find(target_br) >= 0]) > 0


# ip utils

IPV4_PATTERN = re.compile(r'^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$')

IPV6_PATTERN = re.compile(
    r'^[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}:[0-9,a-e,A-E]{1,4}$'
)


def check_valid_ipv4(ipaddr):
    try:
        if not IPV4_PATTERN.match(ipaddr):
            return False
        ip_splits = ipaddr.split('.')
        if len(ip_splits) != 4:
            return False
        for each_ip in ip_splits:
            tmp = int(each_ip)
            if tmp < 0 or tmp > 255:
                return False
        return True
    except Exception:
        return False


def check_valid_ipv6(ipaddr):
    try:
        if not IPV6_PATTERN.match(ipaddr):
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
    except Exception:
        return False


def ipv4_string_to_uint32(ipstr):
    ip_split = ipstr.split('.')
    p1 = int(ip_split[0]) * 16777216
    p2 = int(ip_split[1]) * 65536
    p3 = int(ip_split[2]) * 256
    p4 = int(ip_split[3])
    return p1 + p2 + p3 + p4


def ipv4_uint32_to_string(ipint):
    p1 = int(ipint / 16777216) % 256
    p2 = int(ipint / 65536) % 256
    p3 = int(ipint / 256) % 256
    p4 = int(ipint) % 256
    return '%d.%d.%d.%d' % (p1, p2, p3, p4)


def ipv6_string_to_uint128(ipstr):
    ip_split = ipstr.split('.')
    p1 = int(ip_split[0]) * 16777216
    p2 = int(ip_split[1]) * 65536
    p3 = int(ip_split[2]) * 256
    p4 = int(ip_split[3])
    return p1 + p2 + p3 + p4


def ipv6_uint128_to_string(ipint):
    p1 = int(ipint / 16777216) % 256
    p2 = int(ipint / 65536) % 256
    p3 = int(ipint / 256) % 256
    p4 = int(ipint) % 256
    return '%d.%d.%d.%d' % (p1, p2, p3, p4)
