#! /usr/bin/env bash

import sys
sys.path.append('.')
import os
import util

# error 1: git comment is a must
if len(sys.argv) <= 1:
    util.helpmsg("git add, commit and push on current branch", "%s [comment]" % util.command_name())
    exit(1)

comment = util.get_parameter()
branch = util.execute(" git status | head -n 1 | awk '{print $3}' ")
print("[lin-vim] git push on branch: '%s', comment: '%s', path: '%s' " % (branch, comment, os.getcwd()))
util.makesure("[lin-vim] yes? ")
os.system("git pull origin %s" % branch)
os.system("git add -A .")
os.system("git commit -m \"%s\"" % comment)
os.system("git push origin %s" % branch)
