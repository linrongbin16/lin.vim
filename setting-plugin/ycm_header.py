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

if __name__ == '__main__':
    print('\n\n user header:')
    print(user_header())
    print('\n\n macos header:')
    print(macos_header())
    print('\n\n linux header:')
    print(linux_header())
    print('\n\n windows header:')
    print(windows_header())
