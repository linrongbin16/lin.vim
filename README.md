# lin-vim : Lin Rongbin's Vim Distribution

lin-vim is a distribution of Vim.

It is highly configured [VIM](https://www.vim.org/) integrated tons of utilities for development running on most operating systems.

![pic1.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/picture/pic1.png)

![pic2.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/picture/pic2.png)

![pic6.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/picture/pic6.png)

![pic4.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/picture/pic4.png)

![pic5.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/picture/pic5.png)

# Feature

- Multiple platform support: linux, unix, windows and mac.
- Auto format, async syntastics check, auto complete engine, syntax highlighting and other features for multiple programming languages.
- Random color schemes, file explorer and better UI.
- Text and file searching.
- Settings customization.

# User Guide

### Hot Key
- `F4` in normal mode: switch between C/C++ header source file
- `F5` in normal mode: open/close nerdtree file explorer
- `F6` in normal mode: open terminal
- `F7` in normal mode: change color theme randomly

### Enhanced Copy Paste
- `<leader>y` in visual mode: copy visual-selected text to locale machine cache
- `<leader>p` in normal mode: paste text saved from local machine cache

### Search Text
- `:Ag [text]` in normal mode: search [text]

### Search File
- `<c-p>` in normal mode: search files

### Easy Align
- `vipga=` in visual mode: align visual-selected paragraph
- `gaip=` in normal mode: align inner paragraph

### Move Cursor
- `<leader>s [char]`: search single char
- `<leader>w`: search word
- `<leader>j`: jump line forward
- `<leader>k`: jump line backward

### Go To

- `gd` in normal mode: go to definition
- `gy` in normal mode: go to type definition
- `gi` in normal mode: go to implementation
- `gr` in normal mode: go to reference

- `[g` in normal mode: go to previous diagnostic
- `]g` in normal mode: go to next diagnostic

- `<leader>bn` in normal mode: go to next buffer
- `<leader>bp` in normal mode: go to previous buffer
- `<leader>bd` in normal mode: close current buffer

### Commentary
- `gcc` in normal mode: comment one line
- `gc` in visual mode: comment visual selection

### Customization
- custom your own settings in ~/.vim/custom.vim

### Commands
- try `vcmd` to find more.

# Installation

### Linux, UNIX, MacOS Installation

```bash
    $ git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && ./install.sh
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
8.  Install [NodeJs](https://nodejs.org/), add `node.exe` and `npm.exe` to `%PATH%`.
9.  Install [ag](https://github.com/k-takata/the_silver_searcher-win32/releases), add `ag.exe` to `%PATH%`.
12. Install [Hack Font](https://sourcefoundry.org/hack/).
13. Add `%USERPROFILE%\.vim\command` to `%PATH%`.


```bash
    $ git clone https://github.com/linrongbin16/lin-vim %USERPROFILE%\.vim
    $ cd %USERPROFILE%\.vim
    $ install.bat
```

### Install [coc.nvim extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

All extensions in one:
```
:CocInstall coc-json coc-clangd coc-cmake coc-python coc-highlight coc-css coc-cssmodules coc-emmet coc-html coc-xml coc-tsserver
```
