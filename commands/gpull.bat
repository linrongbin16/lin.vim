@ECHO OFF

SET cmdName=%0
SET argCount=0
FOR %%x IN (%*) DO SET /A argCount+=1

REM error: git comment is a must
IF %argCount% GTR 1 (
    CALL :helpmsg
    EXIT /B 1
)

REM error: not a git repository
IF ! git status 2 > NULL (
    ECHO error: git repository not exist
    CALL :helpmsg
    EXIT /B 1
)

SET branch=$(sh -c "git status | head -n 1 | awk '{print $3}'")

ECHO [lin-vim] git pull on '%branch%', path: '%PWD%'
git pull
git pull --tags

:helpmsg
ECHO Brief:
ECHO     git pull
ECHO Usage:
ECHO     %cmdName%
ECHO Try again
ECHO
EXIT /B 0
