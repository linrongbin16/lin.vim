# lin-vim : Lin Rongbin's Vim Distribution

lin-vim is a distribution of Vim.

It is highly configured [VIM](https://www.vim.org/) integrated tons of utilities for development running on most operating systems.

![pic1.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic1.png)

![pic2.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic2.png)

![pic3.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic3.png)

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
- `:A`: jump between h/hpp and c/cc/cxx/cpp files

### Customization
- custom your own settings in ~/.vim/user.vim

# Installation

### Linux, UNIX, MacOS Installation

```bash
    $ git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

### Windows Installation

1.  Install [Git](https://git-scm.com/), choose **Use Git from Windows Command Prompt**.
2.  Install [7-zip](http://www.7-zip.org/).
3.  Install [Python3](https://www.python.org/downloads/), install globally with `pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint chardet`.
4.  Install [CMake](https://cmake.org/), choose **Add cmake.exe to PATH**.
5.  Install [Vim for Windows](https://tuxproject.de/projects/vim/), **Add gvim.exe to PATH**.
6.  Install [Visual Studio](https://www.visualstudio.com/), choose **VC++ for desktop**.
7.  Install [LLVM](http://releases.llvm.org/download.html), choose **Add LLVM to PATH**.
8.  Install [NodeJs](https://nodejs.org/), choose **Add node.exe to PATH**, install globally with `npm install -g --unsafe-perm js-beautify eslint tslint typescript-formatter`.
9.  Install [ag](https://github.com/k-takata/the_silver_searcher-win32/releases), **add ag.exe to PATH**.
10. Install [ctags](https://github.com/universal-ctags/ctags-win32/releases), **add ctags.exe readtags.exe to PATH**.
11. Install [Hack Font](https://sourcefoundry.org/hack/).
12. **Add %%USERPROFILE%%\.vim\commands to PATH**.


```bash
    $ git clone https://github.com/linrongbin16/lin-vim %USERPROFILE%\.vim
    $ cd %USERPROFILE%\.vim
    $ install.bat
```
