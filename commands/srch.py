#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" search with ag in current directory """

import optparse
import sys
import os
sys.path.append('.')
import util


class Srch:
    def __init__(self):
        self.name = util.get_command_name()
        self.opt_parser = optparse.OptionParser()
        self.opt_parser.add_option(dest='text', help='search all [text]')
        self.opt_parser.add_option(
            '-c',
            '--count',
            dest='count',
            help='search file count that contains [text]')
        self.opt_parser.add_option(
            '-f',
            '--file',
            dest='file_name',
            help='search file names that contains [text]')
        self.opt_parser.add_option('-w',
                                   '--word',
                                   dest='word',
                                   help='search all [word]')
        self.opt_parser.add_option('-i',
                                   '--ignore',
                                   dest='ignore',
                                   help='ignore [filetype] for searcher')
        self.opt_parser.add_option(
            '-p',
            '--purge',
            dest='purge',
            action='store_true',
            help='purge all filetype ignored for searcher')
        self.opt_parser.add_option(
            '-s',
            '--show',
            dest='show',
            action='store_true',
            help='show all filetype ignored for searcher')

    def parse_opt(self):
        return self.opt_parser.parse_args()

    def text(self, t):
        pass

    def count(self, t):
        pass

    def file(self, t):
        pass

    def word(self, w):
        pass

    def ignore(self, filetype):
        pass

    def purge(self):
        pass

    def show(self):
        pass


def help_msg():
    print("Brief:")
    print("    count [text] in current directory")
    print("Usage:")
    print("    %s [text]" % util.get_command_name())
    print("Try again")
    exit(1)


if __name__ == '__main__':
    # opt_parser = optparse.OptionParser()
    # opt_parser.add_option('-c',
    # '--count',
    # type='string',
    # dest='count',
    # help='search [text] count')

    # util.check_help_message(help_msg)
    # if len(sys.argv) != 2:
    # help_msg()
    # os.system('ag -c --smart-case --depth -1 -p %s %s .' %
    # (util.get_ag_ignore_file(), util.get_sys_args_one_line()))
    srch = Srch()
