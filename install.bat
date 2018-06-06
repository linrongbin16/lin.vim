@ECHO OFF

cd %HOMEPATH%\.vim
git pull origin master
cd install
win32.bat
