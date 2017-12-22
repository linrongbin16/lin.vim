#! /usr/bin/env python

import sys
import os

cmdname = sys.argv[0]

def helpmsg():
    print("Brief:")
    print("    count [text] of current directory recursively")
    print("Usage:")
    print("    %s [text]" % cmdname)
    print("Try again")
    print("")

# error 1: miss repository parameter
if len(sys.argv) <= 1:
    helpmsg()
    exit(1)

text = sys.argv[1]
ignore = "~/.vim/commands/.ignore"
os.system("ag -c --smart-case --depth -1 -p %s \"%s\" ." % (ignore, text))
