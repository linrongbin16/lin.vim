#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    update '.gitignore'"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}

if [[ $# -gt 1 ]]; then
    helpmsg
    exit 1
fi

# error: repository not exist
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

branch=$(git status | head -n 1 | awk '{print $3}')
git pull origin $branch

while [[ ! -d ".git" ]]; do
    cd ..
done

echo "[lin-vim] update $PWD/.gitignore"
touch .gitignore
echo "" >> .gitignore

# project files
echo "*.idea" >> .gitignore
echo ".idea" >> .gitignore
echo "*.iml" >> .gitignore
echo "cmake-build-debug" >> .gitignore
echo "*.svn" >> .gitignore
echo ".svn" >> .gitignore
echo "tags" >> .gitignore
echo "cscope.out" >> .gitignore
echo "cscope.in.out" >> .gitignore
echo "cscope.po.out" >> .gitignore
echo "cscope.files" >> .gitignore
echo "ncscope.out" >> .gitignore
echo ".ycm_extra_conf.py" >> .gitignore
echo "__pycache__" >> .gitignore
echo "*.pyc" >> .gitignore
echo "CMakeCache.txt" >> .gitignore
echo "CMakeFiles" >> .gitignore
echo "cmake_install.cmake" >> .gitignore
echo "install_manifest.txt" >> .gitignore
echo ".vscode" >> .gitignore
echo "*.vscode" >> .gitignore
echo "*.vsproj" >> .gitignore

# macos files
echo ".DS_Store" >> .gitignore
echo "*/.DS_Store" >> .gitignore

# bin files
echo "*.slo" >> .gitignore
echo "*.lo" >> .gitignore
echo "*.o" >> .gitignore
echo "*.obj" >> .gitignore
echo "*.pro.user" >> .gitignore
echo "*.so" >> .gitignore
echo "*.so.*" >> .gitignore
echo "*.dylib" >> .gitignore
echo "*.dylib.*" >> .gitignore
echo "*.dll" >> .gitignore
echo "*.dll.*" >> .gitignore
echo "*.swp" >> .gitignore
echo "*.lai" >> .gitignore
echo "*.la" >> .gitignore
echo "*.a" >> .gitignore
echo "*.a.*" >> .gitignore
echo "*.lib" >> .gitignore
echo "*.lib.*" >> .gitignore
echo "*.rdb" >> .gitignore
echo "*.exe" >> .gitignore
echo "*.out" >> .gitignore
echo "*.app" >> .gitignore
echo "*.xcuserdata" >> .gitignore

# java bin
echo "*.jar" >> .gitignore
echo "*.class" >> .gitignore
echo "*.gradle" >> .gitignore
echo ".gradle" >> .gitignore
echo "*.m2" >> .gitignore
echo ".m2" >> .gitignore
echo "MANIFEST.MF" >> .gitignore
echo "Manifest.mf" >> .gitignore
echo "manifest.mf" >> .gitignore

# log files
echo "*.log" >> .gitignore