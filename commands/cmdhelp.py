#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Type:",
        "    git:         git operation",
        "    host:        host-ip mapping",
        "    process:     process operation",
        "    ssh:         ssh operation",
        "    tar:         compress/extract file operation",
        "    ag:          text search based on 'the_silver_searcher'",
        "    ip:          ip address tools",
        "    file:        file operation",
        "    datetime:    datetime operation",
        "    number:      number calculation, decimal translation",
        "    project:     create completion-database for source code, based on 'cscope' and 'ctags'",
        "Detail:",
        "    type '%s type' for more detail" % util.command_name()]

util.check_help(msg_list)
if len(sys.argv) != 1:
    util.help_msg(msg_list)

cmd_home = os.path.expanduser('~') + '/.vim/commands'


def fmtprint1(cmdname, prefix):
    print(cmdname)
    for i in os.path.list(cmd_home):
        py_pos = i.find('.py')
        if py_pos >= 0 and py_pos == len(i) - 3:
            print("    %s" % i[:py_pos])
    print("")


if sys.argv[1] == "git":
    fmtprint1("git operation:", "g")
elif sys.argv[1] == "host":
    fmtprint1("host-ip mapping:", "h")
elif sys.argv[1] == "proc":
    fmtprint1("process operation:", "p")
elif sys.argv[1] == "ssh":
    fmtprint1("ssh operation:", "ssh")
elif sys.argv[1] == "tar":
    fmtprint1("compress/extract file operation:", "tar")
elif sys.argv[1] == "ag":
    fmtprint1("text search based on 'the-silversearcher-ag':", "ag")
elif sys.argv[1] == "ip":
    fmtprint1("ip address tools:", "ip")
elif sys.argv[1] == "file":
    fmtprint1("file operation:", "f")
elif sys.argv[1] == "datetime":
    fmtprint1("datetime operation:", "date")
elif sys.argv[1] == "num":
    fmtprint1("number calculation:", "number")
elif sys.argv[1] == "proj":
    fmtprint1("create database for source code, based on 'cscope' and 'ctags':", "proj")
