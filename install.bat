@ECHO OFF
ECHO [lin-vim] installing Lin Rongbin's Vim Distribution

cd %HOMEPATH%\.vim
git pull origin master
cd install
win32.bat
