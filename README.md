# lin.vim : Lin Rongbin's (Neo)Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development running on most operating systems.

# Table of Contents

* [Introduction](#introduction)
    * [Screenshots](#screenshots)
    * [Feature](#feature)
    * [Project Structure](#project-structure)
* [Installation](#installation)
    * [UNIX, Linux, MacOS](#unix-linux-macos)
    * [Windows](#windows)
* [User Guide](#user-guide)
    * [Hot Key](#hot-key)
    * [Enhanced Copy Paste](#enhanced-copy-paste)
    * [Text Search](#text-search)
    * [File Search](#file-search)
    * [Alignment](#alignment)
    * [Cursor Movement](#cursor-movement)
    * [Language Server](#language-server)
    * [Tags](#tags)
    * [Commentary](#commentary)
    * [File Explorer](#file-explorer)
    * [Customization](#customization)
    * [Command Line Utility (vcmd)](#command-line-utility-vcmd)

# Introduction

### Screenshots

##### Simple but pretty UI
![pic1.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic1.jpg)

##### Code complete for C++
![pic2.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic2.jpg)

##### Fast cursor movement
![pic3.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic3.jpg)

##### Fuzzy file search
![pic4.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic4.jpg)

### Feature

- Running on multiple platforms: UNIX/Linux, Windows and MacOS.
- Code complete, lint and format for most programming languages by [coc.nvim](https://github.com/neoclide/coc.nvim).
- Random color schemes and pretty icons.
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
 |+setting-plugin       VimL scripts for vim plugins.
 |+setting-vim          VimL scripts for lin.vim.
 |`install.sh           UNIX/Linux/MacOS bash installation script.
 |`install.ps1          Windows PowerShell installation script.
 |`LICENSE              The license file.
 |`lin.vim              The *.vimrc* file.
 |`user.vim             Vim settings, customize your own settings here.
 |`coc-settings.json    Coc-nvim settings, customize your own settings here.
```

# Installation

NOTICE:
1. Installation needs network access of below, please make sure they're available before installation.
    * [github.com](https://github.com/).
    * [raw.githubusercontent.com](https://raw.githubusercontent.com/).
    * [chocolatey](https://chocolatey.org/) on Windows.
2. Hack Nerd Fonts below is used default, please manually install other [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) and configure font settings in `~/.vim/user.vim` if you want to customize GUI fonts.
    * [Hack Nerd Font Complete Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) on UNIX/Linux/MacOS.
    * [Hack Nerd Font Complete Mono Windows Compatible](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) on Windows.
3. Both Vim and Neovim are supported on UNIX/Linux/MacOS, and `nvim` will not been installed on Windows by default. Please install Neovim GUI client manually if you need.

### UNIX, Linux, MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

NOTICE: we don't support CMD any more, please use PowerShell on Windows.

1. Install [Visual Studio](https://www.visualstudio.com/) with options:
    * .NET Desktop Development.
    * Visual C++ Desktop Development.
    * Common Windows Platform Development.
2. Install third party dependencies with [chocolatey](https://chocolatey.org/) and lin.vim (run as administrator):
```bash
    $ choco install -y git cmake vim llvm nodejs ag ripgrep universal-ctags
    $ choco install -y python --version=3.8.0
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```
3. Add third party dependencies in `$env:Path`, add `$env:UserProfile\.vim\command` to `$env:Path`.
4. Additionally copy a duplicated executable file `python3.exe` from `python.exe` for explicitly different from python2.
5. Install hack nerd fonts windows compatible version downloaded as `$env:UserProfile\.vim\guifonts\Hack.zip`:
    * `Hack Regular Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Italic Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Bold Nerd Font Complete Mono Windows Compatible.ttf`

# User Guide

In this section, VIM editing modes are specified with:

* 🅽: normal mode
* 🆅: visual mode
* 🅸: insert mode

### Hot Key

- `F3` 🅽: format current file.
- `F4` 🅽: switch between C/C++ header and source files.
- `F5` 🅽: open/close nerdtree file explorer.
- `F6` 🅽: open/close tagbar tags explorer.
- `F9` 🅽: change color theme randomly.
- `F10` 🅽: open/close terminal window.

You could configure these hot keys in ***user.vim***.

### Enhanced Copy Paste

Enhanced copy-paste are supported when you want to export/import content from/to a text file.

- `<leader>y` 🆅: copy visual-selected text to locale machine cache `~/.cache/.lin.vim.copypaste`.
- `<leader>p` 🅽: paste text saved from local machine cache `~/.cache/.lin.vim.copypaste`.

You could configure these hot keys in ***user.vim***.


### Text Search

Text search is supported by [the_silver_searcher(ag)](https://github.com/ggreer/the_silver_searcher) and [ripgrep(rg)](https://github.com/BurntSushi/ripgrep).

- `:Ag {text}` and `:Rg {text}` 🅽: search {text}.

### File Search

File search is supported by [LeaderF](https://github.com/Yggdroot/LeaderF).

- `<c-p>` 🅽: search file.

### Alignment

Text Alignment is supported by [easy-align](https://github.com/junegunn/vim-easy-align).

- `vipga=` 🆅: align visual-selected paragraph.
- `gaip=` 🅽: align inner paragraph.

### Cursor Movement

Cursor Movement is supported by [vim-easymotion](https://github.com/easymotion/vim-easymotion).

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

You could configure these in ***user.vim***.

### Language Server

Language server is supported by [coc.nvim](https://github.com/neoclide/coc.nvim), and completion are supported in insert mode:

- `<c-n>` 🅸: select next in candidate list, same as `<tab>` `<up>`.
- `<c-p>` 🅸: select previous in candidate list, same as `<s-tab>` `<down>`.
- `<c-k>` 🅸: trigger completion.

Go to operations are supported in normal mode:

- `gd` 🅽: go to definition.
- `gy` 🅽: go to type definition.
- `gi` 🅽: go to implementation.
- `gr` 🅽: go to reference.

You could configure coc.nvim plugins in ***user.vim*** and ***coc-settings.json***.

### Tags

Tags are important suppliement of language server, they're auto generated and updated by [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags), and viewed by [tagbar](https://github.com/preservim/tagbar).

- `F6` 🅽: open/close tagbar tags explorer.
- `<c-]>` 🅽: go to definition.
- `<c-o>` 🅽: go back to previous position.

### Commentary

Commentary is supported by [nerdcomment](https://github.com/preservim/nerdcommenter).

- `<leader>c<space>` 🅽🆅: toggle one line or selected lines.

### File Explorer

File explorer is supported by [nerdtree](https://github.com/preservim/nerdtree), [lightline](https://github.com/itchyny/lightline.vim) and [vim-buftabline](https://github.com/ap/vim-buftabline).
They constructs the file/directory explorer on the left(nerdtree), opened buffers on the top(vim-buftabline) and current editing status on the bottom(lightline).

- `ma` 🅽 on the left: create new file/directory.
- `mc` 🅽 on the left: copy file/directory.
- `md` 🅽 on the left: delete file/directory.
- `mm` 🅽 on the left: move file/directory.

- `<leader>bn` 🅽: go to next buffer.
- `<leader>bp` 🅽: go to previous buffer.
- `<leader>bd` 🅽: close current buffer.

### Customization
- custom your own settings in ***user.vim*** and **coc-settings.json**.

### Command Line Utility (vcmd)

A bunch of command line utilities are implemented by python3 to speed up your edit and development, named ***vcmd***.
***vcmd*** simplifies common operations in most scenarios of developing and editing, include:

* `vencode`: Encode/decode text strings.
* `vfile`: File operations such as a) delete files with a specified filetype, b) replace content in files with a specified filetype, c) list files with a specified filetype, d) detect and convert file encodings with a specified filetype.
* `vconf`: Configure `compile_commands.json` for C/C++ language server clangd, generate ssh key for host, homebrew/python-pip/ubuntu/fedora/manjaro... mirrors to speed up, etc.
* `vgit`: Git operations without the burden of time consuming remember.
* `vip`: Ip address calculations for both ipv4 and ipv6.
* `vpack`: Easier file/directory compression and extraction.
* `vag`: Fast text search wrapped the_silver_search ag.
* `vtime`: Easier time calculations.

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
