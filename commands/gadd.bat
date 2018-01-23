@ECHO OFF

SET cmdName=%0
SET argCount=0
FOR %%x IN (%*) DO SET /A argCount+=1

REM error: git comment is a must
IF %argCount% LSS 1 (
    CALL :helpmsg
    EXIT /B 1
)

REM error: not a git repository
IF ! git status 2 > NULL (
    CALL :helpmsg
    EXIT /B 1
)

groot.bat
git add -A .

:helpmsg
ECHO Brief:
ECHO     count [text] of current directory recursively
ECHO Usage:
ECHO     %cmdName% [text]
ECHO Try again
ECHO.
EXIT /B 0
