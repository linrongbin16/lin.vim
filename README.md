# lin.vim : Lin Rongbin's (Neo)vim Distribution

lin.vim is a highly configured [vim](https://www.vim.org/)/[neovim](https://neovim.io/) distribution integrated tons of utilities for development, inspired by [spf13-vim](https://github.com/spf13/spf13-vim).

# Table of Contents

- [Introduction](#introduction)
  - [Screenshots](#screenshots)
  - [Feature](#feature)
- [Installation](#installation)
  - [UNIX/Linux/MacOS](#unixlinuxmacos)
  - [Windows](#windows)
  - [More Options](#more-options)
  - [Upgrade](#upgrade)
- [User Guide](#user-guide)
  - [Global Key Mappings](#global-key-mappings)
    - [Hot Keys](#hot-keys)
    - [Control/Command+? Keys](#controlcommand-keys)
  - [UI](#ui)
    - [File Explorer](#file-explorer)
    - [Tabline](#tabline)
    - [Font](#font)
  - [IDE-like Editing Features](#ide-like-editing-features)
    - [Code Complete](#code-complete)
    - [Jumps](#jumps)
    - [Symbols](#symbols)
    - [Code Format](#code-format)
    - [Code Actions](#code-actions)
    - [CodeLens](#codelens)
    - [Git](#git)
  - [Search](#search)
    - [Text Search](#text-search)
    - [File Search](#file-search)
    - [Git Search](#git-search)
    - [Other Search](#other-search)
    - [Coc.nvim Search](#cocnvim-search)
  - [Editing Enhancement](#editing-enhancement)
    - [Easy Comment](#easy-comment)
    - [Cursor Motion](#cursor-motion)
    - [Word Movement](#word-movement)
    - [Better Repeat](#better-repeat)
    - [Better Surrounding(Quotes) Editing](#better-surroundingquotes-editing)
    - [Better Matching](#better-matching)
    - [Auto Pair and Close HTML Tag](#auto-pair-and-close-html-tag)
  - [Customization](#customization)
- [Appendix](#appendix)
  - [Embeded Language Servers](#embeded-language-servers)
  - [Color Schemes](#color-schemes)
- [Contribute](#contribute)

# Introduction

Aim to be out of box, IDE-like editing experience, high performance, light weight and friendly to both vim and neovim users. Focus on and only on editing, no compile/package/debug.

Solve below issues:

- Time-costing vim configurations - All behaviors follow community's best practice and most popular editors (just like [vscode](https://code.visualstudio.com/)).
- Lack of IDE-like editing features - [Coc.nvim](https://github.com/neoclide/coc.nvim) and a bunch of language servers and extensions are embeded.
- Don't know how to choose/configure/manage vim plugins - All plugins are carefully selected and well cooperated for best performance and user experience, cover most modern editor features (again, just like vscode).
- Duplicate installation on different OS and machines - All done by one-line command (not on Windows for now), all installations behave the same (the only difference is use command-key on macOS instead of alt-key on Windows/Linux).
- Naive UI - Pretty colorschemes, icons, opened tabs, file explorer, file status integrated.

## Screenshots

<!-- #### Simple but pretty UI -->
<!-- ![edit-markdown.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/edit-markdown.png) -->

<p align="center">
  <img alt="edit-markdown.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/edit-markdown.png" width="100%">
  </br>
  <em style="fontsize:50%">Simple but pretty UI</em>
</p>

<!-- #### Code complete for Python3 -->
<!-- ![python3-complete.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/python-complete.png) -->

<p align="center">
  <img alt="python3-complete.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/python-complete.png" width="100%">
  </br>
  <em style="fontsize:50%">Code complete for python3</em>
</p>

<p align="center">
  <img alt="outline-terminal.jpg" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/outline-terminal.jpg" width="100%">
  </br>
  <em style="fontsize:50%">Outlines and Terminal</em>
</p>

<!-- #### Cursor movement -->
<!-- ![fast-cursor-movement.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/fast-cursor-movement1.png) -->

<p align="center">
  <img alt="fast-cursor-movement.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/fast-cursor-movement1.png" width="100%">
  </br>
  <em style="fontsize:50%">Fast cursor movement</em>
</p>

<!-- #### Search text -->
<!-- ![search-text.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-text.png) -->

<p align="center">
  <img alt="search-text.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-text.png" width="100%">
  </br>
  <em style="fontsize:50%">Search text</em>
</p>

<!-- #### Search files -->
<!-- ![search-files.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-files.png) -->

<p align="center">
  <img alt="search-files.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-files.png" width="100%">
  </br>
  <em style="fontsize:50%">Search files</em>
</p>

<!-- #### Markdown preview -->
<!-- ![markdown-preview.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/markdown-preview1.png) -->

<p align="center">
  <img alt="markdown-preview.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/markdown-preview1.png" width="100%">
  </br>
  <em style="fontsize:50%">Markdown preview</em>
</p>

### Feature

- One-line command installation (not on windows for now).
- Work on multiple OS platforms:
  - Windows.
  - macOS.
  - Linux (Ubuntu/Debian/Fedora/Manjaro).
- Support both [vim](https://www.vim.org/) and [neovim](https://neovim.io/), neovim 0.7+ is strongly recommended for best performance and experience.
- Modern editor UI:
  - File explorer.
  - Icons.
  - [Color schemes](#color-schemes) randomly selected on start.
  - Status line.
  - Tab line and buffer explorer.
  - Outline/Tags.
- IDE-like editing features supported by [coc.nvim](https://github.com/neoclide/coc.nvim), [a bunch of language servers](#embeded-language-servers) embeded by default:
  - Code complete.
  - Diagnostic.
  - Lint.
  - Code format.
  - Jump between symbols.
  - Code Actions.
  - Code Lens.
- Search engine supported by [fzf.vim](https://github.com/junegunn/fzf.vim):
  - Text search.
  - File search.
  - Git search.
  - Coc.nvim integrated search.
  - Other search.
- Other [editing enhancements](#editing-enhancement).
- Custom configuration.

# Installation

## UNIX/Linux/MacOS

```bash
    git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

Notice:

1. The `install.sh` will automatically install below dependencies with system package manager:

   - [git](https://git-scm.com/).
   - [vim](https://github.com/vim/vim) and [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).
   - [clang](https://clang.llvm.org/)(for macOS) or [gcc](https://gcc.gnu.org/)(for Linux), [make](https://www.gnu.org/software/make/), [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/), [cmake](https://cmake.org/), [autoconf](https://www.gnu.org/software/autoconf/) and [automake](https://www.gnu.org/software/automake/).
   - [python3](https://www.python.org/) (python 2.x is not support) and some pip packages.
   - [node.js](https://nodejs.org/) and some npm packages.
   - [golang](https://go.dev/).
   - [rust](https://www.rust-lang.org/) and some modern commands: [fd](https://github.com/sharkdp/fd), [rg](https://github.com/BurntSushi/ripgrep), [bat](https://github.com/sharkdp/bat), etc.
   - [curl](https://curl.se/) and [wget](https://www.gnu.org/software/wget/).
   - [universal-ctags](https://github.com/universal-ctags/ctags).
   - [hack nerd font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip).

2. For now supported platforms are:
   - Debian/ubuntu based linux: use `apt` as software installer.
   - Fedora/centos based linux: use `dnf` as software installer.
   - Archlinux based linux: use `pacman` as software installer.
   - MacOS: use `brew` as software installer, please install [Xcode](https://guide.macports.org/chunked/installing.html) and [homebrew](https://brew.sh/) as pre-requirements.
   - Other \*NIX systems such as gentoo, bsd are not supported yet.

## Windows

1. Install [Visual Studio](https://www.visualstudio.com/) with below 2 components:

   - .NET Desktop Development
   - Desktop development with C++

<!-- ![install-windows-visual-studio2.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-visual-studio2.png) -->
<p align="center">
  <img alt="install-windows-visual-studio2.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-visual-studio2.png" width="100%">
  <em style="fontsize:50%">Select .NET and C++ components</em>
</p>

2. Install [64-bit Git for Windows Setup](https://git-scm.com/downloads) with below 3 options:

   - In the _**Select Components**_ step, select _**Associate .sh files to be run with Bash**_.
   - In the _**Adjusting your PATH environment**_ step, select _**Use Git and optional Unix tools from the Command Prompt**_.
   - In the _**Configuring the terminal emulator to use with Git Bash**_ step, select _**Use Windows's default console window**_. This will add `git.exe` and linux builtin commands (such as `bash.exe`, `cp.exe`, `mv.exe`, `cd.exe`, `ls.exe`, etc) to `$env:Path`.

<!-- ![install-windows-git1.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git1.png) -->
<!-- ![install-windows-git2.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git2.png) -->
<!-- ![install-windows-git3.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git3.png) -->
<p align="center">
  <img alt="install-windows-git1.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git1.png" width="65%">
  </br>
  <em style="fontsize:50%">Treat .sh files as bash script</em>
</p>
<p align="center">
  <img alt="install-windows-git2.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git2.png" width="65%">
  </br>
  <em style="fontsize:50%">Enable both git and linux builtin commands</em>
</p>
<p align="center">
  <img alt="install-windows-git3.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git3.png" width="65%">
  </br>
  <em style="fontsize:50%">Add git and linux commands to environment path</em>
</p>

3. Install other 64-bit dependencies:

   - [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases/latest) (`gvim_{x.y.z}_x64.exe`): add `gvim.exe` to `$env:Path`
   - [neovim](https://github.com/neovim/neovim/releases/latest) (`nvim-win64.msi`): add `nvim.exe` to `$env:Path`
   - [cmake](https://github.com/Kitware/CMake/releases/latest) (`cmake-{x.y.z}-windows-x86_64.msi`): add `cmake.exe` to `$env:Path`
   - [make-for-win32](https://sourceforge.net/projects/gnuwin32/files/make/3.81/make-3.81-bin.zip/download) (`make-{x.y}-bin.zip`): add `make.exe`to`$env:Path`
   - [python3](https://www.python.org/downloads/windows/) (`python-{x.y.z}-amd64.exe`): manually copy `python.exe` to `python3.exe`, then add `python3.exe` to `$env:Path` (Since windows python3 installer only provide `python.exe`).
   - [rust](https://www.rust-lang.org/tools/install) (`rustup-init.exe (64-bit)`): add `rustc.exe`, `cargo.exe` to `$env:Path`
   - [golang](https://go.dev/dl/) (`go{x.y.z}.windows-amd64.msi`): add `go.exe` to `$env:Path`
   - [nodejs](https://nodejs.org/en/download/) (`node-v{x.y.z}-x64.msi`): add `node.exe`, `npm.exe` to `$env:Path`
   - [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases) (`ctags-p{x.y.d.z}-x64.zip`): add `ctags.exe`, `readtags.exe` to `$env:Path`

4. Install [Hack NFM](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip).
5. Run powershell commands as administrator:

```powershell
    git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim && cd $env:UserProfile\.vim && .\install.ps1
```

Notice:

1. If you are using WSL, `C:\Windows\System32\bash.exe` could lead you to WSL instead of the `bash.exe` from [Git for Windows](https://git-scm.com/). Make sure git path is ahead of `C:\Windows\System32`, so git bash will be first detected (`wsl.exe` could connect to WSL as well so no need to worry about losing `C:\Windows\System32\bash.exe`).

<!-- ![install-windows-git-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-path.png) -->
<p align="center">
  <img alt="install-windows-git-path.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-path.png" width="65%">
  </br>
  <em style="fontsize:50%">Move git path ahead of C:\Windows\System32</em>
</p>

2. [Git for Windows](https://git-scm.com/) provide an old-version `vim.exe`, make sure `gvim.exe` (from [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases)) path is ahead of git, so `vim.exe` from [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases) will be first detected. You could also only use `gvim.exe` to avoid the old-version vim.

<!-- ![install-windows-gvim-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-gvim-path.png) -->
<p align="center">
  <img alt="install-windows-gvim-path.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-gvim-path.png" width="65%">
  </br>
  <em style="fontsize:50%">Move gvim path ahead of git</em>
</p>

3. Python3 version must be compatible with gvim's libpython3.lib, or python3 will not be loaded correctly. Please use `gvim --version` to find its libpython3.lib version.

<!-- ![install-windows-gvim-libpython3.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-gvim-libpython3.png) -->
<p align="center">
  <img alt="install-windows-gvim-libpython3.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-gvim-libpython3.png" width="65%">
  </br>
  <em style="fontsize:50%">Find libpython3.lib version at bottom</em>
</p>

4. Disable Windows App alias `python.exe` or `python3.exe`, this could lead you to the wrong python from windows store.

<p align="center">
  <img alt="install-windows-app-alias.png" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-app-alias.png" width="65%">
  </br>
  <em style="fontsize:50%">Disable python.exe and python3.exe</em>
</p>

## More Options

The `install.sh` (and `install.ps1`) provide 3 installation modes:

- Full mode (default mode): with `./install.sh`, it install all features for best user experience, which consumes unignorable CPU, memory, disk and graphics.
- Limit mode: for low performance devices (such as old PC). With `./install.sh --limit`, it disable extra highlights, colorschemes, language support and editing enhancements.
- Basic mode: for extremely restricted environment (such as production environment), which has limited network access or user authentication. With `./install.sh --basic`, it only install pure vim configurations, without any third party softwares or vim plugins.

And more options:

- `--static-color=TEXT`: make colorscheme static, instead of random selection on startup. For example: `--static-color=darkblue`.
- `--disable-color`: disable extra colorschemes, and random selection on startup.
- `--disable-highlight`: disable extra highlights. Such as RGB and same word mark under cursor, etc.
- `--disable-language`: disable language support. Such as auto complete and language servers, etc.
- `--disable-editing`: disable editing enhancements. Such as easy comment, cursor motion, etc.
- `--disable-plugin=TEXT`: disable specific vim plugin in format 'organization/repository', this is a multiple option. For example: `--disable-plugin=RRethy/vim-hexokinase --disable-plugin=alvan/vim-closetag`.
- `--disable-vim`: don't install .vimrc file for vim, could use neovim only.
- `--disable-neovim`: don't install nvim/init.vim file for neovim, could use vim only.

Notice:

- In full mode, you could use '--disable-xxx' options to disable some specific features.
- Option '--disable-highlight --disable-color --disable-language --disable-editing' is equivalent to '--limit'.

The `install.ps1` especially provide two more options for Windows:

- `--depends=TEXT`: download and install specific dependency in 3rd step of [windows installation](#windows). Use `--depends=all` to run for all dependencies. For example: `--depends=vim`, `--depends=universal-ctags`.
- `--nerdfont=TEXT`: download specific [nerd font](https://github.com/ryanoasis/nerd-fonts/releases/latest). For example: `--nerdfont=Hack`, `--nerdfont=SourceCodePro`.

> Use a package manager (such as [chocolatey](https://chocolatey.org/) and [scoop](https://scoop.sh/)) could be a better choice, just make sure they're available in `$env:Path`.

## Upgrade

For distribution, please re-install by:

```bash
    cd ~/.vim
    git pull origin master
    ./install.sh
```

For vim plugins, please open (neo)vim and update by:

```vim
    :PlugUpdate!
```

# User Guide

In this section, vim editing mode are specified with:

- **🇳** - Normal mode.
- **🇻** - Visual mode.
- **🇮** - Insert mode.

Meta-key (`M`), alt-key (`A`) on Windows/Linux, and command-key (`D`) on macOS are collectively refered as:

- `M`

## Global Key Mappings

#### Hot Keys

- `F1` **🇳** - Toggle file explorer, see [Simple but pretty UI](#screenshots).
- `F2` **🇳** - Toggle undo tree.
- `F3` **🇳** - Toggle outline/tags, see [Outlines and Terminal](#screenshots).
- `F4` **🇳** - Switch between C/C++ headers and sources.
- `F7` **🇳** - Toggle git blame info on current line.
- `F8` **🇳** - Open markdown preview.
- `F9` **🇳** - Toggle terminal.
- `F10` **🇳** - Toggle buffers explorer.

#### Control/Command+? Keys

Control+? keys are configured following most editors' behaviour under windows:

- `<C-a>` **🇳** **🇻** **🇮** - Select all.
- `<C-c>` **🇳** **🇻** **🇮** - Copy to clipboard.
- `<C-x>` **🇳** **🇻** **🇮** - Cut to clipboard.
- `<C-v>` **🇳** **🇻** **🇮** - Paste from clipboard.
- `<C-s>` **🇳** **🇻** **🇮** - Save file.
- `<C-y>` **🇳** **🇻** **🇮** - Redo.
- `<C-z>` **🇳** **🇻** **🇮** - Undo.
- `<C-q>` **🇳** - Turn into visual block mode, same as vim's original _ctrl+v_ (since we remapped it to paste).

Additionally for macOS, command+? keys are configured following the same behaviour (control+? keys are also enabled):

- `<D-a>` **🇳** **🇻** **🇮** - Same as `<C-a>`.
- `<D-c>` **🇳** **🇻** **🇮** - Same as `<C-c>`.
- `<D-x>` **🇳** **🇻** **🇮** - Same as `<C-x>`.
- `<D-v>` **🇳** **🇻** **🇮** - Same as `<C-v>`.
- `<D-s>` **🇳** **🇻** **🇮** - Same as `<C-s>`.
- `<D-y>` **🇳** **🇻** **🇮** - Same as `<C-y>`.
- `<D-z>` **🇳** **🇻** **🇮** - Same as `<C-z>`.

Copy/paste across different vim instances through remote ssh could be difficult, so introduce two shortcuts using local cache:

- `<Leader>y` **🇻** - Copy visual selected text to cache.
- `<Leader>p` **🇳** - Paste from cache to current cursor.

You could configure all global key mappings in _~/.vim/settings.vim_.

## UI

#### File Explorer

File explorer is support by [fern.vim](https://github.com/lambdalisue/fern.vim) (switched to [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) on neovim 0.7+).

Navigation:

- `h` **🇳** - Collapse directory.
- `l` **🇳** - Expand directory or open file.
- `<CR>` **🇳** - Cd into directory.
- `<BS>` **🇳** - Go to upper directory and leave directory.
- `e` **🇳** - Open file in `split`.
- `E` **🇳** - Open file in `vsplit`.
- `t` **🇳** - Open file in new tab.

Create/rename/delete:

- `N`/`a` **🇳** - Create new file. Notice `a` is not working on fern.vim, since it's forcely mapped to `<Plug>(fern-action-choice)` instead of `<Plug>(fern-action-new-file)`.
- `A` **🇳** - Create new directory. Notice nvim-tree.lua need an additional slash `/` (or `\`) after directory name (see: [nvim-tree.lua - Tips & tricks](https://github.com/nvim-tree/nvim-tree.lua#tips--tricks)), while fern.vim just need directory name itself.
- `m`/`r` **🇳** - Move or rename file/directory.
- `d` **🇳** - Trash file/directory to system trash-bin, only for windows/macOS.
- `D` **🇳** - Delete file/directory, usually `rm`.

Copy/paste/cut:

- `C` **🇳** - Copy file/directory into an internal clipboard, just like in Windows ctrl+c.
- `X` **🇳** - Cut file/directory into an internal clipboard, just like in Windows ctrl+x.
- `V` **🇳** - Paste file/directory from an internal clipboard to current directory, just like in Windows ctrl+v.

Adjust explorer width:

- `<M-.>`/`<M-Right>`/`<C-.>`/`<C-Right>` **🇳** - Make explorer bigger size.
- `<M-,>`/`<M-Left>`/`<C-,>`/`<C-Left>` **🇳** - Make explorer smaller size.

Other:

- `R` **🇳** - Refresh file explorer.
- `s` **🇳** - Open file in system file manager(such as Finder in macOS).
- `?` **🇳** - Toggle help.

_For neovim 0.7+ only_:

- `I` **🇳** - Toggle file info.
- `H` **🇳** - Toggle hidden dot files.
- `<` **🇳** - Goto previous(up) sibling.
- `>` **🇳** - Goto next(down) sibling.
- `K` **🇳** - Goto first(top) sibling.
- `J` **🇳** - Goto last(bottom) sibling.
- `P` **🇳** - Goto parent(upper) directory.
- `y` **🇳** - Copy file name as literal.
- `Y` **🇳** - Copy absolute file path as literal.
- `]c` **🇳** - Goto next(down) git chunk.
- `[c` **🇳** - Goto previous(up) git chunk.

You could editing **_~/.vim/repository/lambdalisue/fern.vim.vim_** (or **_~/.vim/repository/kyazdani42/nvim-tree.lua.vim_**) to customize key mappings. Please refer to [fern.vim - wiki - Mappings](https://github.com/lambdalisue/fern.vim/wiki/Mappings) (or [:help nvim-tree-mappings](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)) for more information.

#### Tabline

Notice that on different platforms,terminals and GUI clients, some ctrl/meta+keys could been overwritten. So introduced several ways of mappings to make sure for the availibility.

- `<Leader>bn`/`<M-.>`/`<C-.>`/`<M-Right>`/`<C-Right>` **🇳** - Go to next(right) buffer.
- `<Leader>bp`/`<M-,>`/`<C-,>`/`<M-Left>`/`<C-Left>` **🇳** - Go to previous(left) buffer.
- `<Leader>bd` **🇳** - Close current buffer without closing vim window.

Navigation:

- `<M-1>`/`<C-1>` **🇳** - Go to buffer-1.
- `<M-2>`/`<C-2>` **🇳** - Go to buffer-2.
- `<M-3>`/`<C-3>` **🇳** - Go to buffer-3.
- `<M-4>`/`<C-4>` **🇳** - Go to buffer-4.
- `<M-5>`/`<C-5>` **🇳** - Go to buffer-5.
- `<M-6>`/`<C-6>` **🇳** - Go to buffer-6.
- `<M-7>`/`<C-7>` **🇳** - Go to buffer-7.
- `<M-8>`/`<C-8>` **🇳** - Go to buffer-8.
- `<M-9>`/`<C-9>` **🇳** - Go to buffer-9.
- `<M-0>`/`<C-0>` **🇳** - Go to buffer-10 (or the last buffer on neovim 0.7+).

_For neovim 0.7+ only_:

- `<M-S-Right>`/`<C-S-Right>` **🇳** - Re-order(move) current buffer to next(right) position.
- `<M-S-Left>`/`<C-S-Left>` **🇳** - Re-order(move) current buffer to previous(left) position.
- `<LeftMouse>` **🇳** - Go to target buffer.
- `<MiddleMouse>` **🇳** - Close target buffer.

Support by [vim-buffet](https://github.com/bagrat/vim-buffet) (switched to [barbar.nvim](https://github.com/romgrk/barbar.nvim) on neovim 0.5+).

#### Font

By default [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/releases) is enabled. Please install other nerd fonts and edit _~/.vim/settings.vim_ to customize fonts.

## IDE-like Editing

#### Code Complete

- `<C-n>`/`<Down>` **🇮** - Navigate to next suggestion.
- `<C-p>`/`<Up>` **🇮** - Navigate to previous suggestion.
- `<TAB>`/`<CR>` **🇮** - Confirm current suggestion.
- `<ESC>`/`<C-[>` **🇮** - Close suggestion.
- `<C-f>` **🇮** - Navigate to next(right) snippet placeholder.
- `<C-b>` **🇮** - Navigate to previous(left) snippet placeholder.

#### Jumps

- `[d` **🇳** - Go to previous(up) diagnostic location.
- `]d` **🇳** - Go to next(down) diagnostic location.
- `gd` **🇳** - Go to definition.
- `gD`/`gl` **🇳** - Go to declaration.
- `gy`/`gt` **🇳** - Go to type definition.
- `gi` **🇳** - Go to implemention.
- `gr` **🇳** - Go to references.

#### Symbols

- `K` **🇳** - Show hover information.
- `<Leader>rs` **🇳** - Rename symbol.

#### Code Format

- `<Leader>cf` **🇳** - Format code on whole buffer in normal mode.
- `<Leader>cf` **🇻** - Format selected code in visual mode.

#### Code Actions

- `<Leader>ca` **🇳** - Run code actions under cursor in normal mode.
- `<Leader>ca` **🇻** - Run code actions on selected code in visual mode.
- `<Leader>qf` **🇳** - Apply quick fix for diagnostics on current line.

#### CodeLens

- `<Leader>cl` **🇳** - Run the CodeLens on current line.

#### Git

- `]c` **🇳** - Go to next(down) git chunk in current buffer.
- `[c` **🇳** - Go to previous(up) git chunk in current buffer.
- `<Leader>gb` **🇳** - Toggle git blame info for current line (for neovim 0.5+).

### Search

Search engine use fzf.vim and integrated with coc.nvim with [coc-fzf](https://github.com/antoinemadec/coc-fzf). All fzf commands are configured with prefix **Fzf**, for example `:Files` are renamed to `:FzfFiles`, `:Rg` are renamed to `:FzfRg`.

#### Text Search

- `<Space>gr` **🇳** - Search text by self-defined command `:LinVimFzfRg`.
- `<Space>gw` **🇳** - Search word text under cursor by self-defined command `:LinVimFzfRgCWord`.
- `<Space>l` **🇳** - Search lines on opened buffers by `:FzfLines`.
- `<Space>t` **🇳** - Search tags by `:FzfTags`.
- `<Space>y` **🇳** - Search yank history by `:CocFzfList yank`.
- `<Space>sh` **🇳** - Search searched history by `:FzfHistory/`.
- `<Space>ch` **🇳** - Search vim command history by `:FzfHistory:`.

#### File Search

- `<Space>f`/`<C-p>` **🇳** - Search files by `:FzfFiles`.
- `<Space>b` **🇳** - Search opened buffers by `:FzfBuffers`.
- `<Space>hf` **🇳** - Search history files (v:oldfiles) and opened buffers by `:FzfHistory`.

#### Git Search

- `<Space>gc` **🇳** - Search git commits by `:FzfCommits`.
- `<Space>gf` **🇳** - Search git files rby `:FzfGFile`.
- `<Space>gs` **🇳** - Search git status (also diff files by preview) by `:FzfGFiles?`.

#### Other Search

- `<Space>mk` **🇳** - Search marks by `:FzfMarks`.
- `<Space>mp` **🇳** - Search normal mode vim key mappings by `:FzfMaps`.
- `<Space>vc` **🇳** - Search vim commands by `:FzfCommands`.
- `<Space>ht` **🇳** - Search help tags by `:FzfHelptags`.

#### Coc.nvim Search

Key mappings are configured with prefix char `c` after `<Space>`.

- `<Space>cs` **🇳** - Search coc symbols by `:CocFzfList symbols`.
- `<Space>cd` **🇳** - Search coc diagnostics by `:CocFzfList diagnostics`.
- `<Space>co` **🇳** - Search coc outlines(tags) by `:CocFzfList outline`.
- `<Space>cc` **🇳** - Search coc commands by `:CocFzfList commands`.
- `<Space>cl` **🇳** - Search coc location by `:CocFzfList location`.

Please visit [fzf.vim](https://github.com/junegunn/fzf.vim) and [coc-fzf](https://github.com/antoinemadec/coc-fzf) for more information.

## Editing Enhancement

#### Easy Comment

Linewise comment:

- `gcc` **🇳** - Toggle current line.
- `[count]gcc` **🇳** - Toggle _[count]_ number of lines.
- `gc{motion}` **🇳** - Toggle two lines with motion(jk).
- `gc[count]{motion}` **🇳** - Toggle region with _[count]_(optional) times motion.
- `gc` **🇻** - Toggle selected region in virual mode.

_Blockwise comment (for neovim only)_:

- `gbc` **🇳** - Toggle current line.
- `[count]gbc` **🇳** - Toggle _[count]_ number of lines.
- `gb{motion}` **🇳** - Toggle two lines with motion.
- `gb[count]{motion}` **🇳** - Toggle region with _[count]_(optional) times motion.
- `gb` **🇻** - Toggle selected region in virual mode.

Support by [tcomment_vim](https://github.com/tomtom/tcomment_vim) (switched to [Comment.nvim](https://github.com/numToStr/Comment.nvim) on neovim).

#### Cursor Motion

See [Fast cursor movement](#screenshots).

- `<Leader>f{char}` **🇳** - Move by a single {char}.
- `<Leader>s{char}{char}` **🇳** - Move by two consequent {char}{char}.
- `<Leader>w` **🇳** - Move by word.
- `<Leader>l` **🇳** - Move by line.

Support by [vim-easymotion](https://github.com/easymotion/vim-easymotion) (switched to [hop.nvim](https://github.com/phaazon/hop.nvim) on neovim 0.5+).

#### Word Movement

(Neo)vim word movement cannot recognize real literal word, such as camel case, mixed digits, characters, punctuations, etc.
So introduce better word motions:

- `<Leader>w`/`<Leader>W` **🇳** - word/WORD forward(right), exclusive.
- `<Leader>bb`/`<Leader>B` **🇳** - word/WORD backward(left), exclusive.
- `<Leader>e`/`<Leader>E` **🇳** - Forward to the end of word/WORD, inclusive.
- `<Leader>ge`/`<Leader>gE` **🇳** - Backward to the end of word/WORD, inclusive.

Support by [vim-wordmotion](https://github.com/chaoren/vim-wordmotion).

#### Better Repeat

Better repeat(`.`) operation, support by [vim-repeat](https://github.com/tpope/vim-repeat).

#### Better Surrounding(Quotes) Editing

Better surrounding(quotes) editing, support by [vim-surround](https://github.com/tpope/vim-surround).

#### Better Matching

Better matching include HTML tags, if-endif, and other things, support by [vim-matchup](https://github.com/andymass/vim-matchup).

#### Auto Pair and Close HTML Tag

Auto pair and close html tags, support by [auto-pairs](https://github.com/jiangmiao/auto-pairs) (switched to [nvim-autopairs](https://github.com/windwp/nvim-autopairs) on neovim 0.5+) and [vim-closetag](https://github.com/alvan/vim-closetag).

## Customization

Please check vim entry _~/.vimrc_ (_~/\_vimrc_ on windows), and neovim entry _~/.config/nvim/init.vim_ (_~/AppData/Local/nvim/init.vim_ on windows).
They load below vim files:

- Plugins (_~/.vim/plugins.vim_) - Vim plugins managed by [vim-plug](https://github.com/junegunn/vim-plug).
- Standalones (_~/.vim/standalone/\*.vim_) - Standalone vim settings.
- Repositories (_~/.vim/repository/{org}/{repo}.vim_) - Vim settings for each plugin.
- Colors (_~/.vim/color-settings.vim_) - Colorscheme settings.
- Other settings (_~/.vim/settings.vim_) - Other settings include coc extensions, gui font, global key mappings, etc.

For basic install mode, there's only standalone vim settings, see [More Options](#more-options).

# Appendix

## Embeded Language Servers

- C/C++
- Python3 (Python2 is not supported)
- Rust
- Go
- HTML/XML/Markdown
- CSS/SASS/SCSS/Less
- JSON
- Javascript/Typescript/JSX/TSX

## Color Schemes

- [solarized](https://github.com/lifepillar/vim-solarized8)
- [monokai](https://github.com/crusoexia/vim-monokai)
- [dracula](https://github.com/dracula/vim)
- [neodark](https://github.com/KeitaNakamura/neodark.vim)
- [srcery](https://github.com/srcery-colors/srcery-vim)
- [palenight](https://github.com/drewtempelmeyer/palenight.vim)
- [onedark](https://github.com/joshdick/onedark.vim)
- [rigel](https://github.com/Rigellute/rigel)
- [base16](https://github.com/chriskempson/base16-vim)
- [edge](https://github.com/sainnhe/edge)
- [gruvbox-material](https://github.com/sainnhe/gruvbox-material)
- [everforest](https://github.com/sainnhe/everforest)
- [sonokai](https://github.com/sainnhe/sonokai)
- [material](https://github.com/kaicataldo/material.vim)
- [nightfox](https://github.com/EdenEast/nightfox.nvim) (for neovim 0.5+)
- [github](https://github.com/projekt0n/github-nvim-theme) (for neovim 0.5+)
- [tokyonight](https://github.com/folke/tokyonight.nvim) (for neovim 0.6+)
- [kanagawa](https://github.com/rebelot/kanagawa.nvim) (for neovim 0.6+)

# Contribute

Please open issue/PR for anything about lin.vim.

Like lin.vim? Consider

<a href="https://www.buymeacoffee.com/linrongbin16" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

Or

<p align="center">
  <img alt="wechat-pay.jpeg" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/wechat-pay.jpeg" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="alipay.jpeg" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/alipay.jpeg" width="45%">
</p>
