:: Copyright 2018- <linrongbin16@gmail.com>

@echo off
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

SET VIM_HOME=%USERPROFILE%\.vim
SET APPDATA_LOCAL_HOME=%USERPROFILE%\AppData\Local
SET NVIM_HOME=%APPDATA_LOCAL_HOME%\nvim
SET TEMPLATE_HOME=%VIM_HOME%\template


:message
SETLOCAL
echo "[lin.vim] - %1"
ENDLOCAL

:installOrSkip
SETLOCAL
ENDLOCAL
