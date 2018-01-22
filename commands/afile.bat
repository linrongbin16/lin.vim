@ECHO OFF

SET cmdName=${0##*/}
SET argCount=0
FOR %%x IN (%*) DO SET /A argCount+=1

REM # error 1: miss repository parameter
IF %argCount% LSS 1 (
    echo Brief
    echo     list files which contain [text] of current directory recursively
    echo Usage:
    echo     %cmdName% [text]
    echo Try again
    echo.
    EXIT /B 1
)

SET text=%*
SET ignore=%HOMEPATH%\.vim\commands\ag.ignore
ag -l --smart-case --depth -1 -p %ignore% %text% .
