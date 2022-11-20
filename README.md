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
    - [Code Lens](#code-lens)
    - [Git](#git)
  - [Search](#search)
    - [Text Search](#text-search)
    - [File Search](#file-search)
    - [Git Search](#git-search)
    - [Other Search](#other-search)
    - [Coc.nvim Search](#cocnvim-search)
  - [Editing Enhancement](#editing-enhancement)
    - [Enhanced Copy Paste](#enhanced-copy-paste)
    - [Cursor Motion](#cursor-motion)
    - [Word Movement](#word-movement)
    - [Better Repeat](#better-repeat)
    - [Better Surrounding(Quotes) Editing](#better-surroundingquotes-editing)
    - [Better Pair and HTML Tag Matching](#better-pair-and-html-tag-matching)
    - [Auto Pair and Close HTML Tag](#auto-pair-and-close-html-tag)
    - [Easy Comment](#easy-comment)
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
- Don't know how to choose/configure/manage vim plugins: All plugins are carefully selected and well cooperated for best performance and user experience, cover most modern editor features(again, just like vscode).
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

Before installation, please make sure access of below sites are available:

- [github.com](https://github.com/).
- [raw.githubusercontent.com](https://raw.githubusercontent.com/).
- [www.rust-lang.org](https://www.rust-lang.org/).
- [crates.io](https://crates.io/).
- [go.dev](https://go.dev/).
- [storage.googleapis.com](https://storage.googleapis.com).

## UNIX/Linux/MacOS

> `install.sh` will automatically install below softwares with system package managers:
>
> - [git](https://git-scm.com/).
> - [vim](https://github.com/vim/vim) and [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).
> - [clang](https://clang.llvm.org/)(for macOS) or [gcc](https://gcc.gnu.org/)(for linux), [make](https://www.gnu.org/software/make/), [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/), [cmake](https://cmake.org/), linux also need [autoconf](https://www.gnu.org/software/autoconf/) and [automake](https://www.gnu.org/software/automake/).
> - [python3](https://www.python.org/) (python 2.x is not support) and some pip packages.
> - [node.js](https://nodejs.org/) and some npm packages.
> - [golang](https://go.dev/).
> - [rust](https://www.rust-lang.org/) and some modern commands.
> - [curl](https://curl.se/) and [wget](https://www.gnu.org/software/wget/).
> - [universal-ctags](https://github.com/universal-ctags/ctags).
> - [hack nerd font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip).
>
> For now supported platforms are:
>
> - Debian/ubuntu based linux: use `apt` as software installer.
> - Fedora/centos based linux: use `dnf` as software installer.
> - Archlinux based linux: use `pacman` as software installer.
> - MacOS: use `brew` as software installer, please install [Xcode](https://guide.macports.org/chunked/installing.html) and [homebrew](https://brew.sh/) as pre-requirements.
>
> Other \*NIX systems such as gentoo, bsd are not supported yet.

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim
    $ cd ~/.vim
    $ ./install.sh
```

## Windows

> The goal of installation on windows is to install native executable file, no [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) nor [MYSY2](https://www.msys2.org/) for below reasons:
>
> - Native executable file has better performance, WSL (actually a virtual machine) is quite slow and heavy.
> - [Git for Windows](https://git-scm.com) already contains MYSY2 and provide Unix/Linux builtin commands, we could leverage that.

1. Install [Visual Studio](https://www.visualstudio.com/) with below 3 components checked:

   - .NET Desktop Development
   - Visual C++ Desktop Development (Desktop development with C++)
   - Common Windows Platform Development (Universal Windows Platform development)

![install-windows-visual-studio.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-visual-studio.png)

2. Install [64-bit Git for Windows Setup](https://git-scm.com/downloads) with especially below 3 options checked:

   1. In the **Select Components** step, check **Associate .sh files to be run with Bash**.
   2. In the **Adjusting your PATH environment** step, choose **Use Git and optional Unix tools from the Command Prompt**.
   3. In the **Configuring the terminal emulator to use with Git Bash** step, choose **Use Windows's default console window**.

![install-windows-git-step1.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-step1.png)
![install-windows-git-step2.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-step2.png)
![install-windows-git-step3.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-git-step3.png)

This will add both `git.exe` and linux builtin commands (such as `bash.exe`, `cp.exe`, `mv.exe`, `cd.exe`, `ls.exe`, etc) in `$env:Path`, turn command prompt and powershell to a linux-like shell, thus help (neo)vim plugins running correctly.

3. Install other dependencies (x64 is preferred):

   - [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases): add `gvim.exe` to `$env:Path`
   - [neovim](https://github.com/neovim/neovim/releases): add `nvim.exe` to `$env:Path`
   - [cmake](https://cmake.org/download/): add `cmake.exe` to `$env:Path`
   - [make-for-win32](http://gnuwin32.sourceforge.net/packages/make.htm): add `make.exe` to `$env:Path`
   - [python3](https://www.python.org/downloads/): since python3 installer don't provide `python3.exe` and `pip3.exe`, manually copy `python.exe` as `python3.exe`, copy `pip.exe` as `pip3.exe`, then add to `$env:Path`.
   - [rust](https://www.rust-lang.org/tools/install): add `rustc.exe`, `cargo.exe` to `$env:Path`
   - [golang](https://go.dev/dl/): add `go.exe` to `$env:Path`
   - [nodejs](https://nodejs.org/en/download/): add `node.exe`, `npm.exe` to `$env:Path`
   - [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases): add `ctags.exe`, `readtags.exe` to `$env:Path`

Use package manager (such as [chocolatey](https://chocolatey.org/) and [scoop](https://scoop.sh/)) could be a better choice, just make sure they're available in `$env:Path`.

4. Install [Hack NFM](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip).
5. Finally run below commands as administrator in powershell:

```powershell
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```

#### Notice

1. If you are using WSL, `C:\Windows\System32\bash.exe` could lead you to WSL instead of the `bash.exe` provided by [Git for Windows](https://git-scm.com/). Make sure git environment path is ahead of `C:\Windows\System32` (`wsl.exe` could connect to WSL as well, so no need to worry about losing `bash.exe`), so git bash will be first detected on `$env:Path`.

![install-windows-notice-git-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-git-path.png)

2. Python3 version must be compatible with gvim's libpython3.so version, or it will not been loaded. Please use `gvim --version` to find its libpython3.so version.

![install-windows-notice-python3-version-compatible.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-python3-version-compatible.png)

3. Don't use old-version `vim.exe` provided by [Git for Windows](https://git-scm.com/), use `gvim.exe` provided by [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases). Or you could move `gvim.exe` environment path ahead of [Git for Windows](https://git-scm.com/), this could make sure `vim.exe` from [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases) be first detected on `$env:Path`.

![install-windows-notice-vim-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-vim-path.png)

4. Disable Windows App alias `python.exe` or `python3.exe`, this could lead you to the wrong python provide by windows application store. Please see: [Manage App Execution Aliases on Windows10](https://www.thewindowsclub.com/manage-app-execution-aliases-on-windows-10) and [Default app aliases in windows](https://github.com/0install/0install-dotnet/issues/69).

## More Options

The `install.sh` (and `install.ps1`) provide 3 installation modes:

- Full mode (default mode): with `./install.sh`, it install all features for best user experience, which consumes unignorable CPU, memory, disk and graphics.
- Limit mode: for low performance devices (such as old PC). With `./install.sh --limit`, it disable extra highlights, colorschemes, language support and editing enhancements.
- Basic mode: for extremely restricted environment (such as production environment), which has limited network access or user authentication. With `./install.sh --basic`, it only install pure vim configurations, without any third party softwares or vim plugins.

And many options:

- Static colorscheme: `--static-color=TEXT` make colorscheme static, instead of random selection on startup. For example: `--static-color=darkblue`.
- Disable colors: `--disable-color` disable colorscheme, and random selection on startup.
- Disable highlights: `--disable-highlight` disable extra highlights. Such as RGB and same word mark under cursor, etc.
- Disable language support: `--disable-language` disable language support. Such as auto complete and language servers, etc.
- Disable editing enhancement: `--disable-editing` disable editing enhancements. Such as easy comment, cursor motion, etc.
- Disable windows ctrl keys: `--disable-ctrl-keys` disable windows behaviour. Such as ctrl+{a,s,x,c,v} keys, etc.
- Disable vim plugins: `--disable-plugin=TEXT` disable vim plugins from github specified as 'organization/repository', this ption could be used multiple times. For example: `--disable-plugin=RRethy/vim-hexokinase --disable-plugin=alvan/vim-closetag`.
- No .vimrc for vim: `--disable-vim` don't install .vimrc file for vim, use neovim only.
- No nvim/init.vim for neovim: `--disable-neovim` don't install nvim folder and nvim/init.vim file for neovim, use vim only.

Notice:

- In full mode, you could use '--disable-xxx' options to disable some specific features.
- Option '--disable-highlight --disable-color --disable-language --disable-editing' is equivalent to '--limit'.

# User Guide

In this section, vim editing mode are specified with:

- [**N**] - Normal mode.
- [**V**] - Visual mode.
- [**I**] - Insert mode.

Meta-key(`M`, or alt-key `A`) on windows/linux and command-key(`D`) on macOS are collectively refered to meta-key, specified with:

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

- `C` [**N**] - Copy file/directory into an internal clipboard, just like in Windows ctrl-c.
- `X` [**N**] - Cut file/directory into an internal clipboard, just like in Windows ctrl-x.
- `V` [**N**] - Paste file/directory from an internal clipboard to current directory, just like in Windows ctrl-v.

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

- `<Leader>ca` [**N**] [**V**] - Run code actions under cursor or visual selected code.
- `<Leader>qf` [**N**] - Apply quick fix on current line.

#### Code Lens

- `<Leader>cl` [**N**] - Run code lens on current line.

#### Git

- `]c` [**N**] - Go to next(down) git chunk in current buffer.
- `[c` [**N**] - Go to previous(up) git chunk in current buffer.

_For neovim 0.5+ only_:

- `<Leader>gb` [**N**] - Toggle git blame info on current line.

### Search

Search engine use fzf.vim and integrated with coc.nvim with [coc-fzf](https://github.com/antoinemadec/coc-fzf). All fzf commands are configured with prefix **Fzf**, for example `:Files` are renamed to `:FzfFiles`, `:Rg` are renamed to `:FzfRg`.

#### Text Search

- `<Space>gr` [**N**] - Search text by `:FzfRg`.
- `<Space>l` [**N**] - Search lines on opened buffers by `:FzfLines`.
- `<Space>t` [**N**] - Search tags by `:FzfTags`.
- `<Space>y` [**N**] - Search yank history by `:CocFzfList yank`.
- `<Space>sh` [**N**] - Search search history by `:FzfHistory/`.
- `<Space>ch` [**N**] - Search vim command history by `:FzfHistory:`.

#### File Search

- `<Space>f`/`<C-p>` [**N**] - Search files by `:FzfFiles`.
- `<Space>b` [**N**] - Search opened buffers by `:FzfBuffers`.
- `<Space>hf` [**N**] - Search history files (v:oldfiles) and opened buffers by `:FzfHistory`.

#### Git Search

- `<Space>gc` [**N**] - Search git commits by `:FzfCommits`.
- `<Space>gf` [**N**] - Search git files rby `:FzfGFile`.
- `<Space>gs` [**N**] - Search git status(also diff files by preview) by `:FzfGFiles?`.

#### Other Search

- `<Space>mk` [**N**] - Search marks by `:FzfMarks`.
- `<Space>mp` [**N**] - Search normal mode vim key mappings by `:FzfMaps`.
- `<Space>vc` [**N**] - Search vim commands by `:FzfCommands`.
- `<Space>ht` [**N**] - Search help tags by `:FzfHelptags`.

#### Coc.nvim Search

Key mappings are configured with prefix char `c` after `<Space>`.

- `<Space>cs` [**N**] - Search symbols by `:CocFzfList symbols`.
- `<Space>cd` [**N**] - Search diagnostics by `:CocFzfList diagnostics`.
- `<Space>co` [**N**] - Search outline/tags by `:CocFzfList outline`.
- `<Space>cc` [**N**] - Search commands by `:CocFzfList commands`.
- `<Space>cl` [**N**] - Search location by `:CocFzfList location`.

Please visit [fzf.vim](https://github.com/junegunn/fzf.vim) and [coc-fzf](https://github.com/antoinemadec/coc-fzf) for more information.

## Editing Enhancement

#### Enhanced Copy Paste

When copy/paste without system clipboard support, you could first write content to a cache, then paste cache to another vim instance:

- `<Leader>y` [**V**] - Copy visual selected text to `~/.vim/.copypaste`.
- `<Leader>p` [**N**] - Paste text saved from `~/.vim/.copypaste`.

You could configure these key mappings in **_~/.vim/standalone/copypaste.vim_**.

#### Cursor Motion

See [Cursor movement](#cursor-movement).

- `<Leader>f{char}` [**N**] - Move by a single {char}.
- `<Leader>s{char}{char}` [**N**] - Move by two consequent {char}{char}.
- `<Leader>w` [**N**] - Move by word.
- `<Leader>l` [**N**] - Move by line.

Support by [vim-easymotion](https://github.com/easymotion/vim-easymotion) (switched to [hop.nvim](https://github.com/phaazon/hop.nvim) on neovim 0.5+).

#### Word Motion

`w`/`b` will not recognize a real literal word on (neo)vim, so introduce `W`/`B`/`E`/`gE` to do this:

- `W` [**N**] - Move forward(right) to a single literal word.
- `B` [**N**] - Move backward(left) to a single literal word.
- `E` [**N**] - Move forward to the end of a single literal word.
- `gE` [**N**] - Move backward to the end of a single literal word.

Support by [vim-wordmotion](https://github.com/chaoren/vim-wordmotion).

#### Better Repeat

Better repeat(`.`) operation, support by [vim-repeat](https://github.com/tpope/vim-repeat).

#### Better Surrounding(Quotes) Editing

Better surrounding(quotes) editing, support by [vim-surround](https://github.com/tpope/vim-surround).

#### Better Pair and HTML Tag Matching

Better brackets(HTML tag) matching, support by [vim-matchup](https://github.com/andymass/vim-matchup).

#### Auto Pair and Close HTML Tag

Auto pair and close html tags, support by [auto-pairs](https://github.com/jiangmiao/auto-pairs) (switched to [nvim-autopairs](https://github.com/windwp/nvim-autopairs) on neovim 0.5+) and [vim-closetag](https://github.com/alvan/vim-closetag).

#### Easy Comment

- `gcc` [**N**] - toggle current line using linewise comment.
- `gc{motion}` [**N**] - toggle from current line with motion (jkhl) using linewise comment.
- `gc<count>{motion}` [**N**] - toggle from current line with motion repeat _<count>_ times using linewise comment.
- `gc` [**V**] - toggle visual selected code using linewise comment.

Support by [tcomment_vim](https://github.com/tomtom/tcomment_vim) (switched to [Comment.nvim](https://github.com/numToStr/Comment.nvim) on neovim).

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
- [tokyonight](https://github.com/folke/tokyonight.nvim) (for neovim 0.5+)
- [github](https://github.com/projekt0n/github-nvim-theme) (for neovim 0.5+)
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
