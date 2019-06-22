import os
import subprocess


def IsAscii(s):
    return all(ord(c) < 128 for c in s)


def RunProc(*cmd):
    try:
        proc = subprocess.Popen(
            cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout_str = iter(proc.stdout.readline, b"")
        stderr_str = iter(proc.stderr.readline, b"")
    except subprocess.CalledProcessError:
        exit(1)
    outstr = [x.decode() for x in stdout_str if len(x) > 0]
    errstr = [x.decode() for x in stderr_str if len(x) > 0]
    return outstr, errstr


def ListDir(base_dir, target, depth):
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
    return dir_list


def GitRoot():
    root, _ = RunProc('git', 'rev-parse', '--show-toplevel')
    return root[0].strip() if (len(root) > 0) else None


def IncludeGit():
    groot = GitRoot()
    if groot is None:
        return []
    return ListDir(groot, 'include', 20)


def IncludeBrew():
    brew_home = '/usr/local/Cellar'
    return ListDir(brew_home, 'include', 2)


def MacOSHeader():
    header = []
    header.append('-I')
    header.append(
        '/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include')
    header.append('-I')
    header.append(
        '/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1'
    )
    for inc in IncludeBrew():
        header.append('-I')
        header.append(inc)
    for inc in IncludeGit():
        header.append('-I')
        header.append(inc)
    return header


def LinuxHeader():
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
    for version in os.listdir('/usr/include/c++'):
        header.append('-I')
        header.append('/usr/include/c++/%s' % (version))
    for inc in IncludeGit():
        header.append('-I')
        header.append(inc)
    return header


def WindowsHeader():
    header = list()
    # '-I',
    # 'C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community\\VC\\Tools\\MSVC\\14.14.26428\\include',
    for release in os.listdir(
            'C:\\Program Files (x86)\\Microsoft Visual Studio\\'):
        try:
            for version in os.listdir(
                    'C:\\Program Files (x86)\\Microsoft Visual Studio\\%s\\Community\\VC\\Tools\\MSVC\\'
                    % (release)):
                header.append('-I')
                header.append(
                    'C:\\Program Files (x86)\\Microsoft Visual Studio\\%s\\Community\\VC\\Tools\\MSVC\\%s\\include'
                    % (release, version))
        except Exception:
            pass
    # '-I',
    # 'C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.17134.0\\ucrt',
    for version in os.listdir(
            'C:\\Program Files (x86)\\Windows Kits\\10\\Include\\'):
        header.append('-I')
        header.append(
            'C:\\Program Files (x86)\\Windows Kits\\10\\Include\\%s\\ucrt' %
            (version))
    for inc in IncludeGit():
        header.append('-I')
        header.append(inc)
    return header


def UserHeader():
    header = list()
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
        if not IsAscii(cur):
            continue
        header.append('-I')
        header.append(cur)
        for path in os.listdir(cur):
            target = '%s/%s' % (cur, path)
            if ' ' in target:
                continue
            if not IsAscii(target):
                continue
            if path.startswith('.'):
                continue
            if not os.path.isdir(target):
                continue
            header.append('-I')
            header.append(target)
    for path in os.listdir('.'):
        if ' ' in path:
            continue
        if not IsAscii(path):
            continue
        if path.startswith('.'):
            continue
        if not os.path.isdir(path):
            continue
        header.append('-I')
        header.append(path)
    return header


if __name__ == '__main__':
    print('Include Brew: ' + str(IncludeBrew()))
    print('Include Git: ' + str(IncludeGit()))
    print('User Header: ' + str(UserHeader()))
    print('MacOS Header: ' + str(MacOSHeader()))
    print('Windows Header: ' + str(WindowsHeader()))
    print('Linux Header: ' + str(LinuxHeader()))
