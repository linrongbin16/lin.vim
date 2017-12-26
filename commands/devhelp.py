#! /usr/bin/env python

import sys
sys.path.append('.')
import os
import util


def fmtprint1(cmdname, prefix):
    print(cmdname)
    files = os.listdir('.')
    for f in files:
        if f.find(prefix) >= 0:
            if f.find('.') <= 0:
                print("    {}".format(f))


def fmtprint2(cmdname, prefix1, prefix2):
    print(cmdname)
    files = os.listdir('.')
    for f in files:
        if f.find(prefix1) >= 0 or f.find(prefix2) >= 0:
            if f.find('.') <= 0:
                print("    {}".format(f))


if len(sys.argv) <= 1:
    print("Type:")
    print("    git:         git operation")
    print("    host:        host-ip mapping")
    print("    process:     process operation")
    print("    ssh:         ssh operation")
    print("    tar:         compress/extract file operation")
    print("    ag:          better text search based on 'the-silversearcher-ag'")
    print("    ip:          ip address tools")
    print("    file:        file operation")
    print("    datetime:    datetime operation")
    print("    math:        math calculation")
    print("    number:      translate number between binary, octal, decimal, heximal")
    print("    project:     create database for source code, based on 'cscope' and 'ctags'")
    print("Detail:")
    print("    type '$cmdname type' for more detail")
    print("")
elif len(sys.argv) == 2:
    if sys.argv[1] == "git":
        fmtprint1("git operation:", "git")
    elif sys.argv[1] == "host":
        fmtprint1("host-ip mapping:", "host")
    elif sys.argv[1] == "process":
        fmtprint1("process operation:", "proc")
    elif sys.argv[1] == "ssh":
        fmtprint2("ssh operation:", "ssh", "rsa")
    elif sys.argv[1] == "tar":
        fmtprint1("compress/extract file operation:", "tar")
    elif sys.argv[1] == "ag":
        fmtprint1("better text search based on 'the-silversearcher-ag':", "ag")
    elif sys.argv[1] == "ip":
        fmtprint1("ip address tools:", "ip")
    elif sys.argv[1] == "file":
        fmtprint1("file operation:", "file")
    elif sys.argv[1] == "datetime":
        fmtprint1("datetime operation:", "time")
    elif sys.argv[1] == "math":
        fmtprint1("math calculation:", "math")
    elif sys.argv[1] == "number":
        fmtprint1("translate number between binary, octal, decimal, heximal:", "num")
    elif sys.argv[1] == "project":
        fmtprint1("create database for source code, based on 'cscope' and 'ctags':", "proj")
    print("")
else:
    util.helpmsg(
            [
                "1. overview commands",
                "2. get help of specified command [type]"],
            [
                "1. $cmdname",
                "2. $cmdname [type]"])
    exit(1)
