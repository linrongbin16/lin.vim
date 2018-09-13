#! /usr/bin/env python
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import urllib.request
import shutil

if __name__ == '__main__':
    target_url = sys.argv[1]
    output_file = sys.argv[2]
    print("download %s to %s" % (sys.argv[1], sys.argv[2]))
    with urllib.request.urlopen(target_url) as response, open(
            output_file, 'wb') as out_file:
        shutil.copyfileobj(response, out_file)
