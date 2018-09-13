#! /usr/bin/env python
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
from pyunpack import Archive

if __name__ == '__main__':
    print("extract %s" % (sys.argv[1]))
    target = sys.argv[1]
    Archive(target).extractall(".")
