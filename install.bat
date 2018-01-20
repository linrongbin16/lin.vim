@ECHO OFF
ECHO [lin-vim] installing Lin Rongbin's Vim Distribution
ECHO.

cd %HOMEPATH%\.vim
git pull origin master
cd install
win32.bat
