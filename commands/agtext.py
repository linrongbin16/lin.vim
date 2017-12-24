#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
import os

cmdname = sys.argv[0]

def helpmsg():
    '''echo help message'''
    print("Brief:")
    print("    find [text] of current directory recursively")
    print("Usage:")
    print("    %s [text]" % (cmdname))
    print("Try again")
    print("")

def get_parameter():
    '''get all parameters'''
    text = ""
    for i in xrange(len(sys.argv) - 1):
        text = text + sys.argv[i + 1]
        if i != len(sys.argv) - 1:
            text = text + " "
    return text

# error 1: miss repository parameter
if len(sys.argv) <= 1:
    helpmsg()
    exit(1)

ignore = "~/.vim/commands/.ignore"
os.system("ag --smart-case --depth -1 -p %s \"%s\" ." % (ignore, get_parameter()))
