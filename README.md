# lin.vim : Lin Rongbin's Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/) integrated tons of utilities for development running on most operating systems.

![pic1.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic1.png)

![pic2.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic2.png)

![pic6.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic6.png)

![pic4.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic4.png)

![pic5.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic5.png)

# Feature

- Multiple platform support: UNIX/Linux, Windows and MacOS.
- Code complete, lint and format running in [coc.nvim](https://github.com/neoclide/coc.nvim) language server for most programming languages.
- Random color schemes and icons.
- File and buffer explorer and better status line.
- Source code search and Fuzzy file search.
- Useful command line utilities support: git, code search, file operation, date/time calculate, ipv4/ipv6 calculate.
- Settings customization.

# User Guide

### Hot Key
- `F4` in normal mode: switch between C/C++ header source file.
- `F5` in normal mode: open/close nerdtree file explorer.
- `F6` in normal mode: open terminal.
- `F7` in normal mode: change color theme randomly.

### Enhanced Copy Paste
- `<leader>y` in visual mode: copy visual-selected text to locale machine cache.
- `<leader>p` in normal mode: paste text saved from local machine cache.

### Search Text
- `:Rg [string|pattern]` in normal mode: search [string|pattern].

### Search File
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

- `[g` in normal mode: go to previous diagnostic.
- `]g` in normal mode: go to next diagnostic.

- `<leader>bn` in normal mode: go to next buffer.
- `<leader>bp` in normal mode: go to previous buffer.
- `<leader>bd` in normal mode: close current buffer.

- `<c-o>` in normal mode: go back to previous position.

### Commentary
- `gcc` in normal mode: comment one line.
- `gc` in visual mode: comment visual selection.

### Customization
- custom your own settings in `~/.vim/user.vim` and `~/.vim/coc-settings.json`.

### Command Line Utility
- try `vcmd` to find more.

# Installation

Please manually install [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/releases) on UNIX/Linux/Mac, install **Hack Nerd Font Mono Windows Compatible** on Windows.

### Linux, UNIX, MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

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
9.  Install [ripgrep](https://github.com/BurntSushi/ripgrep/releases), add `rg.exe` to `%PATH%`.
10. Add `%USERPROFILE%\.vim\command` to `%PATH%`.


```bash
    $ git clone https://github.com/linrongbin16/lin.vim %USERPROFILE%\.vim
    $ cd %USERPROFILE%\.vim
    $ install.bat
```

### [coc.nvim extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

All extensions in one:
```
:CocInstall coc-json coc-clangd coc-cmake coc-python coc-highlight coc-css coc-cssmodules coc-emmet coc-html coc-xml coc-tsserver
```
