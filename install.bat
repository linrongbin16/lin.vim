@echo off
echo "[lin-vim] installing Lin Rongbin's Vim Distribution"
echo ""

cd %HOMEPATH%\.vim
git pull origin master
cd install
win32.bat
