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

from distutils.sysconfig import get_python_inc
import platform
import os
import ycm_core
import re

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
    # You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
    # source code needs it.
    '-DUSE_CLANG_COMPLETER',
    # THIS IS IMPORTANT! Without the '-x' flag, Clang won't know which language to
    # use when compiling headers. So it will guess. Badly. So C++ headers will be
    # compiled as C headers. You don't want that so ALWAYS specify the '-x' flag.
    # For a C project, you would set this to 'c' instead of 'c++'.
    '-x',
    'c++',
    '-isystem',
    '../BoostParts',
    '-isystem',
    get_python_inc(),
    '-isystem',
    '../llvm/include',
    '-isystem',
    '../llvm/tools/clang/include',
    '-I',
    '.',
    '-I',
    './ClangCompleter',
    '-isystem',
    './tests/gmock/gtest',
    '-isystem',
    './tests/gmock/gtest/include',
    '-isystem',
    './tests/gmock',
    '-isystem',
    './tests/gmock/include',
    '-isystem',
    './benchmarks/benchmark/include',
]

# Auto Header Extension Begin

import os
import subprocess


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


def list_directory(base_dir, target, depth):
    target_dir = os.path.join(os.getcwd(), base_dir)
    num_sep = target_dir.count(os.path.sep)
    dir_list = []
    for root, dirs, files in os.walk(target_dir):
        files[:] = [f for f in files if not f[0] == '.']
        dirs[:] = [d for d in dirs if not d[0] == '.']
        for d in dirs:
            fd = os.path.join(root, d)
            if fd.count(target) == 1 and fd[-len(target):] == target:
                dir_list.append(os.path.join(root, d))
        cur_num_sep = root.count(os.path.sep)
        if cur_num_sep >= num_sep + depth:
            del dirs[:]
    return [d.replace('/', '\\') for d in dir_list]


def git_header():
    try:
        root, _ = run_process('git', 'rev-parse', '--show-toplevel')
        groot = root[0].strip() if (len(root) > 0) else None
        return list_directory(groot, 'include', 20)
    except:
        return []


def homebrew_header():
    try:
        header = '/usr/local/Cellar'
        return list_directory(header, 'include', 2)
    except:
        return []


def os_listdir_wrapper(d):
    try:
        return os.listdir(d)
    except:
        return []


def macos_header():
    header = []
    header.append('-I')
    header.append(
        '/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include')
    header.append('-I')
    header.append(
        '/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1'
    )
    for inc in homebrew_header():
        header.append('-I')
        header.append(inc)
    for inc in git_header():
        header.append('-I')
        header.append(inc)
    return header


def linux_header():
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
    for inc in git_header():
        header.append('-I')
        header.append(inc)
    return header


def windows_header():
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
    for inc in git_header():
        header.append('-I')
        header.append(inc)
    return []


def user_header():
    header = []
    rootpath = [
        '/', 'C:\\', 'D:\\', 'E:\\', 'F:\\', 'G:\\', 'H:\\', 'I:\\', 'G:\\',
        'K:\\', 'L:\\', 'M:\\', 'N:\\', 'O:\\', 'P:\\', 'Q:\\', 'R:\\', 'S:\\',
        'T:\\', 'U:\\', 'V:\\', 'W:\\', 'X:\\', 'Y:\\', 'Z:\\', 'A:\\', 'B:\\'
    ]
    cur = '.'
    header.append('-I')
    header.append(cur)
    for i in range(10):
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
    return header


# Auto Header Extension End

if platform.system() == 'Windows':
    flags.extend(windows_header())
elif platform.system() == 'Darwin':
    flags.extend(macos_header())
else:
    flags.extend(linux_header())
flags.extend(user_header())

# Clang automatically sets the '-std=' flag to 'c++14' for MSVC 2015 or later,
# which is required for compiling the standard library, and to 'c++11' for older
# versions.
if platform.system() != 'Windows':
    flags.append('-std=c++11')

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists(compilation_database_folder):
    database = ycm_core.CompilationDatabase(compilation_database_folder)
else:
    database = None

SOURCE_EXTENSIONS = ['.cpp', '.cxx', '.cc', '.c', '.m', '.mm']


def DirectoryOfThisScript():
    return os.path.dirname(os.path.abspath(__file__))


def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in ['.h', '.hxx', '.hpp', '.hh']


def GetCompilationInfoForFile(filename):
    # The compilation_commands.json file generated by CMake does not have entries
    # for header files. So we do our best by asking the db for flags for a
    # corresponding source file, if any. If one exists, the flags for that file
    # should be good enough.
    if IsHeaderFile(filename):
        basename = os.path.splitext(filename)[0]
        for extension in SOURCE_EXTENSIONS:
            replacement_file = basename + extension
            if os.path.exists(replacement_file):
                compilation_info = database.GetCompilationInfoForFile(
                    replacement_file)
                if compilation_info.compiler_flags_:
                    return compilation_info
        return None
    return database.GetCompilationInfoForFile(filename)


def FlagsForFile(filename, **kwargs):
    if not database:
        return {
            'flags': flags,
            'include_paths_relative_to_dir': DirectoryOfThisScript()
        }

        compilation_info = GetCompilationInfoForFile(filename)
    if not compilation_info:
        return None

    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object.
    final_flags = list(compilation_info.compiler_flags_)

    # NOTE: This is just for YouCompleteMe; it's highly likely that your project
    # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
    # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
    # try:
    # final_flags.remove( '-stdlib=libc++' )
    # except ValueError:
    # pass

    return {
        'flags': final_flags,
        'include_paths_relative_to_dir': compilation_info.compiler_working_dir_
    }
