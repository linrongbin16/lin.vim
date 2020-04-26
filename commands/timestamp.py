#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" get timestamp like '1528122015.41' from now or from datetime string """

import sys
import time
import datetime
sys.path.append('.')
import util


def help_msg():
    print("Brief:")
    print(
        "    1. get timestamp since 1970-01-01 00:00:00(such as '1528122015.410' sec)"
    )
    print(
        "    2. convert local [datetime] string to timestamp, such as '2018-06-04', '2018-06-04 13:21:49.857'"
    )
    print("Usage:")
    print("    1. %s" % util.get_command_name())
    print("    2. %s [datetime]" % util.get_command_name())
    print("Try again")
    exit(1)


def get_second_by_date(year, month, day):
    return util.number_to_string(
        util.date_to_second(datetime.date(year, month, day)))


def get_second_by_datetime(year, month, day, hour, minute, second):
    return util.number_to_string(
        util.datetime_to_second(
            datetime.datetime(year, month, day, hour, minute, second)))


def date_second_impl(date_str):
    date_len = len(date_str)
    num = [None, None, None, None, None, None, None]
    len_max = [4, 2, 2, 2, 2, 2, 999999999]
    count = 0
    start_pos = None
    for i in range(date_len):
        if date_str[i].isdigit():
            if start_pos is None:
                start_pos = i
        if (not date_str[i].isdigit()) and (start_pos is not None):
            num[count] = int(date_str[start_pos:i])
            count += 1
            start_pos = None
        if (start_pos is not None) and (i - start_pos > len_max[count]):
            num[count] = int(date_str[start_pos:start_pos + len_max[count]])
            count += 1
            start_pos = None
    if start_pos is not None:
        num[count] = int(date_str[start_pos:])
        count += 1
    if count == 0:
        raise Exception('invalid [datetime]: ' + str(date_str))
    elif count == 1:
        return get_second_by_date(num[0], 0, 0)
    elif count == 2:
        return get_second_by_date(num[0], num[1], 0)
    elif count == 3:
        return get_second_by_date(num[0], num[1], num[2])
    elif count == 4:
        return get_second_by_datetime(num[0], num[1], num[2], num[3], 0, 0)
    elif count == 5:
        return get_second_by_datetime(num[0], num[1], num[2], num[3], num[4],
                                      0)
    elif count == 6:
        return get_second_by_datetime(num[0], num[1], num[2], num[3], num[4],
                                      num[5])
    else:
        int_part = get_second_by_datetime(num[0], num[1], num[2], num[3],
                                          num[4], num[5])
        decimal_part = util.number_to_string(num[6])
        return int_part + '.' + decimal_part


if __name__ == '__main__':
    util.check_help_message(help_msg)
    if len(sys.argv) <= 1:
        print(util.number_to_string(time.time()))
    else:
        print(date_second_impl(util.get_sys_args_one_line()))
