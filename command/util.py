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
    return platform.system() == "Windows"


def is_macos():
    return platform.system() == "Darwin"


def is_empty_str(s):
    return True if (s is None) else (len(s.strip()) == 0)


def read_file(name):
    try:
        fp = open(name, "r")
        data = fp.read()
        fp.close()
        return data
    except Exception:
        return None


def readlines_file(name):
    try:
        fp = open(name, "r")
        lines = fp.readlines()
        fp.close()
        return lines
    except Exception:
        return list()


def write_file(name, text):
    try:
        fp = open(name, "w")
        if isinstance(text, list):
            fp.writelines(text)
        else:
            fp.write(text)
        fp.close()
    except Exception:
        pass


def append_file(name, text):
    try:
        fp = open(name, "a+")
        if isinstance(text, list):
            fp.writelines(text)
        else:
            fp.write(text)
        fp.close()
    except Exception:
        pass


def purge_file(name):
    try:
        fp = open(name, "w")
        fp.close()
    except Exception:
        pass


def get_command_home():
    return (
        os.path.expanduser("~") + "\\.vim\\command"
        if is_windows()
        else os.path.expanduser("~") + "/.vim/command"
    )


def backup_file(target):
    if not os.path.exists(target):
        return
    bakname = "%s.%s" % (target, datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S"))
    os.rename(target, bakname)


def walk_dir(directory, include_hidden=False):
    save_dir = os.getcwd()
    os.chdir(directory)
    file_list = []
    for root, ds, fs in os.walk(os.getcwd()):
        if include_hidden is not True:
            fs[:] = [f for f in fs if not f[0] == "."]
            ds[:] = [d for d in ds if not d[0] == "."]
        file_list.extend([os.path.join(root, f) for f in fs])
    if os.path.exists(save_dir):
        os.chdir(save_dir)
    return file_list


def run(*cmd):
    try:
        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout_str = iter(proc.stdout.readline, b"")
        stderr_str = iter(proc.stderr.readline, b"")
    except subprocess.CalledProcessError:
        exit(3)
    outstr = [x.decode() for x in stdout_str if len(x) > 0]
    errstr = [x.decode() for x in stderr_str if len(x) > 0]
    return outstr, errstr


def check_user_confirm(msg):
    yes = input(msg)
    if not yes.lower().startswith("y"):
        print("[boostcript] error: user not confirm")
        exit(3)


def get_git_root():
    root, _ = run("git", "rev-parse", "--show-toplevel")
    return root[0].strip() if (len(root) > 0) else None


def check_git_repository():
    if get_git_root() is None:
        print("[vcmd] error: not a git repository")
        exit(3)


def get_git_current_branch():
    lines, _ = run("git", "status")
    return lines[0].split(" ")[2].strip()


def get_git_modified_files():
    result, _ = run("git", "ls-files", "-m")
    return [modified_file.strip() for modified_file in result]


def get_git_untract_files():
    result, _ = run("git", "ls-files", "--others", "--exclude-standard")
    return [untract_file.strip() for untract_file in result]


def get_git_remote_repository_count():
    repos, _ = run("git", "remote")
    return len(repos)


def get_git_remote_repository():
    repos, _ = run("git", "remote")
    repos = [x.strip() for x in repos]
    if len(repos) <= 0:
        return None
    repo_str = ", ".join(["'%s'[%d]" % (repos[i], i) for i in range(len(repos))])
    print("[vcmd] detected remote repositories: %s" % (repo_str))
    if len(repos) <= 1:
        user_input = input(
            "[vcmd] choose remote repository 0, by default: '%s'[0]: " % (repos[0])
        )
    else:
        user_input = input(
            "[vcmd] choose remote repository 0-%d, by default: '%s'[0]: "
            % (len(repos) - 1, repos[0])
        )
    if is_empty_str(user_input):
        repo_str = list(repos)[0]
    else:
        try:
            repo_str = repos[int(user_input)]
        except Exception:
            print("[vcmd] error input: %s" % (user_input))
            exit(3)
    return repo_str


def get_git_remote_branch():
    branches, _ = run("git", "status")
    branches = [x.strip() for x in branches]
    branch = branches[0].split(" ")[2].strip()
    user_input = input("[vcmd] choose branch, by default: '%s': " % (branch))
    return branch if is_empty_str(user_input) else user_input


def get_git_last_commit(n):
    commits, _ = run("git", "log", "--pretty=oneline")
    return commits[n].split(" ")[0]
