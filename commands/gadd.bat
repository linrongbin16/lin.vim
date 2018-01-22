@ECHO OFF

set cmdName=%0
set argCount=0
for %%x in (%*) do set /A argCount+=1

# error 1: git comment is a must
if [ $# -gt 1 ]; then
    helpmsg
    exit 1
fi

# error 2: not a git repository
IF ! git status 2 > NULL; then
    ECHO error: git repository not exist
    ECHO Brief:
    ECHO     git add
    ECHO Usage:
    ECHO     %cmdName%
    ECHO Try again
    ECHO.
    EXIT /B

groot
git add -A .
