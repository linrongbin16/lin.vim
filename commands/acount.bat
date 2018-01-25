@ECHO OFF

SET cmdName=%0
SET argCount=0
FOR %%x IN (%*) DO SET /A argCount+=1

REM error 1: miss repository parameter
if %argCount% LSS 1 (
    ECHO Brief:
    ECHO     count [text] of current directory recursively
    ECHO Usage:
    ECHO     %cmdName% [text]
    ECHO Try again
    ECHO.
    EXIT /B 1
)

SET text=%*
SET ignore=%HOMEPATH%\.vim\commands\ag.ignore

ag -c --smart-case --depth -1 -p %ignore% %text% .
