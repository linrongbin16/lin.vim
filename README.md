# lin-vim : Lin Rongbin's Vim Distribution

lin-vim is a distribution of Vim.

It is highly configured [VIM](https://www.vim.org/) integrated tons of utilities for development running on most operating systems.

![pic1.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic1.png)

![pic2.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic2.png)

![pic6.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic6.png)

![pic4.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic4.png)

![pic5.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic5.png)

# Feature

- Multiple platform support: linux, unix, windows and mac.
- Auto format, async syntastics check, auto complete engine, syntax highlighting and other features for multiple programming languages.
- Random color schemes, file explorer and better UI.
- Text and file searching.
- Settings customization.

# User Guide

### Hot Key
- `F6` in normal mode: open/close nerdtree file explorer
- `F7` in normal mode: open terminal
- `F8` in normal mode: change color theme randomly

### Enhanced Copy Paste
- `<leader>y` in visual mode: copy visual-selected text to locale machine cache
- `<leader>p` in normal mode: paste text saved from local machine cache

### Search Text
- `:Ag [text]` in normal mode: search [text]

### Search File
- `<ctrl-p>` in normal mode: search file

### Easy Align
- `vipga=` in visual mode: align visual-selected paragraph
- `gaip=` in normal mode: align inner paragraph

### Move Cursor
- `<leader>s [char]`: search single char
- `<leader>w`: search word
- `<leader>j`: jump line forward
- `<leader>k`: jump line backward
- `<ctrl-j>`: move up 5 lines
- `<ctrl-k>`: move down 5 lines
- `<ctrl-h>`: move left 5 chars
- `<ctrl-l>`: move right 5 chars

### Auto Completion
- `<ctrl-]>`: go to definition
- `<ctrl-o>`: go back to previous position
- `<ctrl-n>` in insert mode: select next completion candidate
- `<ctrl-p>` in insert mode: select previous completion candidate
- `<leader>g` in normal mode: go to definition or declaration

### C/C++
- `:A`: jump between Header and Source files for C/C++

### Customization
- custom your own settings in ~/.vim/custom.vim

### Commands
- try `vimcmd` to find more.

# Installation

### Linux, UNIX, MacOS Installation

```bash
    $ git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

### Windows Installation

1.  Install [Git](https://git-scm.com/), enable `git.exe` and other UNIX/Linux commands from Windows Command Line.
3.  Install [Python3](https://www.python.org/downloads/), add `python3.exe` and `pip3.exe` to `%PATH%`, then `pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint chardet`.
4.  Install [CMake](https://cmake.org/), add `cmake.exe` to `%PATH%`.
5.  Install [Vim for Windows](https://github.com/vim/vim-win32-installer), add `gvim.exe` to `%PATH%`.
6.  Install [Visual Studio](https://www.visualstudio.com/) with:
    * .NET Desktop Development.
    * Visual C++ Desktop Development.
    * Common Windows Platform Development.
7.  Install [LLVM](http://releases.llvm.org/download.html), add `clangd.exe` and `clang-format.exe` to `%PATH%`.
9.  Install [ag](https://github.com/k-takata/the_silver_searcher-win32/releases), add `ag.exe` to `%PATH%`.
11. Install [Hack Font](https://sourcefoundry.org/hack/).
12. Add `%%USERPROFILE%%\.vim\commands` to `%PATH%`.


```bash
    $ git clone https://github.com/linrongbin16/lin-vim %USERPROFILE%\.vim
    $ cd %USERPROFILE%\.vim
    $ install.bat
```
