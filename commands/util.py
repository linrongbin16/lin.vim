#! /usr/bin/env python
# -*- coding:utf-8 -*-
'''common utils for lin-vim commands'''

import sys
import os
import traceback
import types
sys.path.append('.')


ag_ignore = '~/.vim/commands/ag.ignore'


def command_name():
    '''get command name'''
    name = sys.argv[0]
    if name.rfind('/') >= 0:
        name = name[name.rfind('/') + 1:]
    elif name.rfind('\\') >= 0:
        name = name[name.rfind('\\') + 1:]
    if name.find('.') >= 0:
        name = name[:name.find('.')]
    return name.strip()


def helpmsg(briefs, usages):
    """print command message"""
    assert isinstance(briefs, (list, str))
    assert isinstance(usages, (list, str))
    assert type(briefs) == type(usages)
    if isinstance(briefs, list):
        assert len(briefs) == len(usages)
        print("Brief:")
        for i in xrange(len(briefs)):
            print("    %s" % briefs[i])
        print("Usage:")
        for i in xrange(len(usages)):
            print("    %s" % usages[i])
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
    '''execute shell command'''
    tmp = ".util.%d.tmp" % os.getpid()
    assert isinstance(cmd, (list, str))
    if isinstance(cmd, str):
        os.system("%s > %s" % (cmd, tmp))
    else:
        cmds = ""
        for i in cmd:
            cmds = cmds + i + " "
        os.system("%s > %s" % (cmds, tmp))
    fp = open(tmp, "r")
    retval = ""
    for line in fp.readlines():
        retval = retval + line
    fp.close()
    os.system("rm %s" % tmp)
    return retval.strip()


def run(cmd):
    '''run shell command and return the retval'''
    tmp = ".util.%d.tmp" % os.getpid()
    assert isinstance(cmd, (list, str))
    if isinstance(cmd, str):
        os.system("%s > %s" % (cmd, tmp))
    else:
        cmds = ""
        for i in cmd:
            cmds = cmds + i + " "
        os.system("%s > %s" % (cmds, tmp))
    fp = open(tmp, "r")
    retval = ""
    for line in fp.readlines():
        retval = retval + line
    fp.close()
    os.system("rm %s" % tmp)
    return retval.strip()
