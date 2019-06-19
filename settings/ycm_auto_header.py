import os
import subprocess


def run_proc(*cmd):
    try:
        proc = subprocess.Popen(cmd,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        stdout_str = iter(proc.stdout.readline, b"")
        stderr_str = iter(proc.stderr.readline, b"")
    except subprocess.CalledProcessError:
        exit(1)
    outstr = [x.decode() for x in stdout_str if len(x) > 0]
    errstr = [x.decode() for x in stderr_str if len(x) > 0]
    return outstr, errstr


def list_dir(base_dir, target, depth):
    target_dir = os.path.join(os.getcwd(), base_dir)
    print('base_dir:' + base_dir + ', target_dir:' + target_dir)
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


def git_root():
    root, _ = run_proc('git', 'rev-parse', '--show-toplevel')
    return root[0].strip() if (len(root) > 0) else None


def brew_include():
    brew_home = '/usr/local/Cellar'
    return list_dir(brew_home, 'include', 2)


def git_include():
    groot = git_root()
    if groot is None:
        return []
    return list_dir(groot, 'include', 20)


print(brew_include())
print(git_include())
