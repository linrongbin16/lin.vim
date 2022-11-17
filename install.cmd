@REM @echo off

set VIM_HOME = "%USERPROFILE%\.vim"
set APPDATA_LOCAL_HOME = "%USERPROFILE%\AppData\Local"
set NVIM_HOME = "%APPDATA_LOCAL_HOME%\nvim"
set INSTALL_HOME = "%VIM_HOME%\install"

set MODE_NAME="full"
set OPT_BASIC=0
set OPT_DISABLE_VIM=0
set OPT_DISABLE_NEOVIM=0

set INFO="[lin.vim] -"
set ERROR="[lin.vim] - error!"

for %%a in (%*) do (
    if "%%~a" == "-h" (
        cat %USERPROFILE%\.vim\install\help.txt
        goto :eof
    )
    if "%%~a" == "--help" (
        cat %USERPROFILE%\.vim\install\help.txt
        goto :eof
    )
    if "%%~a" == "-b" (
        set MODE_NAME="basic"
    )
    if "%%~a" == "--basic" (
        set MODE_NAME="basic"
    )
    if "%%~a" == "-l" (
        set MODE_NAME="limit"
    )
    if "%%~a" == "--limit" (
        set MODE_NAME="limit"
    )
    if "%%~a" == "--disable-vim" (
        set OPT_DISABLE_VIM=1
    )
    if "%%~a" == "--disable-neovim" (
        set OPT_DISABLE_NEOVIM=1
    )
)

echo "%INFO% install with %MODE_NAME% mode"

if %OPT_BASIC% NEQ 0 (
    goto :install_basic
) else (
    goto :install_full
)


:install_basic
SETLOCAL
set basic_file="%USERPROFILE%\.vim\standalone\basic.vim"
if %OPT_DISABLE_VIM% NEQ 1 (
    echo "%INFO% install ~/.vimrc for vim"
    set src="%USERPROFILE%\.vimrc"
    if exist %src% (
        set dest="%src%.%date:/=-%.%time::=-%"
        echo "%INFO% backup '%src%' to '%dest%'"
        mv %src% %desc%
    )
    cmd /c mklink %src% %basic_file%
)
if %OPT_DISABLE_NEOVIM% NEQ 1 (
    echo "%INFO% install ~/.config/nvim/init.vim for neovim"
    set src="%NVIM_HOME%\.init.vim"
    if exist %src% (
        set dest="%src%.%date:/=-%.%time::=-%"
        echo "%INFO% backup '%src%' to '%dest%'"
        mv %src% %desc%
    )
    set src=%NVIM_HOME%
    if exist %src% (
        set dest="%src%.%date:/=-%.%time::=-%"
        echo "%INFO% backup '%src%' to '%dest%'"
        mv %src% %desc%
    )
    cmd /c mklink %NVIM_HOME% %VIM_HOME%
    cmd /c mklink "%NVIM_HOME%\init.vim" %basic_file%
)
echo "%INFO% install with %MODE_NAME% mode - done"
ENDLOCAL
goto :eof

:install_full
SETLOCAL
@REM dependency
echo "%INFO% install modern rust commands with cargo"
where rg > nul 2> nul
if %ERRORLEVEL% NEQ 0 (
    cargo install ripgrep
)
where fd > nul 2> nul
if %ERRORLEVEL% NEQ 0 (
    cargo install fd-find
)
where bat > nul 2> nul
if %ERRORLEVEL% NEQ 0 (
    cargo install --locked bat
)

echo "%INFO% install python packages with pip3"
sudo pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click

echo "%INFO% install node packages with npm"
npm install -g yarn prettier neovim

@REM configs
echo "%INFO% install configs"
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
echo "%INFO% install with %MODE_NAME% mode - done"
ENDLOCAL
goto :eof
