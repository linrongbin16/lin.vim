#! /usr/bin/env python

import sys
sys.path.append('.')
import os
import util


if len(sys.argv) <= 1:
    util.helpmsg(
        "find ip by [host]",
        "%s [host]" % util.command_name())
    exit(1)

hostname = str(sys.argv[1]).strip()
print(util.run("grep \"%s\" %s | awk '{print $1}'" % (hostname, util.hosts_db)))
