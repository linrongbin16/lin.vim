#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
import os


CMD_NAME = sys.argv[0]


def helpmsg():
    '''print command message'''
    print("Brief:")
    print("    count [text] of current directory recursively")
    print("Usage:")
    print("    %s [text]" % CMD_NAME)
    print("Try again")
    print("")


def all_param():
    '''prepare all parameters'''
    text = ""
    for i in xrange(len(sys.argv)-1):
        text = text + sys.argv[i+1]
        if i != len(sys.argv) - 1:
            text = text + " "
    return text


# error 1: miss repository parameter
if len(sys.argv) <= 1:
    helpmsg()
    exit(1)

ignore = "~/.vim/commands/ag.ignore"
os.system("ag -c --smart-case --depth -1 -p %s \"%s\" ." % (ignore, all_param()))
