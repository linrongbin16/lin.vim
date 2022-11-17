@REM @echo off

set VIM_HOME=%USERPROFILE%\.vim
set APPDATA_LOCAL_HOME=%USERPROFILE%\AppData\Local
set NVIM_HOME=%APPDATA_LOCAL_HOME%\nvim
set INSTALL_HOME=%VIM_HOME%\installers

set MODE_NAME=full
set OPT_BASIC=0
set OPT_DISABLE_VIM=0
set OPT_DISABLE_NEOVIM=0

set INFO=[lin.vim] -
set ERROR=[lin.vim] - error!
set DEBUG=[lin.vim] - debug:

for %%a in (%*) do (
    if "%%~a" == "-h" (
        cat %INSTALL_HOME%\help.txt
        goto :eof
    )
    if "%%~a" == "--help" (
        cat %INSTALL_HOME%\help.txt
        goto :eof
    )
    if "%%~a" == "-b" (
        set MODE_NAME=basic
        set OPT_BASIC=1
    )
    if "%%~a" == "--basic" (
        set MODE_NAME=basic
        set OPT_BASIC=1
    )
    if "%%~a" == "-l" (
        set MODE_NAME=limit
    )
    if "%%~a" == "--limit" (
        set MODE_NAME=limit
    )
    if "%%~a" == "--disable-vim" (
        set OPT_DISABLE_VIM=1
    )
    if "%%~a" == "--disable-neovim" (
        set OPT_DISABLE_NEOVIM=1
    )
)

echo %INFO% install with %MODE_NAME% mode

if %OPT_BASIC% NEQ 0 (
    goto :install_basic
) else (
    goto :install_full
)

:install_basic
SETLOCAL
set basic_file=%USERPROFILE%\.vim\standalone\basic.vim
echo %DEBUG% OPT_DISABLE_VIM: %OPT_DISABLE_VIM%
if %OPT_DISABLE_VIM% NEQ 1 (
    echo %INFO% install %USERPROFILE%\_vimrc for vim
    if exist %USERPROFILE%\_vimrc (
        echo %INFO% backup '%USERPROFILE%\_vimrc' to '%USERPROFILE%\_vimrc.%date:/=-%.%time::=-%'
        mv %USERPROFILE%\_vimrc %USERPROFILE%\_vimrc.%date:/=-%.%time::=-%
    )
    cmd /c mklink %USERPROFILE%\_vimrc %basic_file%
)
if %OPT_DISABLE_NEOVIM% NEQ 1 (
    echo %INFO% install %USERPROFILE%\.config\nvim\init.vim for neovim
    if exist %NVIM_HOME%\init.vim (
        echo %INFO% backup '%NVIM_HOME%\init.vim' to '%NVIM_HOME%\init.vim.%date:/=-%.%time::=-%'
        mv %NVIM_HOME%\init.vim %NVIM_HOME%\init.vim.%date:/=-%.%time::=-%
    )
    if exist %NVIM_HOME% (
        echo %INFO% backup '%NVIM_HOME%' to '%NVIM_HOME%.%date:/=-%.%time::=-%'
        mv %NVIM_HOME% %NVIM_HOME%.%date:/=-%.%time::=-%
    )
    cmd /c mklink /D %NVIM_HOME% %VIM_HOME%
    cmd /c mklink %NVIM_HOME%\init.vim %basic_file%
)
ENDLOCAL
goto :done_message

:install_full
SETLOCAL
@REM dependency
echo %INFO% install modern rust commands with cargo
where rg > nul 2> nul
if %ERRORLEVEL% NEQ 0 (
    cargo install ripgrep
) else (
    echo %INFO% 'rg' already exist, skip...
)
where fd > nul 2> nul
if %ERRORLEVEL% NEQ 0 (
    cargo install fd-find
) else (
    echo %INFO% 'fd' already exist, skip...
)
where bat > nul 2> nul
if %ERRORLEVEL% NEQ 0 (
    cargo install --locked bat
) else (
    echo %INFO% 'bat' already exist, skip...
)

echo %INFO% install python packages with pip3
cmd /c pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click

echo %INFO% install node packages with npm
cmd /c npm install -g yarn prettier neovim

@REM configs
echo %INFO% install configs
python3 %VIM_HOME%\generator.py "%*"
if %ERRORLEVEL% NEQ 0 (
    goto :eof
)
if %OPT_DISABLE_VIM% NEQ 1 (
    cmd /c gvim -E -c "PlugInstall" -c "qall" /wait
)
if %OPT_DISABLE_NEOVIM% NEQ 1 (
    cmd /c nvim -E -c "PlugInstall" -c "qall" /wait
)
ENDLOCAL
goto :done_message

:done_message
SETLOCAL
echo %INFO% install with %MODE_NAME% mode - done
ENDLOCAL
goto :eof
