#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
import time
import datetime
import pdb
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    1. get current system timestamp like '1518501493.25' sec",
        "    2. transform a self defined [date] string to timestamp in seconds",
        "       [date] format in 'year month day hour minute second.subsecond' sequence can be auto detected",
        "       such as '2018-02-13' '20180203' '2018 year - 2 mon - 7 day - 12 hour - 9 min - 6.731901 sec' '20180211 121031.817'",
        "Usage:",
        "    1. %s" % util.command_name(),
        "    2. %s [date]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)


def parse_date_string(date_str):
    # pdb.set_trace()
    date_len = len(date_str)
    number = [None, None, None, None, None, None, None]
    number_max = [4, 2, 2, 2, 2, 2, 999999999]
    number_count = 0
    number_len = 0
    start_pos = None
    for i in xrange(date_len):
        if date_str[i].isdigit():
            if start_pos is None:
                start_pos = i
            else:
                number_len += 1
                # print("isdigit 1, date_str[%s]: %s,  number_len: %s, number: %s" % (str(i), str(date_str[i]), str(number_len), str(number)))
                if number_len >= number_max[number_count] - 1:
                    number[number_count] = int(date_str[start_pos:number_max[number_count]])
                    number_count += 1
                    start_pos = None
                    number_len = 0
            print("isdigit 2, date_str[%s]: %s,  number_len: %s, number: %s" % (str(i), str(date_str[i]), str(number_len), str(number)))
        else:
            if start_pos is not None:
                number[number_count] = int(date_str[start_pos:i])
                number_count += 1
                start_pos = None
                number_len = 0
    print("1 number_len: %s, number_count: %s, number: %s" % (str(number_len), str(number_count), str(number)))
    if start_pos is not None:
        number[number_count] = int(date_str[start_pos:])
        number_count += 1
    print("2 number_len: %s, number_count: %s, number: %s" % (str(number_len), str(number_count), str(number)))
    if number_count == 0:
        return 0
    elif number_count == 1:
        return util.number_to_string(util.date_to_second(datetime.date(number[0], 0, 0)))
    elif number_count == 2:
        return util.number_to_string(util.date_to_second(datetime.date(number[0], number[1], 0)))
    elif number_count == 3:
        return util.number_to_string(util.date_to_second(datetime.date(number[0], number[1], number[2])))
    elif number_count == 4:
        return util.number_to_string(util.datetime_to_second(datetime.datetime(number[0], number[1], number[2], number[3], 0, 0)))
    elif number_count == 5:
        return util.number_to_string(util.datetime_to_second(datetime.datetime(number[0], number[1], number[2], number[3], number[4], 0)))
    elif number_count == 6:
        return util.number_to_string(util.datetime_to_second(datetime.datetime(number[0], number[1], number[2], number[3], number[4], number[5])))
    else:
        int_part = util.number_to_string(util.datetime_to_second(datetime.datetime(number[0], number[1], number[2], number[3], number[4], number[5])))
        decimal_part = util.number_to_string(number[6])
        return int_part + '.' + decimal_part


# error: miss text parameter
if len(sys.argv) <= 1:
    print(util.number_to_string(time.time()))
elif len(sys.argv) > 1:
    print(parse_date_string(util.merge_args()))
else:
    util.help_msg(msg_list)
