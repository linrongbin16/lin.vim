#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" Git operations. """

import sys
import os
import getopt
import datetime
sys.path.append('.')
import util

slash = '\\' if util.is_windows() else '/'
db = util.get_command_home() + slash + 'git_proxy.db'

help_msg = '''Git operations.

usage:
    giter -ba/--branch-all              show all branches.
    giter -bl/--branch-local            show all local branches.
    giter -br/--branch-remote           show all remote branches.
    giter -bc/--branch-create <branch>  create new local <branch> and move to it.
    giter -bm/--branch-move <branch>    move to local existing <branch>.
    giter [option] -pl/--pull           pull from remote/branch.
    giter [option] -ps/--push           push to remote/branch with comment.
    giter -d/--discard                  discard changes.
    giter -rb/--rebase [branch]         rebase to remote/[branch].
    giter -rv/--revert [N]              revert to last [N] commit (create new commit without push force), by default 1.
    giter -rs/--reset [N]               reset to last [N] commit (don't create new commit, need to push force to overwrite remote), by default 1.
    giter -p/--proxy <proxy>            configure <proxy> for git.
    giter -ps/--proxy-show              show proxy configuration for git.
    giter -pe/--proxy-enable            enable proxy configuration for git.
    giter -pd/--proxy-disable           disable proxy configuration for git.

option:
    -f/--force                          force operation on pull/push, by default False.

flag:
    giter -h/--help                     show help message.
'''


def help():
    print(help_msg)
    exit(0)


def giter_branch_show(opt):
    util.check_git_repository()
    if opt.startswith('a'):
        outs, errs = util.run('git', 'branch', '-a')
        print("[lin-command] all branch:")
        for o in outs:
            print("  %s" % (o.strip()))
    elif opt.startswith('l'):
        outs, errs = util.run('git', 'branch')
        print("[lin-command] local branch:")
        for o in outs:
            print("  %s" % (o.strip()))
    elif opt.startswith('r'):
        outs, errs = util.run('git', 'branch', '-r')
        print("[lin-command] remote branch:")
        for o in outs:
            print("  %s" % (o.strip()))
    exit(0)


def giter_branch_create(name):
    util.check_git_repository()
    os.system("git checkout -b %s" % (name))
    exit(0)


def giter_branch_move(name):
    util.check_git_repository()
    os.system("git checkout %s" % (name))
    exit(0)


def giter_pull(force):
    util.check_git_repository()
    remote_count = util.get_git_remote_repository_count()
    if remote_count <= 0:
        print("[lin-command] remote git repository not exist!")
        exit(3)
    repo = util.get_git_remote_repository()
    branch = util.get_git_remote_branch()
    print('[lin-command] git pull from \'%s\'/\'%s\'' % (repo, branch))
    os.system("git fetch")
    os.system("git pull %s %s %s" % ('--force' if force else '', repo, branch))
    exit(0)


def giter_push(force):
    util.check_git_repository()
    remote_count = util.get_git_remote_repository_count()
    if remote_count <= 0:
        print("[lin-command] remote git repository not exist!")
        exit(3)
    repo = util.get_git_remote_repository()
    branch = util.get_git_remote_branch()
    comment = input('[lin-command] enter comment: ')
    comment = '[lin-command] giter push at %s' % (datetime.datetime.now(
    ).strftime('%Y/%m/%d %H:%M:%S')) if util.is_empty_str(comment) else comment
    util.check_user_confirm(
        '[lin-command] git push to \'%s\'/\'%s\' with \'%s\', yes? ' %
        (repo, branch, comment))
    os.chdir(util.get_git_root())
    os.system("git add -A .")
    os.system("git commit -m \"%s\"" % (comment))
    os.system("git push %s %s %s" % ('--force' if force else '', repo, branch))
    exit(0)


def giter_discard():
    util.check_git_repository()
    save_dir = os.getcwd()
    os.chdir(util.get_git_root())
    modifies = util.get_git_modified_files()
    untracts = util.get_git_untract_files()
    file_list = modifies + untracts
    for i in file_list:
        if i in modifies:
            print('[lin-command] discard: %s' % (i + ' '))
            os.system('git checkout %s' % (i + ' '))
        elif i in untracts:
            print('[lin-command] remove: %s' % (i + ' '))
            os.system('rm %s' % (i + ' '))
    if os.path.exists(save_dir):
        os.chdir(save_dir)
    exit(0)


def giter_rebase(branch):
    util.check_git_repository()
    os.system("git rebase %s" % branch)
    exit(0)


def giter_revert(n):
    util.check_git_repository()
    branch = util.get_git_current_branch()
    commit = util.get_git_last_commit(n - 1)
    util.check_user_confirm(
        '[lin-boost] git revert to last \'%d\' commits \'%s\' on \'%s\', yes? '
        % (n, commit, branch))
    save_dir = os.getcwd()
    os.chdir(util.get_git_root())
    os.system("git revert %s" % commit)
    if os.path.exists(save_dir):
        os.chdir(save_dir)
    exit(0)


def giter_reset(n):
    util.check_git_repository()
    branch = util.get_git_current_branch()
    commit = util.get_git_last_commit(n - 1)
    util.check_user_confirm(
        '[lin-boost] git revert to last \'%d\' commits \'%s\' on \'%s\', yes? '
        % (n, commit, branch))
    save_dir = os.getcwd()
    os.chdir(util.get_git_root())
    os.system("git reset HEAD~%d" % n)
    if os.path.exists(save_dir):
        os.chdir(save_dir)
    exit(0)


def giter_config_proxy(p):
    util.write_file(db, p)
    exit(0)


def giter_dump_proxy():
    gc = os.path.expanduser('~') + slash + '.gitconfig'
    proxies = util.readlines_file(gc)
    trigger = False
    saver = None
    for l in proxies:
        if trigger:
            print('[lin-command] .gitconfig: %s %s' % (saver, l.strip()))
            trigger = False
        if l.lower().find('http') >= 0:
            saver = l.strip()
            trigger = True
    print('[lin-command] git proxy: %s' % util.read_file(db))
    exit(0)


def giter_enable_proxy():
    proxy = util.read_file(db)
    if proxy is None:
        print(
            '[lin-command] git proxy not configured yet, please try \'giter -p <proxy>\''
        )
        exit(0)
    httpcmd = 'git config --global http.proxy %s' % proxy
    httpscmd = 'git config --global https.proxy %s' % proxy
    os.system(httpcmd)
    os.system(httpscmd)
    exit(0)


def giter_disable_proxy():
    os.system('git config --global --unset https.proxy')
    os.system('git config --global --unset http.proxy')


if __name__ == '__main__':
    try:
        opts, args = getopt.getopt(sys.argv[1:], 'fb:p:r:dh', [
            'force', 'branch-local', 'branch-remote', 'branch-all',
            'branch-create=', 'branch-move=', 'pull', 'push', 'discard',
            'rebase', 'revert', 'reset', 'proxy=', 'proxy-show',
            'proxy-enable', 'proxy-disable', 'help'
        ])
        force = False
        for opt in opts:
            if opt[0] in ('-f', '--force'):
                force = True
                break
        for opt in opts:
            if opt[0] == '-b':
                if opt[1] == 'a':
                    giter_branch_show('a')
                elif opt[1] == 'l':
                    giter_branch_show('l')
                elif opt[1] == 'r':
                    giter_branch_show('r')
                elif opt[1] == 'c':
                    giter_branch_create(opt[1])
                elif opt[1] == 'm':
                    giter_branch_move(opt[1])
            elif opt[0] == '--branch-all':
                giter_branch_show('a')
            elif opt[0] == '--branch-local':
                giter_branch_show('l')
            elif opt[0] == '--branch-remote':
                giter_branch_show('r')
            elif opt[0] == '--branch-create':
                giter_branch_create(opt[1])
            elif opt[0] == '--branch-move':
                giter_branch_move(opt[1])
            elif opt[0] == '-p':
                if opt[1] == 'l':
                    giter_pull(force)
                elif opt[1] == 's':
                    giter_push(force)
            elif opt[0] == '--pull':
                giter_pull(force)
            elif opt[0] == '--push':
                giter_push(force)
            elif opt[0] in ('-d', '--discard'):
                giter_discard()
            elif opt[0] == '-r':
                if opt[1] == 'b':
                    giter_rebase(n)
                elif opt[1] == 'v':
                    n = 1 if len(opt) < 3 else int(opt[2])
                    giter_revert(n)
                elif opt[1] == 's':
                    n = 1 if len(opt) < 3 else int(opt[2])
                    giter_reset(n)
            elif opt[0] == '--rebase':
                giter_rebase(opt[1])
            elif opt[0] == '--revert':
                n = 1 if len(opt) < 2 else int(opt[1])
                giter_revert(n)
            elif opt[0] == '--reset':
                n = 1 if len(opt) < 2 else int(opt[1])
                giter_reset(n)
            elif opt[0] == '-p':
                if opt[1] == 's':
                    giter_dump_proxy()
                elif opt[1] == 'e':
                    giter_enable_proxy()
                elif opt[1] == 'd':
                    giter_disable_proxy()
                else:
                    giter_config_proxy(opt[1])
            elif opt[0] == '--proxy':
                giter_config_proxy(opt[1])
            elif opt[0] == '--proxy-show':
                giter_dump_proxy()
            elif opt[0] == '--proxy-enable':
                giter_enable_proxy()
            elif opt[0] == '--proxy-disable':
                giter_disable_proxy()
        help()
    except getopt.GetoptError as e:
        print(str(e) + '\n')
        help()
