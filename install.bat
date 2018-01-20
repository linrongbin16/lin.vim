@ECHO OFF
ECHO [lin-vim] installing Lin Rongbin's Vim Distribution
ECHO.

git.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] Git Not Found
    EXIT /B
)
go.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] Golang Not Found
    EXIT /B
)
MSBuild.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] Visual Studio Not Found
    EXIT /B
)
node.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] NodeJs Not Found
    EXIT /B
)
clang.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] Clang Not Found
    EXIT /B
)
python.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] Python Not Found
    EXIT /B
)
cmake.exe /? 2 > NULL
IF %ERRORLEVEL%==9009 (
    ECHO [lin-vim] CMake Not Found
    EXIT /B
)

cd %HOMEPATH%\.vim
git pull origin master
cd install
win32.bat
