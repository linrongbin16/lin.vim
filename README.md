# lin.vim : Lin Rongbin's Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development running on most operating systems.

![pic1.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic1.jpg)

![pic2.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic2.jpg)

![pic3.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic3.jpg)

![pic4.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic4.jpg)

# Feature

- Support both Vim and Neovim.
- Multiple platform support: UNIX/Linux, Windows and MacOS.
- Code complete, lint and format running in [coc.nvim](https://github.com/neoclide/coc.nvim) language server for most programming languages.
- Random color schemes and icons.
- File and buffer explorer and better status line.
- Source code search and Fuzzy file search.
- Useful command line utilities support: git, code search, file operation, date/time calculate, ipv4/ipv6 calculate.
- Settings customization.

# User Guide

### Hot Key
- `F2` in normal mode: open/close terminal.
- `F3` in normal mode: change color theme randomly.
- `F4` in normal mode: switch between C/C++ header source file.
- `F5` in normal mode: open/close file explorer.

### Enhanced Copy Paste
- `<leader>y` in visual mode: copy visual-selected text to locale machine cache.
- `<leader>p` in normal mode: paste text saved from local machine cache.

### Search
- `:Ag [text]` or `:Rg [text]` in normal mode: search [text].
- `<c-p>` in normal mode: fuzzy search file.

### Easy Align
- `vipga=` in visual mode: align visual-selected paragraph.
- `gaip=` in normal mode: align inner paragraph.

### Go To
- `<leader>s [char]`: go to [char].
- `<leader>w`: go to [word].
- `<leader>j`: go to [forward line].
- `<leader>k`: go to [backward line].

- `gd` in normal mode: go to definition.
- `gy` in normal mode: go to type definition.
- `gi` in normal mode: go to implementation.
- `gr` in normal mode: go to reference.
- `<c-]>` in normal mode: go to definition if `gd` not working.

- `[g` in normal mode: go to previous diagnostic.
- `]g` in normal mode: go to next diagnostic.

- `<c-o>` in normal mode: go back to previous position.

### Commentary
- `gcc` in normal mode: comment one line.
- `gc` in visual mode: comment visual selection.

### File Explorer
- `ma` in normal mode: create new file/directory.
- `mc` in normal mode: copy file/directory.
- `md` in normal mode: delete file/directory.
- `mm` in normal mode: move file/directory.

- `<leader>bn` in normal mode: go to next buffer.
- `<leader>bp` in normal mode: go to previous buffer.
- `<leader>bd` in normal mode: close current buffer.

### Customization
- custom your own settings in `~/.vim/user.vim` and `~/.vim/coc-settings.json`.

### Command Line Utility
- try `vcmd` to find more.

# Installation

Please manually install [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/releases) on UNIX/Linux/Mac, install [Hack Nerd Font Mono Windows Compatible](https://github.com/ryanoasis/nerd-fonts/releases) on Windows.

### Linux, UNIX, MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

1.  Install [Git](https://git-scm.com/), enable `git.exe` and other UNIX/Linux commands from Windows Command Line (UNIX/Linux commands such as `cp` `mv` `rm` are enabled in Windows CMD after this step).
3.  Install [Python3](https://www.python.org/downloads/), add `python3.exe` and `pip3.exe` to `%PATH%`.
4.  Install [CMake](https://cmake.org/), add `cmake.exe` to `%PATH%`.
5.  Install [Vim for Windows](https://github.com/vim/vim-win32-installer), add `gvim.exe` to `%PATH%`.
6.  Install [Visual Studio](https://www.visualstudio.com/) with:
    * .NET Desktop Development.
    * Visual C++ Desktop Development.
    * Common Windows Platform Development.
7.  Install [LLVM](http://releases.llvm.org/download.html), add `clangd.exe` and `clang-format.exe` to `%PATH%`.
8.  Install [NodeJs](https://nodejs.org/), add `node.exe` and `npm.exe` to `%PATH%`.
9.  Install [the_silver_searcher](https://github.com/k-takata/the_silver_searcher-win32/releases), add `ag.exe` to `%PATH%`.
10. Install [ripgrep](https://github.com/BurntSushi/ripgrep/releases), add `rg.exe` to `%PATH%`.
11. Install [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases), add `ctags.exe` to `%PATH%`.
12. Add `%USERPROFILE%\.vim\command` to `%PATH%`.


```bash
    $ git clone https://github.com/linrongbin16/lin.vim %USERPROFILE%\.vim
    $ cd %USERPROFILE%\.vim
    $ install.bat
```
