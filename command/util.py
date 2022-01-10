#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018- <linrongbin16@gmail.com>

import sys
import os
import threading
import platform
import datetime
import time
import subprocess


def is_windows():
    return platform.system().lower().startswith("win")


def is_macos():
    return platform.system().lower().startswith("darwin")


def str_empty(s):
    return True if (s is None) else (len(s.strip()) == 0)


def read_file(name):
    fp = open(name, "r")
    data = fp.read()
    fp.close()
    return data


def read_file_by_lines(name):
    fp = open(name, "r")
    lines = fp.readlines()
    fp.close()
    return lines


def write_file(name, text):
    fp = open(name, "w")
    if isinstance(text, list):
        fp.writelines(text)
    else:
        fp.write(text)
    fp.close()


def append_file(name, text):
    fp = open(name, "a+")
    if isinstance(text, list):
        fp.writelines(text)
    else:
        fp.write(text)
    fp.close()


def purge_file(name):
    fp = open(name, "w")
    fp.close()


def backup_file(target):
    if not os.path.exists(target):
        return
    bakname = "%s.%s" % (target, datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S"))
    os.rename(target, bakname)


def get_command_home():
    SLASH = "\\" if is_windows() else "/"
    return os.path.expanduser("~") + f"{SLASH}.vim{SLASH}command"


def list_files(folder, include_hidden=False, depth=99):
    save_dir = os.getcwd()
    os.chdir(folder)
    start_dir = os.getcwd()
    file_list = []
    dir_list = []
    for root, ds, fs in os.walk(start_dir):
        if not include_hidden:
            fs[:] = [f for f in fs if not f.startswith(".")]
            ds[:] = [d for d in ds if not d.startswith(".")]
        start_count = start_dir.count("/") + start_dir.count("\\")
        root_count = root.count("/") + root.count("\\")
        if root_count - start_count > depth:
            continue
        file_list.extend([os.path.join(root, f) for f in fs])
        dir_list.extend([os.path.join(root, d) for d in ds])
    if os.path.exists(save_dir):
        os.chdir(save_dir)
    return file_list, dir_list


def run(cmd):
    proc = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out_bytes = iter(proc.stdout.readline, b"")
    err_bytes = iter(proc.stderr.readline, b"")
    out_lines = [x.decode() for x in out_bytes if len(x) > 0]
    err_lines = [x.decode() for x in err_bytes if len(x) > 0]
    return out_lines, err_lines


def check_user_confirm(msg):
    yes = input(msg)
    if not yes.lower().startswith("y"):
        print("[vcmd] user denied, exit...")
        exit(3)


def get_git_root():
    root, _ = run("git rev-parse --show-toplevel")
    return root[0].strip() if (len(root) > 0) else None


def check_git_repository():
    if get_git_root() is None:
        print("[vcmd] error: not a git repository, exit...")
        exit(3)


def get_git_current_branch():
    lines, _ = run("git status")
    return lines[0].split(" ")[2].strip()


def get_git_modified_files():
    result, _ = run("git ls-files -m")
    return [modified_file.strip() for modified_file in result]


def get_git_untract_files():
    result, _ = run("git ls-files --others --exclude-standard")
    return [untract_file.strip() for untract_file in result]


def get_git_remote_repository_count():
    repos, _ = run("git remote")
    return len(repos)


def get_git_remote_repository():
    repos, _ = run("git remote")
    repos = [x.strip() for x in repos]
    if len(repos) <= 0:
        return None
    repos_str = ", ".join([f"'{repos[i]}'[{i}]" for i in range(len(repos))])
    user_input = input(f"[vcmd] choose remote repository {repos_str} (by default 0): ")
    if str_empty(user_input):
        repos_str = list(repos)[0]
    else:
        try:
            repos_str = repos[int(user_input)]
        except:
            print(f"[vcmd] error input:{user_input}, exit...")
            exit(3)
    return repos_str


def get_git_remote_branch():
    branches, _ = run("git status")
    branches = [x.strip() for x in branches]
    branch = branches[0].split(" ")[2].strip()
    user_input = input(f"[vcmd] choose branch (by default {branch}): ")
    return branch if str_empty(user_input) else user_input


def get_git_last_commit(n):
    commits, _ = run("git log --pretty=oneline")
    return commits[n].split(" ")[0]
