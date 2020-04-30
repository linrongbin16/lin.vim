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
        slash = None
        if util.is_windows():
            slash = '\\'
        else:
            slash = '/'
        self.db = util.get_command_home() + slash + 'srch.ignore'
        self.opt_parser = optparse.OptionParser()
        self.opt_parser.add_option(
            '-d',
            '--depth',
            dest='depth',
            type='int',
            default=1,
            help='*optional* search folder depth, by default 1')
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

    def text(self, text, depth):
        os.system('ag --smart-case --depth -%d -p %s %s .' %
                  (depth, self.db, text))

    def count(self, text, depth):
        os.system('ag -c --smart-case --depth -%d -p %s %s .' %
                  (depth, self.db, text))

    def file_name(self, text, depth):
        os.system('ag -l --smart-case --depth -%d -p %s %s .' %
                  (depth, self.db, text))

    def word(self, word, depth):
        os.system('ag -w --smart-case --depth -%d -p %s %s .' %
                  (depth, self.db, word))

    def ignore(self, filetype):
        pass

    def purge(self):
        pass

    def show(self):
        pass


if __name__ == '__main__':
    srch = Srch()
    (options, args) = srch.parse_opt()
    depth = 1
    if options.depth is not None:
        depth = options.depth
    if options.text is not None:
        'srch [text]'
        srch.text(options.text, depth)
    if options.count is not None:
        'srch -c/--count [text]'
        srch.count(options.count, depth)
    elif options.file_name is not None:
        'srch -f/--file [text]'
        srch.file_name(options.file_name, depth)
    elif options.word is not None:
        'srch -w/--word [text]'
        srch.word(options.word, depth)
    elif options.ignore is not None:
        'srch -i/--ignore [text]'
        srch.ignore(options.ignore)
    elif options.purge is not None:
        'srch -p/--purge [text]'
        srch.purge()
    elif options.show is not None:
        'srch -s/--show [text]'
        srch.show()
