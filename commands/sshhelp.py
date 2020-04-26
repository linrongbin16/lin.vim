#! /usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright 2018-  <linrongbin16@gmail.com>
""" ssh manual helper """


def help_msg():
    print("Help 1: Generate ssh token for [your_email@email.com].")
    print(
        "    Remove old *id_rsa* and *id_rsa.pub* in ~/.ssh before generation."
    )
    print("    $ ssh-keygen -t rsa -b 4096 -C 'your_email@email.com'")
    print("    $ Generating public/private rsa key pair.")
    print(
        "    $ Enter file in which to save the key (~/.ssh/id_rsa) `type ENTER`"
    )
    print("    $ Enter passphrase (empty for no passphrase) `type ENTER`")
    print("    $ Enter same passphrase again: `type ENTER`")
    print("    $ chmod 700 -R ~/.ssh")
    print("    $ chmod 600 ~/.ssh/authorized_keys")
    print("    $ chmod 600 ~/.ssh/id_rsa")
    print("    $ chmod 644 ~/.ssh/id_rsa.pub")
    print(
        "Help 2: Login remote Linux/UNIX via ssh without type username & password."
    )
    print("    Copy generated *id_rsa.pub* to remote Linux/UNIX")
    print("    $ cat id_rsa.pub >> ~/.ssh/authorized_keys")
    print("    $ ssh-add ~/.ssh/id_rsa")
    print("Try again")


if __name__ == '__main__':
    help_msg()
