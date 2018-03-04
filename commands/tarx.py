#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util
import pathlib

msg_list = [
        "Brief:",
        "    extract compressed [file] such as: *.rar, *.zip, *.tar.gz, *.tax, *.jar etc",
        "Usage:",
        "    %s [file]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
if len(sys.argv) <= 1:
    util.help_msg(msg_list)

target = pathlib.Path(util.merge_args())
basename = target.stem
extname = target.suffix
print('target: %s, basename: %s, extname: %s' % (target, basename, extname))
if target.name.count('.') > 1:
    extname = target.suffixes.join('')


gzfile = pathlib.Path('%s.tar.gz' % target).name
print('gzfile: %s, target: %s' % (gzfile, target))
if os.path.isfile(gzfile):
    print('mv "%s" "%s.old"' % (gzfile, gzfile))
    os.system('mv "%s" "%s.old"' % (gzfile, gzfile))
print('tar -zcvf "%s" "%s"' % (gzfile, target))
os.system('tar -zcvf "%s" "%s"' % (gzfile, target))

for i in $@; do
    extension="${i##*.}"
    filename="${i%.*}"
    filenamelen=${#filename}
    if [[ $extension == "zip" && $filenamelen -gt 0 ]]; then
        if [[ -d $filename ]]; then
            mv $filename "$filename.old"
        fi
        unzip "$i" -d $filename
    elif [[ $extension == "gz" || $extension == "tar.gz" || $extension == "tar" ]]; then
        if [[ -d $filename ]]; then
            mv $filename "$filename.old"
        fi
        tar -zxvf $i
    elif [[ $extension == "rar" ]]; then
        if [[ -d $filename ]]; then
            mv $filename "$filename.old"
        fi
        if [[ -d $filename ]]; then
            mv $filename "$filename.old"
        fi
        mkdir $filename
        mv $i $filename
        cd $filename
        unrar x $i
        mv "$i" ..
        cd ..
    elif [[ $extension == "jar" ]];then
        if [[ -d $filename ]]; then
            mv $filename "$filename.old"
        fi
        mkdir $filename
        mv $i $filename
        cd $filename
        jar xf $i
        mv $i ..
        cd ..
    else
        if [[ -d $filename ]]; then
            mv $filename "$filename.old"
        fi
        tar -zxvf $i
    fi
done
