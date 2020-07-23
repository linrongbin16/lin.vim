# lin.vim : Lin Rongbin's (Neo)Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development running on most operating systems.

![pic1.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic1.jpg)

![pic2.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic2.jpg)

![pic3.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic3.jpg)

![pic4.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic4.jpg)

# Feature

- Running on multiple platforms: UNIX/Linux, Windows and MacOS.
- Code complete, lint and format for most programming languages by [coc.nvim](https://github.com/neoclide/coc.nvim).
- Random color schemes and pretty icons.
- File and buffer explorer and better status line.
- Source code and file fuzzy search.
- Useful command line utilities for: git, text search, file operation, datetime calculate, ip calculate.
- Support both [VIM](https://www.vim.org/) and [Neovim](https://neovim.io/).
- Customization.

# User Guide

### Hot Key
- `F2` in normal mode: open/close terminal.
- `F3` in normal mode: change color theme randomly.
- `F4` in normal mode: switch between C/C++ header source file.
- `F5` in normal mode: open/close file explorer.
- `F6` in normal mode: open/close tagbar explorer.

### Enhanced Copy Paste
- `<leader>y` in visual mode: copy visual-selected text to locale machine cache.
- `<leader>p` in normal mode: paste text saved from local machine cache.

### Search
- `:Ag [text]` or `:Rg [text]` in normal mode: search [text].
- `<c-p>` in normal mode: fuzzy search file.

### Easy Align
- `vipga=` in visual mode: align visual-selected paragraph.
- `gaip=` in normal mode: align inner paragraph.

### Easy Move
- `<leader>s [char]`: go to [char].
- `<leader>w`: go to [word].
- `<leader>j`: go to [forward line].
- `<leader>k`: go to [backward line].

### Coc.nvim Go To
- `gd` in normal mode: go to definition.
- `gy` in normal mode: go to type definition.
- `gi` in normal mode: go to implementation.
- `gr` in normal mode: go to reference.
- `[g` in normal mode: go to previous diagnostic.
- `]g` in normal mode: go to next diagnostic.

### Tags Go To
- `<c-o>` in normal mode: go back to previous position.
- `<c-]>` in normal mode: go to definition if `gd` not working.

### Commentary
- `gcc` in normal mode: comment one line.
- `gc` in visual mode: comment visual selection.

### File Explorer
- `ma` in normal mode: create new file/directory.
- `mc` in normal mode: copy file/directory.
- `md` in normal mode: delete file/directory.
- `mm` in normal mode: move file/directory.

### Buffer Explorer
- `<leader>bn` in normal mode: go to next buffer.
- `<leader>bp` in normal mode: go to previous buffer.
- `<leader>bd` in normal mode: close current buffer.

### Customization
- custom your own settings in `~/.vim/user.vim` and `~/.vim/coc-settings.json`.

### Command Line Utility
- try `vcmd` to find more.

# Installation

### Linux, UNIX, MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

1.  Install [Git](https://git-scm.com/), with options below, `git` and other UNIX/Linux commands such as `cp` `mv` `rm` are enabled in Windows CMD after this step.
    * Use Git and optional Unix tools from the Command Prompt.
    * Use Windows' default console window.
3.  Install [Python3](https://www.python.org/downloads/), add `python3.exe` and `pip3.exe` to `%PATH%`.
4.  Install [CMake](https://cmake.org/), add `cmake.exe` to `%PATH%`.
5.  Install [Vim for Windows](https://github.com/vim/vim-win32-installer), add `gvim.exe` to `%PATH%`. If you want Neovim, install [Neovim-Qt](https://github.com/neovim/neovim/wiki/Installing-Neovim) additionally, add `nvim.exe` and `nvim-qt.exe` to `%PATH%`.
6.  Install [Visual Studio](https://www.visualstudio.com/) with:
    * .NET Desktop Development.
    * Visual C++ Desktop Development.
    * Common Windows Platform Development.
7.  Install [LLVM](http://releases.llvm.org/download.html), add `clangd.exe` and `clang-format.exe` to `%PATH%`.
8.  Install [NodeJs](https://nodejs.org/), add `node.exe` and `npm.exe` to `%PATH%`.
9.  Install [the_silver_searcher](https://github.com/k-takata/the_silver_searcher-win32/releases), add `ag.exe` to `%PATH%`.
10. Install [ripgrep](https://github.com/BurntSushi/ripgrep/releases), add `rg.exe` to `%PATH%`.
11. Install [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases), add `ctags.exe` to `%PATH%`.
12. Install [Hack Nerd Font Mono Windows Compatible](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack).
13. Add `%USERPROFILE%\.vim\command` to `%PATH%`.


```bash
    $ git clone https://github.com/linrongbin16/lin.vim %USERPROFILE%\.vim
    $ cd %USERPROFILE%\.vim
    $ install.bat
```

### GUI fonts

By default lin.vim use [Hack Nerd Font Complete Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) on UNIX/Linux, use [Hack Nerd Font Complete Mono Windows Compatible](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) on Windows.
Please manually install other [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) and configure font settings in `~/.vim/user.vim` if you want to customize GUI fonts.

### Vim vs Neovim

Both Vim and Neovim are supported. While by default, we only support `vim`, `gvim` and `nvim`. Please install other Neovim GUI clients manually if you need.

### Installation Failure Notification

lin.vim installation needs [github.com](https://github.com/) and [raw.githubusercontent.com](https://raw.githubusercontent.com/), for some reasons the downloading could fail. Please make sure network is available before installation.
