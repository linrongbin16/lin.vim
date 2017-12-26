#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import util


def helpmsg():
    print("Brief:")
    print("    git add and commit on current branch")
    print("Usage:")
    print("    %s [comment]" % sys.argv[0])
    print("Try again")
    print("")


if len(sys.argv) <= 2:
    helpmsg(
            "git add and commit on current branch",
            "%s [comment]" % sys.argv[0])
    exit(1)

comment = util.get_parameter()
branch = util.run("git status | head -n 1 | awk '{print $3}'")
print("[lin-vim] git commit on branch: '%s', comment: '%s', path: '%s'" % (branch, comment, os.getcwd()))
util.makesure("[lin-vim] yes? ")
os.system("git add -A . ")
os.system("git commit -m \"%s\" " % comment)
