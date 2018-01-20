@echo off

set cmdName=${0##*/}
set argCount=0
for %%x in (%*) do set /A argCount+=1

rem # error 1: miss repository parameter
if %argCount% LSS 1 (
    echo Brief
    echo     list files which contain [text] of current directory recursively
    echo Usage:
    echo     %cmdName% [text]
    echo Try again
    echo.
    exit /B 1
)

set text=%*
set ignore=%HOMEPATH%\.vim\commands\ag.ignore
ag -l --smart-case --depth -1 -p $ignore %text% .
