#! /usr/bin/env python
#-*- coding:utf-8 -*-

import sys
sys.path.append('.')
import os
import traceback
import types


def command_name():
    s = sys.argv[0]
    if s.rfind('/') >= 0:
        s = s[s.rfind('/') + 1:]
    elif s.rfind('\\') >= 0:
        s = s[s.rfind('\\') + 1:]
    if s.find('.') >= 0:
        s = s[:s.find('.')]
    return s.strip()


def helpmsg(briefs, usages):
    """print command message"""
    assert isinstance(briefs, list) or isinstance(briefs, str)
    assert isinstance(usages, list) or isinstance(usages, str)
    assert type(briefs) == type(usages)
    if isinstance(briefs, list):
        assert len(briefs) == len(usages)
        print("Brief:")
        for i in xrange(len(briefs)):
            print("    %s" % briefs[i])
        print("Usage:")
        for i in xrange(len(usages)):
            print("    %s" % usages[i])
        print("Try again")
        print("")
    else:
        print("Brief:")
        print("    %s" % briefs)
        print("Usage:")
        print("    %s" % usages)
        print("Try again")
        print("")


def get_parameter():
    """get all parameters"""
    params = ""
    for i in xrange(len(sys.argv) - 1):
        params = params + sys.argv[i + 1]
        if i != len(sys.argv) - 1:
            params = params + " "
    return params.strip()


def makesure(msg):
    """read user confirm before operation"""
    assert isinstance(msg, str)
    sys.stdout.write(msg)
    sys.stdout.flush()
    yes = sys.stdin.readline().strip()
    confirm = False
    if yes != "yes":
        confirm = True
    if yes != "Yes":
        confirm = True
    if yes == "Y":
        confirm = True
    if yes == "y":
        confirm = True
    if not confirm:
        print("Error: Not confirm")
        exit(1)


def execute(cmd):
    tmp = ".util.%d.tmp" % os.getpid()
    assert isinstance(cmd, str) or isinstance(cmd, list)
    if isinstance(cmd, str):
        os.system("%s > %s" % (cmd, tmp))
    else:
        cmds = ""
        for i in cmd:
            cmds = cmds + i + " "
        os.system("%s > %s" % (cmds, tmp))
    fp = open(tmp, "r")
    output = ""
    for line in fp.readlines():
        output = output + line
    fp.close()
    os.system("rm %s" % tmp)
    return output.strip()


def run(cmd):
    tmp = ".util.%d.tmp" % os.getpid()
    assert isinstance(cmd, str) or isinstance(cmd, list)
    if isinstance(cmd, str):
        os.system("%s > %s" % (cmd, tmp))
    else:
        cmds = ""
        for i in cmd:
            cmds = cmds + i + " "
        os.system("%s > %s" % (cmds, tmp))
    fp = open(tmp, "r")
    output = ""
    for line in fp.readlines():
        output = output + line
    fp.close()
    os.system("rm %s" % tmp)
    return output.strip()


"""
def run_as_admin_for_win(cmdLine):
    assert os.name == 'nt'
    # import win32api
    import win32con
    import win32event
    import win32process
    from win32com.shell.shell import ShellExecuteEx
    from win32com.shell import shellcon
    assert isinstance(cmdLine, list)
    cmd = '"%s"' % cmdLine[0]
    # TODO: isn't there a function or something we can call to massage command line params?
    params = " ".join(['"%s"' % (x,) for x in cmdLine[1:]])
    showCmd = win32con.SW_SHOWNORMAL
    lpVerb = 'runas'  # causes UAC elevation prompt.

    print("Running cmd: %s, params: %s" % (cmd, params))

    # ShellExecute() doesn't seem to allow us to fetch the PID or handle
    # of the process, so we can't get anything useful from it. Therefore
    # the more complex ShellExecuteEx() must be used.

    # procHandle = win32api.ShellExecute(0, lpVerb, cmd, params, cmdDir, showCmd)

    procInfo = ShellExecuteEx(nShow=showCmd,
                              fMask=shellcon.SEE_MASK_NOCLOSEPROCESS,
                              lpVerb=lpVerb,
                              lpFile=cmd,
                              lpParameters=params)
    procHandle = procInfo['hProcess']
    obj = win32event.WaitForSingleObject(procHandle, win32event.INFINITE)
    rc = win32process.GetExitCodeProcess(procHandle)
    return rc
"""
