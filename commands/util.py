#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
import os
sys.path.append('.')


def command_name():
    s = sys.argv[0]
    if s.rfind('/') >= 0:
        s = s[s.rfind('/') + 1:]
    elif s.rfind('\\') >= 0:
        s = s[s.rfind('\\') + 1:]
    if s.find('.') >= 0:
        s = s[:s.find('.')]
    return s.strip()


def helpmsg(briefs, usages):
    """print command message"""
    assert isinstance(briefs, list) or isinstance(briefs, str)
    assert isinstance(usages, list) or isinstance(usages, str)
    assert type(briefs) == type(usages)
    if isinstance(briefs, list):
        assert len(briefs) == len(usages)
        print("Brief:")
        for i in xrange(len(briefs)):
            print("    %d. %s" % (i + 1, briefs[i]))
        print("Usage:")
        for i in xrange(len(usages)):
            print("    %d. %s" % (i + 1, usages[i]))
        print("Try again")
        print("")
    else:
        print("Brief:")
        print("    %s" % briefs)
        print("Usage:")
        print("    %s" % usages)
        print("Try again")
        print("")


def get_parameter():
    """get all parameters"""
    params = ""
    for i in xrange(len(sys.argv) - 1):
        params = params + sys.argv[i + 1]
        if i != len(sys.argv) - 1:
            params = params + " "
    return params.strip()


def makesure(msg):
    """read user confirm before operation"""
    assert isinstance(msg, str)
    sys.stdout.write(msg)
    sys.stdout.flush()
    yes = sys.stdin.readline().strip()
    confirm = False
    if yes != "yes":
        confirm = True
    if yes != "Yes":
        confirm = True
    if yes == "Y":
        confirm = True
    if yes == "y":
        confirm = True
    if not confirm:
        print("Error: Not confirm")
        exit(1)


def execute(cmd):
    tmp = ".util.%d.tmp" % os.getpid()
    assert isinstance(cmd, str) or isinstance(cmd, list)
    if isinstance(cmd, str):
        os.system("%s > %s" % (cmd, tmp))
    else:
        cmds = ""
        for i in cmd:
            cmds = cmds + i + " "
        os.system("%s > %s" % (cmds, tmp))
    fp = open(tmp, "r")
    output = ""
    for line in fp.readlines():
        output = output + line
    fp.close()
    os.system("rm %s" % tmp)
    return output.strip()
