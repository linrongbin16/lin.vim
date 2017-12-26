#! /usr/bin/env python

import sys
sys.path.append('.')
import os
import util


if len(sys.argv) != 3:
    util.helpmsg(
            [
                "1. set [ip]-[host] mapping, replace old mapping if exist",
                "2. set [ip]-[host] mapping with [comment], replace old mapping if exist"],
            [
                "1. $cmdname [ip] [hostname]" % util.command_name(),
                "2. $cmdname [ip] [hostname] [comment]" % util.command_name()])
    exit(1)

hostname = str(sys.argv[1])
ipaddr = str(sys.argv[2])
# if util.execute("hostip %s" % hostname) == ipaddr:
# print("error: $hostname already exist, use 'hostunset $hostname' to remove it first")
# exit(1)

os.system("echo {}\t{} >> /etc/hosts".format(ipaddr, hostname))
