# lin.vim : Lin Rongbin's (Neo)Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development running on most operating systems.

# Table of Contents

- [Introduction](#introduction)
  - [Screenshots](#screenshots)
  - [Feature](#feature)
  - [Project Structure](#project-structure)
- [Installation](#installation)
  - [UNIX, Linux, MacOS](#unix-linux-macos)
  - [Windows](#windows)
  - [Limitation](#limitation)
    - [Third Party Dependencies](#third-party-dependencies)
    - [Tested Platforms](#tested-platforms)
- [User Guide](#user-guide)
  - [Hot Key](#hot-key)
  - [Enhanced Copy Paste](#enhanced-copy-paste)
  - [Text Search](#text-search)
  - [File Search](#file-search)
  - [Alignment](#alignment)
  - [Cursor Movement](#cursor-movement)
  - [Language Server](#language-server)
  - [Tags](#tags)
  - [Commentary](#commentary)
  - [File Explorer](#file-explorer)
  - [Customization](#customization)
    - [GUI Fonts](#gui-fonts)
  - [Command Line Utility (vcmd)](#command-line-utility-vcmd)
- [Contribute](#contribute)

# Introduction

### Screenshots

##### Simple but pretty UI

![pic1.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic1.png)

##### Code complete for C++

![pic2.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic2.png)

##### Fast cursor movement

![pic3.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic3.png)

##### Fuzzy file search

![pic4.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic4.png)

##### Text search

![pic7-1.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic7-text-search-1.png)
![pic7-2.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic7-text-search-2.png)

##### Markdown preview

![pic5.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic5-markdown-preview.png)

##### Terminal window

![pic6.png](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic6-terminal-window.png)

### Feature

- Running on multiple platforms: UNIX/Linux, Windows and MacOS.
- Code complete, lint and format for most programming languages by [coc.nvim](https://github.com/neoclide/coc.nvim).
- Random color schemes.
- File and buffer explorer and better status line.
- Source code and file fuzzy search.
- Useful command line utilities for: git, text search and encoding/decoding, file operation and compression/extraction, datetime calculation, ip calculation, etc.
- Support both [VIM](https://www.vim.org/) and [Neovim](https://neovim.io/).
- Use [zsh](https://www.zsh.org/) for UNIX/Linux/MacOS with pretty prompt.
- Custom configuration.

### Project Structure

```
 |+command              Command line utilities(vcmd) implemented in python3.
 |+install              Installation scripts for all platforms.
 |+picture              Screenshots for README.
 |+setting              VimL script settings.
 |+template             Templates for user-settings.vim, coc-settings.json, vim-plug.vim and .linvimrc.
 |`install.sh           UNIX/Linux/MacOS bash installation script.
 |`install.ps1          Windows PowerShell installation script.
 |`LICENSE              The license file.
 |`lin.vim              The .vimrc file.
 |`README.md            Readme wiki.
```

# Installation

### UNIX, Linux, MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

1. Install [Visual Studio](https://www.visualstudio.com/) with at least these options:

   - .NET Desktop Development
   - Visual C++ Desktop Development
   - Common Windows Platform Development

2. Install third party dependencies (x64 is preferred):

   - [git](https://git-scm.com/downloads), add `git.exe` in `$env:Path`
   - [cmake](https://cmake.org/download/), add `cmake.exe` in `$env.Path`
   - [gvim](https://github.com/vim/vim-win32-installer/releases), add `gvim.exe` in `$env.Path`
   - (Optional) [neovim](https://github.com/neovim/neovim/releases), add `nvim.exe` in `$env.Path`
   - [python3](https://www.python.org/downloads/), since python3 installer don't provide `python3.exe` and `pip3.exe`, manually copy `python.exe` to `python3.exe`, copy `pip.exe` to `pip3.exe`, then add `python3.exe`, `pip3.exe` in `$env.Path`
   - [llvm](https://releases.llvm.org/), add `clang.exe`, `clang++.exe`, `clangd.exe`, `clang-tidy.exe`, `clang-format.exe` in `$env.Path`
   - [golang](https://go.dev/doc/install), add `go.exe` in `$env.Path`
   - [nodejs](https://nodejs.org/en/download/), add `node.exe`, `npm.exe` in `$env.Path`
   - [the_silver_searcher-win32](https://github.com/k-takata/the_silver_searcher-win32/releases), add `ag.exe` in `$env.Path`
   - [ripgrep](https://github.com/BurntSushi/ripgrep/releases), add `rg.exe` in `$env.Path`
   - [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases), add `ctags.exe`, `readtags.exe` in `$env.Path`

Notice: installed python3 version must be compatible with gvim/neovim's libpython3.so version, or gvim/neovim will not detect python3. Please use `gvim --version` to find its libpython3.so version.

You could also install these dependencies with other windows package manager such as [chocolatey](https://chocolatey.org/) or [scoop](https://scoop.sh/), just make sure these commands are available in `$env.Path`.

3. Install following components as administrator:

```bash
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```

4. Add `$env:UserProfile\.vim\command` in `$env:Path`.

5. Install [hack fonts](https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip), `install.ps1` script will automatically download and save it as `$env:UserProfile\.vim\guifonts\Hack-v3.003-ttf.zip`, please manually install the following fonts:
   - `Hack-Bold.ttf`
   - `Hack-BoldItalic.ttf`
   - `Hack-Italic.ttf`
   - `Hack-Regular.ttf`

### Limitation

##### Third Party Dependencies

[install.sh](https://github.com/linrongbin16/lin.vim/blob/master/install.sh) will install third party dependencies automatically through package manager, which could conflict with your systems:

- git
- (g)vim/macvim
- curl
- wget
- llvm (clang, clang++, clangd, clang-format)
- golang
- autoconf
- automake
- cmake
- the_silver_searcher(ag)
- ripgrep(rg)
- zip, unzip, bzip2, p7zip (7z installed on Windows as an alternative)
- python3, pip packages (python2 is not support)
- node, npm packages
- universal-ctags
- gcc, g++ (only on Linux such as Ubuntu/Fedora/Manjaro)
- neovim (not installed on Windows)
- zsh (not installed on Windows)
- fack font (only download on Windows, need manually installation)

Notice: installation needs access of websites below, and make sure they're available:

- [github.com](https://github.com/).
- [raw.githubusercontent.com](https://raw.githubusercontent.com/).
- [chocolatey](https://chocolatey.org/) on Windows.

##### Tested Platforms

| Software Dependency | Version Info |
| ------------------- | ------------ |
| (g)vim/macvim       | 8.0+         |
| neovim              | 0.4.0+       |
| python3             | 3.6+         |
| nodejs              | 10.12+       |

| Operating System       | (Neo)Vim               | Python                        | Nodejs                        | Test Result                                                                                                             |
| ---------------------- | ---------------------- | ----------------------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| MacOS Catalina 10.15.7 | Macvim 8.2 -lpython3.9 | python 3.9.1 with pip3 20.3.1 | node v15.5.0 with npm 7.3.0   | **_success_**                                                                                                           |
| Windows 10             | Gvim 8.2 -lpython3.8   | python 3.8.0                  | node v15.4.0 with npm 7.0.15  | **_success_**                                                                                                           |
| Ubuntu 20.04 LTS       | Gvim 8.1 -lpython3.8   | python 3.8.5 with pip3 20.0.2 | node v14.5.3 with npm 6.14.9  | **_success_**                                                                                                           |
| Fedora Workstation 32  | Gvim 8.2 +python3/dyn  | python 3.8.6 with pip3 19.3.1 | node v12.19.0 with npm 6.14.8 | **_success_**                                                                                                           |
| Manjaro 20.2           | Gvim 8.2 +python3/dyn  | python 3.8.6 with pip3 20.2   | node v15.3.0 with npm 6.14.8  | **_success_**                                                                                                           |
| Ubuntu 16.04 LTS       | Gvim 7.4 -lpython3.5   | python 3.5.2 with pip 8.1.1   | node v14.5.3 with npm 6.14.9  | **_partial failure_**<br>1) python formatter **_black_** need at least python 3.6<br>2) coc.nvim need at least vim 8.0+ |

# User Guide

In this section, VIM editing modes are specified with:

- 🅽: normal mode
- 🆅: visual mode
- 🅸: insert mode

### Hot Key

- `F1` 🅽: open/close nerdtree file explorer, see [Code complete for C++](#code-complete-for-c).
- `F2` 🅽: open/close tagbar tags explorer, see [Code complete for C++](#code-complete-for-c).
- `F3` 🅽: format current file.
- `F4` 🅽: switch between C/C++ header and source files.
- `F5` 🅽: open terminal window, see [Terminal window](#terminal-window).
- `F6`, `SHIFT-F6` 🅽: rename symbol.
- `F7` 🅽: open markdown preview window in browser, see [Markdown preview](#markdown-preview).
- `F8` 🅽: change color theme randomly, see [Screenshots](#screenshots).
- `CTRL-TAB` 🅽: go to next buffer.
- `CTRL-SHIFT-TAB` 🅽: go to previous buffer.

You could configure these hot keys in **_user-settings.vim_**.

### Enhanced Copy Paste

Enhanced copy-paste are supported when you want copy/paste between different vim instances.

- `<leader>c` 🆅: copy visual-selected text to locale machine cache `~/.vim/.lin-vim-enhanced-copy-paste`.
- `<leader>p` 🅽: paste text saved from local machine cache `~/.vim/.lin-vim-enhanced-copy-paste`.

Copied content will be stored in a text database, then you could paste them to other vim instances.

You could configure these hot keys in **_user-settings.vim_**.

### Text Search

Text search is supported by [the_silver_searcher(ag)](https://github.com/ggreer/the_silver_searcher) and [ripgrep(rg)](https://github.com/BurntSushi/ripgrep), see [Text search](#text-search).

- `:Ag {text}` and `:Rg {text}` 🅽: search {text}.

### File Search

File search is supported by [LeaderF](https://github.com/Yggdroot/LeaderF), see [Fuzzy file search](#fuzzy-file-search).

- `<c-p>` 🅽: search file.

### Alignment

Text Alignment is supported by [easy-align](https://github.com/junegunn/vim-easy-align).

- `vipga=` 🆅: align visual-selected paragraph.
- `gaip=` 🅽: align inner paragraph.

### Cursor Movement

Cursor Movement is supported by [vim-easymotion](https://github.com/easymotion/vim-easymotion), see [Fast cursor movement](#fast-cursor-movement).

- `<leader><leader>f{char}` 🅽: go to a single {char}.
- `<leader>s{char}{char}` 🅽: go to consequent two {char}{char}.
- `<leader><leader>w` 🅽: go to word.
- `<leader><leader>j` 🅽: go to a forward line below cursor.
- `<leader><leader>k` 🅽: go to a backward line above cursor.
- `<leader><leader>L` 🅽: go to a specified line.

10 times faster jkhl movement is binded:

- `<c-j>` 🅽: equal to `10j`
- `<c-k>` 🅽: euqal to `10k`
- `<c-h>` 🅽: equal to `10h`
- `<c-l>` 🅽: equal to `10l`

You could configure these in **_user-settings.vim_**.

### Language Server

Language server is supported by [coc.nvim](https://github.com/neoclide/coc.nvim), and completion are supported in insert mode:

- `<c-n>` `tab` `<up>` 🅸: select next in candidate list.
- `<c-p>` `<s-tab>` `<down>` 🅸: select previous in candidate list.

Go to operations are supported in normal mode:

- `gd` 🅽: go to definition.
- `gy` 🅽: go to type definition.
- `gi` 🅽: go to implementation.
- `gr` 🅽: go to reference.
- `F6`, `<s-F6>` 🅽: rename symbol.

You could configure coc extensions in **_user-settings.vim_** and **_coc-settings.json_**. And refer to [coc.nvim#wiki#Language-servers](https://github.com/neoclide/coc.nvim/wiki/Language-servers) for more programming languages, [coc.nvim#wiki#Using-coc-extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) for more coc extensions.

### Tags

Tags are important suppliement of language server, they're auto generated and updated by [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags), and viewed by [tagbar](https://github.com/preservim/tagbar).

- `F2` 🅽: open/close tagbar tags explorer.
- `<c-]>` 🅽: go to definition.
- `<c-o>` 🅽: go back to previous position.

Notice: tags could be inaccurate in large project (since words could be conflict), please use language server as your first choice.

### Commentary

Commentary is supported by [nerdcomment](https://github.com/preservim/nerdcommenter).

- `<leader>c<space>` 🅽🆅: toggle one line or selected lines.

### File Explorer

File explorer is supported by [nerdtree](https://github.com/preservim/nerdtree), [lightline](https://github.com/itchyny/lightline.vim) and [vim-buftabline](https://github.com/ap/vim-buftabline).
They constructs the file explorer on the left(nerdtree), opened buffers on the top(vim-buftabline) and current editing status on the bottom(lightline).

- `ma` 🅽 on the left: create new file/directory.
- `mc` 🅽 on the left: copy file/directory.
- `md` 🅽 on the left: delete file/directory.
- `mm` 🅽 on the left: move file/directory.

- `<leader>bn`(`<c-tab>`) 🅽: go to next buffer .
- `<leader>bp`(`<c-s-tab>`) 🅽: go to previous buffer.
- `<leader>bd` 🅽: close current buffer.

Other alternatives such as [vimfiler](https://github.com/Shougo/vimfiler.vim)/[airline](https://github.com/vim-airline/vim-airline)/[powerline](https://github.com/powerline/powerline) are not chosen because of heavy of features, which will lead to a performance issue. Otherwise, current combination are smooth, not pretty enough though.

### Customization

Please custom your own settings in **_user-settings.vim_** and **coc-settings.json**.

##### GUI Fonts

[Hack Fonts](https://github.com/source-foundry/Hack/releases/download/) below is installed by default(while only downloaded on Windows and need manually install). Please manually install other fonts and configure font settings in `~/.vim/user-settings.vim` if you want to customize GUI fonts.

### Command Line Utility (vcmd)

A bunch of command line utilities are implemented by python3 to speed up your edit and development, named **_vcmd_**.
**_vcmd_** simplifies common operations in most scenarios of developing and editing, include:

- `vencode`: Encode/decode text strings.
- `vfile`: File operations such as a) delete files with a specified filetype, b) replace content in files with a specified filetype, c) list files with a specified filetype, d) detect and convert file encodings with a specified filetype.
- `vconf`: Configure `compile_commands.json` for C/C++ language server clangd, generate ssh key for host, homebrew/python-pip/ubuntu/fedora/manjaro... mirrors to speed up, etc.
- `vgit`: Git operations without the burden of time consuming remember.
- `vip`: Ip address calculations for both ipv4 and ipv6.
- `vpack`: Easier file/directory compression and extraction.
- `vag`: Fast text search wrapped ag/vg.
- `vtime`: Easier time calculations.

For better understanding and use, help document is supported for all commands, contains command functionality, options and examples.
Here's an example of `vencode`:

```
$ vencode -h
usage: vencode [option] text

  Encode and decode text strings with algorithms.

option:
  -e/--encode [algorithm]       encode text with specified algorithm
  -d/--decode [algorithm]       decode text with specified algorithm

  -h/--help                     show help message

algorithm:
  base64                        base64 algorithm
  url                           url algorithm

example:
  $ vencode -ebase64 'Hello World'
  Hello World => SGVsbG8gV29ybGQ=
```

Please try these commands with `-h` option for more details.

# Contribute

Please open an issue for anything about lin.vim.
