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
    * [File Fuzzy Search](#file-fuzzy-search)
    * [Easy Align](#easy-align)
    * [Easy Move](#easy-move)
    * [Coc.nvim Go To](#cocnvim-go-to)
    * [Tags Go To](#tags-go-to)
    * [Commentary](#commentary)
    * [File Explorer](#file-explorer)
    * [Buffer Explorer](#buffer-explorer)
    * [Customization](#customization)
    * [Command Line Utility](#command-line-utility)

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
2. Download [v2.1.0-Hack.zip](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip) and install *Hack XXX Mono Windows Compatible* fonts:
    * `Hack Regular Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Italic Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Bold Nerd Font Complete Mono Windows Compatible.ttf`
3. Install third party dependencies with [chocolatey](https://chocolatey.org/) and lin.vim (run as administrator):
```bash
    $ choco install git python cmake vim llvm nodejs ag ripgrep universal-ctags
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```
4. Add third party dependencies in `$env:Path`, add `$env:UserProfile\.vim\command` to `$env:Path`.

### GUI fonts

# User Guide

* 🅽: normal mode
* 🆅: visual mode
* 🅸: insert mode

### Hot Key
- `F1` 🅽: switch between C/C++ header source file.
- `F2` 🅽: format current file.
- `F5` 🅽: open/close file explorer.
- `F6` 🅽: open/close tagbar explorer.
- `F9` 🅽: change color theme randomly.
- `F10` 🅽: open/close terminal.

Please see **user.vim** for more details.

### Enhanced Copy Paste
- `<leader>y` 🆅: copy visual-selected text to locale machine cache.
- `<leader>p` 🅽: paste text saved from local machine cache.

Please see **user.vim** for more details.

### Text Search
- `:Ag [text]` (`:Rg [text]`) 🅽: search [text].

### File Fuzzy Search
- `<c-p>` 🅽: fuzzy search file.

### Easy Align
- `vipga=` 🆅: align visual-selected paragraph.
- `gaip=` 🅽: align inner paragraph.

### Easy Move
- `<leader>s [char]` 🅽: go to [char].
- `<leader>w` 🅽: go to [word].
- `<leader>j` 🅽: go to [forward line].
- `<leader>k` 🅽: go to [backward line].

### Coc.nvim Go To
- `gd` 🅽: go to definition.
- `gy` 🅽: go to type definition.
- `gi` 🅽: go to implementation.
- `gr` 🅽: go to reference.
- `[g` 🅽: go to previous diagnostic.
- `]g` 🅽: go to next diagnostic.

Please see **setting-plugin/coc-nvim.vim** and **coc-settings.json** for more details.

### Tags Go To
- `<c-o>` 🅽: go back to previous position.
- `<c-]>` 🅽: go to definition if `gd` not working.

### Commentary
- `<leader>c<space>` 🅽🆅: toggle one line or selected lines.

### File Explorer
- `ma` 🅽: create new file/directory.
- `mc` 🅽: copy file/directory.
- `md` 🅽: delete file/directory.
- `mm` 🅽: move file/directory.

### Buffer Explorer
- `<leader>bn` 🅽: go to next buffer.
- `<leader>bp` 🅽: go to previous buffer.
- `<leader>bd` 🅽: close current buffer.

### Customization
- custom your own settings in **user.vim** and **coc-settings.json**.

### Command Line Utility
- try `vcmd` to find more.
