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
  - [Hot Key](#hot-key)
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

- Time-costing vim configurations - All behaviors follow community's best practice and most popular editors(just like [vscode](https://code.visualstudio.com/)).
- Lack of IDE-like editing features - [Coc.nvim](https://github.com/neoclide/coc.nvim) and a bunch of language servers and extensions are embeded.
- Don't know how to choose/configure/manage vim plugins - All plugins are carefully selected and well cooperated for best performance and user experience, cover most modern editor features(again, just like vscode).
- Duplicate installation on different OS and machines - All done by one-line command(not on Windows for now), all installations behave the same(the only difference is use Command-Key on macOS instead of Alt-Key on Windows/Linux).
- Naive UI - Pretty colorschemes, icons, opened tabs, file explorer, file status integrated.

## Screenshots

#### Simple but pretty UI

![edit-markdown.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/edit-markdown.png)

#### Code complete for C++

![cplusplus-code-complete.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/cplusplus-code-complete.png)

#### Cursor movement

![fast-cursor-movement.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/fast-cursor-movement1.png)

#### Search text

![search-text.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-text.png)

#### Search files

![search-files.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-files.png)

#### Markdown preview

![markdown-preview.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/markdown-preview1.png)

### Feature

- One-line command installation (not on windows for now).
- Work on multiple OS platforms:
  - Windows.
  - macOS.
  - Linux(Ubuntu/Debian/Fedora/Manjaro).
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
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim
    $ cd ~/.vim
    $ ./install.sh
```

`install.sh` will automatically install below dependencies with system package manager:

- [git](https://git-scm.com/).
- [vim](https://github.com/vim/vim) and [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).
- [clang](https://clang.llvm.org/)(for macOS) or [gcc](https://gcc.gnu.org/)(for linux), [make](https://www.gnu.org/software/make/), [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/), [cmake](https://cmake.org/), linux also need [autoconf](https://www.gnu.org/software/autoconf/) and [automake](https://www.gnu.org/software/automake/).
- [python3](https://www.python.org/) (python 2.x is not support) and some pip packages.
- [node.js](https://nodejs.org/) and some npm packages.
- [golang](https://go.dev/).
- [rust](https://www.rust-lang.org/) and some modern commands.
- [curl](https://curl.se/) and [wget](https://www.gnu.org/software/wget/).
- [universal-ctags](https://github.com/universal-ctags/ctags).
- [hack nerd font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip).

For now supported platforms are:

- Debian/ubuntu based linux: use `apt` as software installer.
- Fedora/centos based linux: use `dnf` as software installer.
- Archlinux based linux: use `pacman` as software installer.
- MacOS: use `brew` as software installer, please install [Xcode](https://guide.macports.org/chunked/installing.html) and [homebrew](https://brew.sh/) as pre-requirements.

Other \*NIX systems such as gentoo, bsd are not supported yet.

## Windows

1. Install [Visual Studio](https://www.visualstudio.com/) with below 3 components:

   - .NET Desktop Development
   - Desktop development with C++
   - Universal Windows Platform development

![install-windows-visual-studio.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-visual-studio.png)

2. Install [64-bit Git for Windows Setup](https://git-scm.com/downloads) with below 3 options:

   - In the **Select Components** step, select **Associate .sh files to be run with Bash**.
   - In the **Adjusting your PATH environment** step, select **Use Git and optional Unix tools from the Command Prompt**.
   - In the **Configuring the terminal emulator to use with Git Bash** step, select **Use Windows's default console window**. This will add `git.exe` and linux builtin commands (such as `bash.exe`, `cp.exe`, `mv.exe`, `cd.exe`, `ls.exe`, etc) to `$env:Path`, provide MSYS linux environment.

![install-windows-git-step1.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-step1.png)
![install-windows-git-step2.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-step2.png)
![install-windows-git-step3.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-step3.png)

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
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```

Notice:

1. If you are using WSL, `C:\Windows\System32\bash.exe` could lead you to WSL instead of the `bash.exe` from [Git for Windows](https://git-scm.com/). Make sure git path is ahead of `C:\Windows\System32`, so git bash will be first detected (`wsl.exe` could connect to WSL as well so no need to worry about losing `C:\Windows\System32\bash.exe`).

![install-windows-notice-git-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-git-path.png)

2. [Git for Windows](https://git-scm.com/) provide an old-version `vim.exe`, make sure `gvim.exe` (from [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases)) path is ahead of git, so `vim.exe` from [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases) will be first detected. You could also only use `gvim.exe` to avoid the old-version vim.

![install-windows-notice-vim-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-vim-path.png)

3. Python3 version must be compatible with gvim's libpython3.lib, or python3 will not be loaded correctly. Please use `gvim --version` to find its libpython3.lib version.

![install-windows-notice-python3-version-compatible.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-python3-version-compatible.png)

4. Disable Windows App alias `python.exe` or `python3.exe`, this could lead you to the wrong python from windows store. See: [Manage App Execution Aliases on Windows10](https://www.thewindowsclub.com/manage-app-execution-aliases-on-windows-10) and [Default app aliases in windows](https://github.com/0install/0install-dotnet/issues/69).

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
- `--disable-ctrl-keys`: disable windows behaviour, such as ctrl+{a,s,x,c,v} keys, etc.
- `--disable-plugin=TEXT`: disable specific vim plugin in format 'organization/repository', this is a multiple option. For example: `--disable-plugin=RRethy/vim-hexokinase --disable-plugin=alvan/vim-closetag`.
- `--disable-vim`: don't install .vimrc file for vim, could use neovim only.
- `--disable-neovim`: don't install nvim/init.vim file for neovim, could use vim only.

Windows `install.ps1` especially provide two more options:

- `--depends=TEXT`: download and install the specific third party dependency in 3rd step of [windows installation](#windows). Use `--depends=all` will run for all these dependencies. For example: `--depends=vim`, `--depends=universal-ctags`.
- `--nerdfont=TEXT`: download the specific [nerd font](https://github.com/ryanoasis/nerd-fonts/releases/latest) for you. For example: `--nerdfont=Hack`, `--nerdfont=SourceCodePro`.

> Use a package manager (such as [chocolatey](https://chocolatey.org/) and [scoop](https://scoop.sh/)) could be a better choice, just make sure they're available in `$env:Path`.

Notice:

- In full mode, you could use '--disable-xxx' options to disable some specific features.
- Option '--disable-highlight --disable-color --disable-language --disable-editing' is equivalent to '--limit'.

## Upgrade

For this distribution, please re-install by:

```bash
    $ cd ~/.vim
    $ git pull origin master
    $ ./install.sh
```

For vim plugins, please open (neo)vim and update by:

```vim
    :PlugUpdate!
```

# User Guide

In this section, vim editing mode are specified with:

- [**N**] - Normal mode.
- [**V**] - Visual mode.
- [**I**] - Insert mode.

Meta-key(or alt-key on windows/linux) and command-key(on macOS) are collectively refered as:

- `M`

## Hot Key

- `F1` [**N**] - Toggle file explorer, see [Simple but pretty UI](#simple-but-pretty-ui).
- `F2` [**N**] - Toggle undo tree.
- `F3` [**N**] - Toggle vista outline/tags, see [Code complete for C++](#code-complete-for-c).
- `F4` [**N**] - Switch between C/C++ header and source files.
- `F7` [**N**] - Toggle git blame info on current line.
- `F8` [**N**] - Open markdown preview.
- `F9` [**N**] - Random select next colorscheme, see [Screenshots](#screenshots).
- `F10` [**N**] - Toggle buffers explorer.

You could configure these keys in **_~/.vim/settings.vim_**.

## UI

#### File Explorer

File explorer is support by [fern.vim](https://github.com/lambdalisue/fern.vim) (switched to [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) on neovim 0.7+).

Navigation:

- `h` [**N**] - Collapse directory.
- `l` [**N**] - Expand directory or open file.
- `<CR>` [**N**] - Cd into directory.
- `<BS>` [**N**] - Go to upper directory and leave directory.
- `e` [**N**] - Open file in `split`.
- `E` [**N**] - Open file in `vsplit`.
- `t` [**N**] - Open file in new tab.

Create/rename/delete:

- `N`/`a` [**N**] - Create new file. Notice `a` is not working on fern.vim, since it's forcely mapped to '<Plug>(fern-action-choice)' instead of '<Plug>(fern-action-new-file)'.
- `A` [**N**] - Create new directory. Notice nvim-tree.lua need an additional slash `/`(or `\`) after directory name (see: [nvim-tree.lua - Tips & tricks](https://github.com/nvim-tree/nvim-tree.lua#tips--tricks)), while fern.vim just need directory name itself.
- `m`/`r` [**N**] - Move or rename file/directory.
- `d` [**N**] - Trash file/directory to system trash-bin, only for windows/macOS.
- `D` [**N**] - Delete file/directory, usually `rm`.

Copy/paste/cut:

- `C` [**N**] - Copy file/directory into an internal clipboard, just like in Windows ctrl+c.
- `X` [**N**] - Cut file/directory into an internal clipboard, just like in Windows ctrl+x.
- `V` [**N**] - Paste file/directory from an internal clipboard to current directory, just like in Windows ctrl+v.

Adjust explorer width:

- `<M-.>`/`<M-Right>` [**N**] - Make explorer bigger size.
- `<M-,>`/`<M-Left>` [**N**] - Make explorer smaller size.

Other:

- `R` [**N**] - Refresh file explorer.
- `s` [**N**] - Open file in system file manager(such as Finder in macOS).
- `?` [**N**] - Toggle help.

_For neovim 0.7+ only_:

- `I` [**N**] - Toggle file info.
- `H` [**N**] - Toggle hidden dot files.
- `<` [**N**] - Goto previous(up) sibling.
- `>` [**N**] - Goto next(down) sibling.
- `K` [**N**] - Goto first(top) sibling.
- `J` [**N**] - Goto last(bottom) sibling.
- `P` [**N**] - Goto parent(upper) directory.
- `y` [**N**] - Copy file name as literal.
- `Y` [**N**] - Copy absolute file path as literal.
- `]c` [**N**] - Goto next(down) git chunk.
- `[c` [**N**] - Goto previous(up) git chunk.

You could editing **_~/.vim/repository/lambdalisue/fern.vim.vim_** (or **_~/.vim/repository/kyazdani42/nvim-tree.lua.vim_**) to customize key mappings. Please refer to [fern.vim - wiki - Mappings](https://github.com/lambdalisue/fern.vim/wiki/Mappings) (or [:help nvim-tree-mappings](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)) for more information.

#### Tabline

- `<Leader>bn`/`<M-Right>`/`<M-.>` [**N**] - Go to next(right) buffer.
- `<Leader>bp`/`<M-Left>`/`<M-,>` [**N**] - Go to previous(left) buffer.
- `<Leader>bd` [**N**] - Close current buffer without closing vim window.

Navigation:

- `<M-1>` [**N**] - Go to buffer-1.
- `<M-2>` [**N**] - Go to buffer-2.
- `<M-3>` [**N**] - Go to buffer-3.
- `<M-4>` [**N**] - Go to buffer-4.
- `<M-5>` [**N**] - Go to buffer-5.
- `<M-6>` [**N**] - Go to buffer-6.
- `<M-7>` [**N**] - Go to buffer-7.
- `<M-8>` [**N**] - Go to buffer-8.
- `<M-9>` [**N**] - Go to buffer-9.
- `<M-0>` [**N**] - Go to buffer-10 (or the last buffer on neovim 0.7+).

_For neovim 0.7+ only_:

- `<M-S-Right>` [**N**] - Re-order(move) current buffer to next(right) position.
- `<M-S-Left>` [**N**] - Re-order(move) current buffer to previous(left) position.
- `<LeftMouse>` [**N**] - Go to target buffer.
- `<MiddleMouse>` [**N**] - Close target buffer.

Support by [vim-buffet](https://github.com/bagrat/vim-buffet) (switched to [barbar.nvim](https://github.com/romgrk/barbar.nvim) on neovim 0.5+).

#### Font

By default [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/releases) is enabled. Please install other nerd fonts and edit **_~/.vim/settings.vim_** to customize fonts.

## IDE-like Editing

#### Code Complete

- `<C-n>`/`<Down>` [**I**] - Navigate to next suggestion.
- `<C-p>`/`<Up>` [**I**] - Navigate to previous suggestion.
- `<TAB>`/`<CR>` [**I**] - Confirm current suggestion.
- `<ESC>`/`<C-[>` [**I**] - Close suggestion.
- `<C-f>` [**I**] - Navigate to next(right) snippet placeholder.
- `<C-b>` [**I**] - Navigate to previous(left) snippet placeholder.

#### Jumps

- `[d` [**N**] - Go to previous(up) diagnostic location.
- `]d` [**N**] - Go to next(down) diagnostic location.
- `gd` [**N**] - Go to definition.
- `gl` [**N**] - Go to declaration.
- `gy`/`gt` [**N**] - Go to type definition.
- `gi` [**N**] - Go to implemention.
- `gr` [**N**] - Go to references.

#### Symbols

- `K` [**N**] - Show hover information.
- `<Leader>rs` [**N**] - Rename symbol.

#### Code Format

- `<Leader>cf` [**N**] - Format code on whole buffer in normal mode.
- `<Leader>cf` [**V**] - Format selected code in visual mode.

#### Code Actions

- `<Leader>ca` [**N**] - Run code actions under cursor in normal mode.
- `<Leader>ca` [**V**] - Run code actions on selected code in visual mode.
- `<Leader>qf` [**N**] - Apply quick fix for diagnostics on current line.

#### CodeLens

- `<Leader>cl` [**N**] - Run the CodeLens on current line.

#### Git

- `]c` [**N**] - Go to next(down) git chunk in current buffer.
- `[c` [**N**] - Go to previous(up) git chunk in current buffer.

_For neovim 0.5+ only_:

- `<Leader>gb` [**N**] - Toggle git blame info for current line.

### Search

Search engine use fzf.vim and integrated with coc.nvim with [coc-fzf](https://github.com/antoinemadec/coc-fzf). All fzf commands are configured with prefix **Fzf**, for example `:Files` are renamed to `:FzfFiles`, `:Rg` are renamed to `:FzfRg`.

#### Text Search

- `<Space>gr` [**N**] - Search text by `:FzfRg`.
- `<Space>l` [**N**] - Search lines on opened buffers by `:FzfLines`.
- `<Space>t` [**N**] - Search tags by `:FzfTags`.
- `<Space>y` [**N**] - Search yank history by `:CocFzfList yank`.
- `<Space>sh` [**N**] - Search searched history by `:FzfHistory/`.
- `<Space>ch` [**N**] - Search vim command history by `:FzfHistory:`.

#### File Search

- `<Space>f`/`<C-p>` [**N**] - Search files by `:FzfFiles`.
- `<Space>b` [**N**] - Search opened buffers by `:FzfBuffers`.
- `<Space>hf` [**N**] - Search history files (v:oldfiles) and opened buffers by `:FzfHistory`.

#### Git Search

- `<Space>gc` [**N**] - Search git commits by `:FzfCommits`.
- `<Space>gf` [**N**] - Search git files rby `:FzfGFile`.
- `<Space>gs` [**N**] - Search git status (also diff files by preview) by `:FzfGFiles?`.

#### Other Search

- `<Space>mk` [**N**] - Search marks by `:FzfMarks`.
- `<Space>mp` [**N**] - Search normal mode vim key mappings by `:FzfMaps`.
- `<Space>vc` [**N**] - Search vim commands by `:FzfCommands`.
- `<Space>ht` [**N**] - Search help tags by `:FzfHelptags`.

#### Coc.nvim Search

Key mappings are configured with prefix char `c` after `<Space>`.

- `<Space>cs` [**N**] - Search coc symbols by `:CocFzfList symbols`.
- `<Space>cd` [**N**] - Search coc diagnostics by `:CocFzfList diagnostics`.
- `<Space>co` [**N**] - Search coc outlines(tags) by `:CocFzfList outline`.
- `<Space>cc` [**N**] - Search coc commands by `:CocFzfList commands`.
- `<Space>cl` [**N**] - Search coc location by `:CocFzfList location`.

Please visit [fzf.vim](https://github.com/junegunn/fzf.vim) and [coc-fzf](https://github.com/antoinemadec/coc-fzf) for more information.

## Editing Enhancement

#### Easy Comment

Linewise comment:

- `gcc` [**N**] - Toggle current line.
- `[count]gcc` [**N**] - Toggle _[count]_ number of lines.
- `gc{motion}` [**N**] - Toggle two lines with motion(jk).
- `gc[count]{motion}` [**N**] - Toggle region with _[count]_(optional) times motion.
- `gc` [**V**] - Toggle selected region in virual mode.

_Blockwise comment (for neovim only)_:

- `gbc` [**N**] - Toggle current line.
- `[count]gbc` [**N**] - Toggle _[count]_ number of lines.
- `gb{motion}` [**N**] - Toggle two lines with motion.
- `gb[count]{motion}` [**N**] - Toggle region with _[count]_(optional) times motion.
- `gb` [**V**] - Toggle selected region in virual mode.

Support by [tcomment_vim](https://github.com/tomtom/tcomment_vim) (switched to [Comment.nvim](https://github.com/numToStr/Comment.nvim) on neovim).

#### Cursor Motion

See [Cursor movement](#cursor-movement).

- `<Leader>f{char}` [**N**] - Move by a single {char}.
- `<Leader>s{char}{char}` [**N**] - Move by two consequent {char}{char}.
- `<Leader>w` [**N**] - Move by word.
- `<Leader>l` [**N**] - Move by line.

Support by [vim-easymotion](https://github.com/easymotion/vim-easymotion) (switched to [hop.nvim](https://github.com/phaazon/hop.nvim) on neovim 0.5+).

#### Word Movement

(Neo)vim word movement cannot recognize real literal word, such as camel case, mixed digits, characters, punctuations, etc.
So introduce better word motions:

- `<Leader>w`/`<Leader>W` [**N**] - word/WORD forward(right), exclusive.
- `[count]<Leader>w`/`[count]<Leader>W` [**N**] - _[count]_ words/WORDS forward, exclusive.
- `<Leader>e`/`<Leader>E` [**N**] - Forward to the end of word/WORD, inclusive.
- `[count]<Leader>e`/`[count]<Leader>E` [**N**] - Forward to the end of _[count]_ words/WORDS, inclusive.
- `<Leader>b`/`<Leader>B` [**N**] - word/WORD backward(left), exclusive.
- `[count]<Leader>b`/`[count]<Leader>B` [**N**] - _[count]_ words/WORDS backward.
- `<Leader>ge`/`<Leader>gE` [**N**] - Backward to the end of word/WORD, inclusive.
- `[count]<Leader>ge`/`[count]<Leader>gE` [**N**] - Backward to the end of _[count]_ words/WORDS, inclusive.

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

Please edit plugins in `~/.vim/plugins.vim`, settings in `~/.vim/settings.vim` and coc settings in `~/.vim/coc-settings.json`.

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
