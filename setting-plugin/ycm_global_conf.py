# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import platform
import os
import re
import subprocess

# Auto Header Extension Begin


def is_ascii_char(s):
    return all(ord(c) < 128 for c in s)


def run_process(*params):
    try:
        proc = subprocess.Popen(params,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        stdout_str = iter(proc.stdout.readline, b"")
        stderr_str = iter(proc.stderr.readline, b"")
    except subprocess.CalledProcessError:
        return None, None
    outstr = [x.decode() for x in stdout_str if len(x) > 0]
    errstr = [x.decode() for x in stderr_str if len(x) > 0]
    return outstr, errstr


def path_contain(path, part):
    for p in part:
        if p in path:
            return True
    return False


def list_directory(base_dir, depth):
    num_sep = base_dir.count(os.path.sep)
    dir_list = []
    for root, dirs, files in os.walk(base_dir):
        for d in dirs:
            fd = os.path.join(root, d)
            if d.startswith('.') or path_contain(fd, ['.git', '.svn', '.hg']):
                continue
            dir_list.append(fd)
        cur_num_sep = root.count(os.path.sep)
        if cur_num_sep >= num_sep + depth:
            del dirs[:]
    return [d.replace('\\', '/') for d in dir_list]


def git_header():
    try:
        root, _ = run_process('git', 'rev-parse', '--show-toplevel')
        groot = root[0].strip() if (len(root) > 0) else None
        return list_directory(groot, 3)
    except:
        return []


def homebrew_header():
    try:
        inc_list = []
        brew_list = list_directory('/usr/local/opt', 3)
        for inc in brew_list:
            c = inc + '/include'
            if os.path.exists(c):
                inc_list.append(c)
        return inc_list
    except:
        return []


def os_listdir_wrapper(d):
    try:
        return os.listdir(d)
    except:
        return []


def get_macos_header():
    header = []
    header.append('-I')
    header.append(
        '/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include')
    header.append('-I')
    header.append(
        '/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1'
    )
    header.append('-I')
    header.append(
        '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1'
    )
    for inc in homebrew_header():
        header.append('-I')
        header.append(inc)
    return header


def get_linux_header():
    header = []
    header.append('-I')
    header.append('/usr/include')
    header.append('-I')
    header.append('/usr/include/c++')
    header.append('-I')
    header.append('/usr/lib')
    header.append('-I')
    header.append('/usr/include/x86_64-linux-gnu')
    # '-I',
    # '/usr/include/c++/7',
    for version in os_listdir_wrapper('/usr/include/c++'):
        header.append('-I')
        header.append('/usr/include/c++/%s' % (version))
    return header


def get_windows_header():
    header = []
    # '-I',
    # 'C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community\\VC\\Tools\\MSVC\\14.14.26428\\include',
    for release in os_listdir_wrapper(
            'C:\\Program Files (x86)\\Microsoft Visual Studio\\'):
        for version in os_listdir_wrapper(
                'C:\\Program Files (x86)\\Microsoft Visual Studio\\%s\\Community\\VC\\Tools\\MSVC\\'
                % (release)):
            header.append('-I')
            header.append(
                'C:\\Program Files (x86)\\Microsoft Visual Studio\\%s\\Community\\VC\\Tools\\MSVC\\%s\\include'
                % (release, version))
            # '-I',
    # 'C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.17134.0\\ucrt',
    for version in os_listdir_wrapper(
            'C:\\Program Files (x86)\\Windows Kits\\10\\Include\\'):
        header.append('-I')
        header.append(
            'C:\\Program Files (x86)\\Windows Kits\\10\\Include\\%s\\ucrt' %
            (version))
        return header


def get_user_header():
    header = []
    rootpath = [
        '/', 'C:\\', 'D:\\', 'E:\\', 'F:\\', 'G:\\', 'H:\\', 'I:\\', 'J:\\',
        'K:\\', 'L:\\', 'M:\\', 'N:\\', 'O:\\', 'P:\\', 'Q:\\', 'R:\\', 'S:\\',
        'T:\\', 'U:\\', 'V:\\', 'W:\\', 'X:\\', 'Y:\\', 'Z:\\', 'A:\\', 'B:\\'
    ]
    cur = '.'
    header.append('-I')
    header.append(cur)
    for i in range(3):
        if os.path.abspath(cur) in rootpath:
            break
        cur = '%s%s' % (cur, '/..')
        if ' ' in cur:
            continue
        if not is_ascii_char(cur):
            continue
        header.append('-I')
        header.append(cur)
        for path in os_listdir_wrapper(cur):
            target = '%s/%s' % (cur, path)
            if ' ' in target:
                continue
            if not is_ascii_char(target):
                continue
            if path.startswith('.'):
                continue
            if not os.path.isdir(target):
                continue
            header.append('-I')
            header.append(target)
    for path in os_listdir_wrapper('.'):
        if ' ' in path:
            continue
        if not is_ascii_char(path):
            continue
        if path.startswith('.'):
            continue
        if not os.path.isdir(path):
            continue
        header.append('-I')
        header.append(path)
    for inc in git_header():
        header.append('-I')
        header.append(inc)
    return header


# Auto Header Extension End


def Settings(**kwargs):
    flags = [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-Wno-long-long',
        '-Wno-variadic-macros',
        '-fexceptions',
        '-DNDEBUG',
    ]
    if platform.system() == 'Windows':
        flags.extend(get_windows_header())
    elif platform.system() == 'Darwin':
        flags.extend(get_macos_header())
    else:
        flags.extend(get_linux_header())
    flags.extend(get_user_header())

    if platform.system() == 'Windows':
        flags.append('/std:c++14')
    else:
        flags.append('-std=c++14')
    return {'flags': flags}


if __name__ == '__main__':
    print(git_header())
    print(homebrew_header())
