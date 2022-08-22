# lin.vim : Lin Rongbin's (Neo)vim Distribution

lin.vim is a highly configured [vim](https://www.vim.org/)/[neovim](https://neovim.io/) integrated tons of utilities for development, inspired by [spf13-vim](https://github.com/spf13/spf13-vim).

_[Neovim](https://neovim.io/) 0.7+ is highly recommended for best experience and performance._

_[Neovide](https://github.com/neovide/neovide) is highly recommended as a super fast GUI client for neovim._

# Table of Contents

- [Introduction](#introduction)
  - [Screenshots](#screenshots)
  - [Feature](#feature)
- [Installation](#installation)
  - [UNIX/Linux/MacOS](#unixlinuxmacos)
  - [Windows](#windows)
- [User Guide](#user-guide)
  - [Hot Key](#hot-key)
  - [UI](#ui)
    - [File Explorer](#file-explorer)
    - [Buffers/Tabs](#bufferstabs)
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
    - [Coc.nvim Search](#coc-nvim-search)
  - [Editing Enhancement](#editing-enhancement)
    - [Enhanced Copy Paste](#enhanced-copy-paste)
    - [Fast Cursor Movement](#fast-cursor-movement)
    - [Word Movement](#word-movement)
    - [Fast Repeat](#fast-repeat)
    - [Fast Quotes Operation](#fast-quotes-operation)
    - [Match Brackets and HTML Tags](#match-brackets-and-html-tags)
    - [Auto Close Brackets and HTML Tags](#auto-close-brackets-and-html-tags)
    - [Easy Comment](#easy-comment)
  - [Customization](#customization)
- [Embeded Language Servers](#embeded-language-servers)
- [Reference](#reference)
- [Contribute](#contribute)

# Introduction

Aim to be out of box, IDE-like editing experience, high performance, light weight and friendly to most users.

Focus on and only on editing, no compiling/packaging/debuging.

Solve below issues:

- Difficulty to choose/coordinate/configure plugins: embeded a set of plugins and well configured.
- Duplicate installation on different OS and machines: all done by one line command (not on Windows for now).
- Goal and non-goal: plugins are chosen carefully for best performance, while try to cover most modern editor features just like [vscode](https://code.visualstudio.com/).
- Naive UI-looking: pretty colorschemes/UI/icons integrated.
- Customization: `plugin.vim`, `setting.vim` and `coc-settings.json` files provided for special needs.

## Screenshots

#### Simple but pretty UI

![edit-markdown.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/edit-markdown.png)

#### Code complete for C++

![cplusplus-code-complete.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/cplusplus-code-complete.png)

#### Fast cursor movement

![fast-cursor-movement.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/fast-cursor-movement.jpg)

#### Search text

![search-text.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-text.png)

#### Search files

![search-files.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-files.png)

#### Markdown preview

![markdown-preview.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/markdown-preview.jpg)

### Feature

- Automatically installation (not on windows for now).
- Works on multiple OS platforms:
  - Windows.
  - macOS.
  - Linux(Ubuntu/Debian/Fedora/Manjaro).
- Support both [vim](https://www.vim.org/) and [neovim](https://neovim.io/), neovim 0.7+ is strongly recommended for best performance and experience.
- Modern editor UI features:
  - File explorer.
  - Icons.
  - Color schemes (see [Color Schemes - Reference](#reference)) randomly selected on start.
  - Status line.
  - Tab line and buffer explorer.
  - Outline/Tags.
- IDE-like editing features supported by [coc.nvim](https://github.com/neoclide/coc.nvim), a bunch of language servers(see [Embeded Language Servers](#embeded-language-servers)) embeded by default:
  - Code complete.
  - Diagnostic.
  - Lint.
  - Code format.
  - Jump between symbols.
  - Code Actions.
  - Code Lens.
- Search engine features supported by [fzf.vim](https://github.com/junegunn/fzf.vim):
  - Text search on text/lines/tags/search-histories/command-histories/yank-histories.
  - File search on files/buffers/history-files.
  - Git search on commits/uncommit-changes.
  - Coc.nvim integrated search on symbols/outline/diagnostics/yank.
  - Other enhancement search on vim-marks/vim-key-mappings/vim-commands/help-tags.
- Other editing enahncements (see [Editing Enahncement](#editing-enhancement)).
- Custom configuration.

# Installation

Before installation, please make sure access of below domains are available:

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
> - [clang](https://clang.llvm.org/)(for macOS) or [gcc](https://gcc.gnu.org/)(for linux), [make](https://www.gnu.org/software/make/), [cmake](https://cmake.org/), linux also need [autoconf](https://www.gnu.org/software/autoconf/) and [automake](https://www.gnu.org/software/automake/).
> - [python3](https://www.python.org/) (python 2.x is not support) and some pip packages.
> - [node.js](https://nodejs.org/) and some npm packages.
> - [golang](https://go.dev/).
> - [rust](https://www.rust-lang.org/) and some modern commands.
> - [curl](https://curl.se/) and [wget](https://www.gnu.org/software/wget/).
> - [universal-ctags](https://github.com/universal-ctags/ctags).
> - [hack nerd font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip).
> - [unzip](https://linux.die.net/man/1/unzip), [bzip2](https://sourceforge.net/projects/bzip2/) and [p7zip](http://p7zip.sourceforge.net/).
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
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

## Windows

> The goal of installation on windows is to install native executable file, no [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) nor [MYSY2](https://www.msys2.org/) for below reasons:
>
> - Native executable file has better performance, WSL (actually a virtual machine) is quite slow and heavy.
> - Supporting WSL backend mode (like vscode) is too heavy development work.
> - [Git for Windows](https://git-scm.com) already contains MYSY2 and provide Unix/Linux builtin commands, we could leverage it.

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

   - [cmake](https://cmake.org/download/): add `cmake.exe` to `$env:Path`
   - [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases): add `gvim.exe` to `$env:Path`
   - [neovim](https://github.com/neovim/neovim/releases): add `nvim.exe`, `nvim-qt.exe` to `$env:Path`
   - [python3](https://www.python.org/downloads/): since python3 installer don't provide `python3.exe` and `pip3.exe`, manually copy `python.exe` as `python3.exe`, copy `pip.exe` as `pip3.exe`, then add to `$env:Path`.
   - [clang](https://releases.llvm.org/): add `clang.exe`, `clang++.exe`, `clangd.exe`, `clang-tidy.exe`, `clang-format.exe` to `$env:Path`
   - [make-for-win32](http://gnuwin32.sourceforge.net/packages/make.htm): add `make.exe` to `$env:Path`
   - [rust](https://www.rust-lang.org/tools/install): add `rustc.exe`, `cargo.exe` to `$env:Path`
   - [golang](https://go.dev/dl/): add `go.exe` to `$env:Path`
   - [nodejs](https://nodejs.org/en/download/): add `node.exe`, `npm.exe` to `$env:Path`
   - [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases): add `ctags.exe`, `readtags.exe` to `$env:Path`
   - [7-zip](https://www.7-zip.org/): add `7z.exe` to `$env:Path`.

Install with a package manager (such as [chocolatey](https://chocolatey.org/) and [scoop](https://scoop.sh/)) could be a better choice, just make sure they're available in `$env:Path`.

4. Install [Hack NF](https://github.com/ryanoasis/nerd-fonts/releases):

   - `Hack Bold Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Italic Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Regular Nerd Font Complete Mono Windows Compatible.ttf`

5. Finally run below commands in powershell:

```powershell
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```

#### Notice

1. If you are using WSL, `C:\Windows\System32\bash.exe` could lead you to WSL instead of the `bash.exe` provided by [Git for Windows](https://git-scm.com/). Make sure git environment path is ahead of `C:\Windows\System32` (`wsl.exe` could connect to WSL as well, so no need to worry about losing `bash.exe`), so git bash will be first detected on `$env:Path`.

![install-windows-notice-git-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-git-path.png)

2. Python3 version must be compatible with gvim's libpython3.so version, or it will not been loaded. Latest vim 8.2-9 is compiled with python3.10. Please use `gvim --version` to find its libpython3.so version.

![install-windows-notice-python3-version-compatible.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-python3-version-compatible.png)

3. Don't use old-version `vim.exe` provided by [Git for Windows](https://git-scm.com/), use `gvim.exe` provided by [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases). Or you could move `gvim.exe` environment path ahead of [Git for Windows](https://git-scm.com/), this could make sure `vim.exe` from [vim-win32-installer](https://github.com/vim/vim-win32-installer/releases) be first detected on `$env:Path`.

![install-windows-notice-vim-path.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/install-windows-notice-vim-path.png)

# User Guide

In this section, vim editing mode are specified with:

- 🄽 - Normal Mode
- 🅅 - Visual Mode
- 🄸 - Insert Mode

## Hot Key

- `F1` 🄽 - toggle(open/close) file explorer, see [Simple but pretty UI](#simple-but-pretty-ui).
- `F2` 🄽 - toggle(open/close) undo tree.
- `F3` 🄽 - toggle(open/close) vista outline/tags, see [Code complete for C++](#code-complete-for-c).
- `F4` 🄽 - switch between C/C++ header and source files.
- `F8` 🄽 - open markdown preview.
- `F9` 🄽 - change color theme randomly, see [Screenshots](#screenshots).
- `F10`/`SHIFT-F10` 🄽 - open/close(toggle) opened buffers explorer.

You could configure these keys in **_~/.vim/setting.vim_**.

## UI

#### File Explorer

Navigation:

- `h` 🄽 - collapse directory.
- `l` 🄽 - open or expand directory.
- `<CR>` 🄽 - open file or cd into directory.
- `<BS>` 🄽 - leave directory and goto upper directory.
- `e` 🄽 - open file in `split`.
- `E` 🄽 - open file in `vsplit`.
- `t` 🄽 - open file in new tab.

Create/Delete/Copy/Paste/Cut:

- `a`/`A` 🄽 - create new file/directory.
- `m`/`r` 🄽 - move/rename file/directory.
- `<C-c>` 🄽 - copy file/directory into internal clipboard just like in Windows.
- `<C-x>` 🄽 - cut file/directory into internal clipboard just like in Windows.
- `<C-v>` 🄽 - paste internal clipboard file/directory to current directory just like in Windows.
- `d` 🄽 - trash file/directory to system trash-bin, only works on Windows/macOS.
- `D` 🄽 - force delete file/directory, possiblely implemented with `rm`.
- `R` 🄽 - refresh file explorer.

Resize Width:

- `<A-Right>`(`<D-Right>`)/`<A-.>`(`<D-.>`) 🄽 - make explorer bigger.
- `<A-Left>`(`<D-Left>`)/`<A-,>`(`<D-,>`) 🄽 - make explorer smaller.

Others:

- `s` 🄽 - open file in system file manager(such as Finder in macOS).
- `?` 🄽 - open/close(toggle) help.

_For neovim 0.7+ only_:

- `P` 🄽 - preview file content.
- `I` 🄽 - preview file info.
- `H` 🄽 - toggle dotfiles hidden.
- `y` 🄽 - copy file name string.
- `Y` 🄽 - copy absolute file path string.

Support by [fern.vim](https://github.com/lambdalisue/fern.vim) (switched to [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) on neovim 0.7+), you could use key mappings on the file explorer left side:

You could editing **_~/.vim/setting/lambdalisue/fern.vim.vim_** (or **_~/.vim/setting/kyazdani42/nvim-tree.lua.vim_**) to customize key mappings.
Please refer to [fern.vim - wiki - Mappings](https://github.com/lambdalisue/fern.vim/wiki/Mappings) (or [nvim-tree.lua - README](https://github.com/kyazdani42/nvim-tree.lua)) for more key mappings.

#### Buffers/Tabs

- `<leader><tab>`/`<A-Right>`(`<D-Right>`)/`<A-.>`(`<D-.>`) 🄽 - go to next buffer on the right.
- `<leader><s-tab>`/`<A-Left>`(`<D-Left>`)/`<A-,>`(`<D-,>`) 🄽 - go to previous buffer on the left(Notice some terminal/GUI could eat **_Alt+,_** **_Alt+._** or **_Command+,_** **_Command+._**).
- `<leader>bd` 🄽 - close current buffer and go to a nearest buffer without closing vim window.
- `F10`/`SHIFT-F10` 🄽 - open/close(toggle) opened buffers explorer.

Alt-1 ~ Alt-9 are mapped to switch between 1 ~ 9 buffers, Alt-0 are mapped to navigate to the last buffer.
For macOS, Command-1 ~ Command-9 and Command-0 are configured for the same thing.

- `<A-1>`(`<D-1>`) 🄽 - go to buffer-1.
- `<A-2>`(`<D-2>`) 🄽 - go to buffer-2.
- `<A-3>`(`<D-3>`) 🄽 - go to buffer-3.
- `<A-4>`(`<D-4>`) 🄽 - go to buffer-4.
- `<A-5>`(`<D-5>`) 🄽 - go to buffer-5.
- `<A-6>`(`<D-6>`) 🄽 - go to buffer-6.
- `<A-7>`(`<D-7>`) 🄽 - go to buffer-7.
- `<A-8>`(`<D-8>`) 🄽 - go to buffer-8.
- `<A-9>`(`<D-9>`) 🄽 - go to buffer-9.
- `<A-0>`(`<D-0>`) 🄽 - go to the last buffer.

_For neovim 0.5+ only_:

- `<A-S-Right>`(`<D-S-Right>`) 🄽 - move current buffer to next position(on the right).
- `<A-S-Left>`(`<D-S-Left>`) 🄽 - move current buffer to previous position(on the left).
- `<LeftMouse>` 🄽 - go to selected buffer.
- `<MiddleMouse>` 🄽 - close selected buffer.

Support by [vim-buffet](https://github.com/bagrat/vim-buffet)(switched to [barbar.nvim](https://github.com/romgrk/barbar.nvim) on neovim 0.5+).

#### Font

lin.vim use [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) by default. Please manually install other nerd fonts and configure in **_~/.vim/setting.vim_** for other options.

## IDE-like Editing

#### Code Complete

- `<tab>`/`<c-n>`/`<down>` 🄸 - navigate to next suggestion.
- `<s-tab>`/`<c-p>`/`<up>` 🄸 - navigate to previous suggestion.
- `<cr>` 🄸 - confirm current suggestion or snippet.
- `<esc>`/`<c-[>` 🄸 - close suggestion.
- `<c-k>` 🄸 - force trigger suggestion.
- `<c-f>` 🄸 - jump to next snippet position.
- `<c-b>` 🄸 - jump to previous snippet position.

#### Jumps

- `[d` 🄽 - go to previous diagnostic location.
- `]d` 🄽 - go to next diagnostic location.
- `gd` 🄽 - go to definition.
- `gy` 🄽 - go to type(function) definition.
- `gi` 🄽 - go to implemention.
- `gr` 🄽 - go to references.

#### Symbols

- `K` 🄽 - show hover(symbol definition).
- `<leader>rs` 🄽 - rename symbol.

#### Code Format

- `<leader>cf` 🄽🅅 - format code on current buffer or visual selected code.

#### Code Actions

- `<leader>ca` 🄽🅅 - run code actions on current cursor position or visual selected code.
- `<leader>qf` 🄽 - apply quick fix on current line.

#### Code Lens

- `<leader>cl` 🄽 - run code lens on current line.

#### Git

- `]c` 🄽 - go to next git chunk in current buffer.
- `[c` 🄽 - go to previous git chunk in current buffer.

_For neovim 0.5+ only_:

- `<leader>gb` 🄽 - toggle git blame info on current line.

### Search

Search engine use fzf.vim and integrated with coc.nvim with [coc-fzf](https://github.com/antoinemadec/coc-fzf), all fzf commands are configured with prefix **Fzf**, for example `:Files` are renamed to `:FzfFiles`, `:Rg` are renamed to `:FzfRg`.

#### Text Search

- `<space>gr` 🄽 - search text by `:FzfRg`.
- `<space>l` 🄽 - search lines on opened buffers by `:FzfLines`.
- `<space>t` 🄽 - search tags by `:FzfTags`.
- `<space>y` 🄽 - search yank history by `:CocFzfList yank`.
- `<space>sh` 🄽 - search search history by `:FzfHistory/`.
- `<space>ch` 🄽 - search vim command history by `:FzfHistory:`.

#### File Search

- `<space>f`/`<c-p>` 🄽 - search files by `:FzfFiles`.
- `<space>b` 🄽 - search opened buffers by `:FzfBuffers`.
- `<space>hf` 🄽 - search history files (v:oldfiles) and opened buffers by `:FzfHistory`.

#### Git Search

- `<space>gc` 🄽 - search git commits by `:FzfCommits`.
- `<space>gf` 🄽 - search git files rby `:FzfGFile`.
- `<space>gs` 🄽 - search git status(also diff files by preview) by `:FzfGFiles?`.

#### Other Search

- `<space>mk` 🄽 - search marks by `:FzfMarks`.
- `<space>mp` 🄽 - search normal mode vim key mappings by `:FzfMaps`.
- `<space>vc` 🄽 - search vim commands by `:FzfCommands`.
- `<space>ht` 🄽 - search help tags by `:FzfHelptags`.

#### Coc.nvim Search

Key mappings are configured with prefix char `c` after `<space>`.

- `<space>cs` 🄽 - search symbols by `:CocFzfList symbols`.
- `<space>cd` 🄽 - search diagnostics by `:CocFzfList diagnostics`.
- `<space>co` 🄽 - search outline/tags by `:CocFzfList outline`.
- `<space>cc` 🄽 - search commands by `:CocFzfList commands`.
- `<space>cl` 🄽 - search location by `:CocFzfList location`.

Please visit [fzf.vim](https://github.com/junegunn/fzf.vim) and [coc-fzf](https://github.com/antoinemadec/coc-fzf) for more information.

## Editing Enahncement

#### Enhanced Copy Paste

when you want copy/paste between different vim instances. Use enhanced copy-paste to stored text content in a file cache:

- `<leader>y` 🅅 - copy visual-selected text to `~/.vim/.enhanced-copy-paste-cache`.
- `<leader>p` 🄽 - paste text saved from `~/.vim/.enhanced-copy-paste-cache`.

You could configure these key mappings in **_~/.vim/setting/linrongbin16/enhanced-copy-paste.vim_**.

#### Fast Cursor Movement

See [Fast cursor movement](#fast-cursor-movement).

- `<leader>f{char}` 🄽 - move to a single {char}.
- `<leader>s{char}{char}` 🄽 - move to consequent two {char}{char}.
- `<leader>w` 🄽 - move to word.
- `<leader>l` 🄽 - move to line.

Support by [vim-easymotion](https://github.com/easymotion/vim-easymotion)(switched to [hop.nvim](https://github.com/phaazon/hop.nvim) on neovim 0.5+).

#### Word Movement

Better word movement enhancement.

- `W` 🄽 - move forward to a single word.
- `B` 🄽 - move backward to a single word.
- `E` 🄽 - move forward to the end of a single word.
- `gE` 🄽 - move backward to the end of a single word.

Support by [vim-wordmotion](https://github.com/chaoren/vim-wordmotion).

#### Fast Repeat

Enhancement for `.` operation.

Support by [vim-repeat](https://github.com/tpope/vim-repeat).

#### Fast Quotes Operation

Enhancement for add/remove quotes operation.

Support by [vim-surround](https://github.com/tpope/vim-surround)

#### Match Brackets and HTML Tags

Enhancement for brackets(pairs) and html tags.

Support by [vim-matchup](https://github.com/andymass/vim-matchup).

#### Auto Close Brackets and HTML Tags

Enhancement for auto close brackets(pairs) and html tags.

Support by [auto-pairs](https://github.com/jiangmiao/auto-pairs) (switched to [nvim-autopairs](https://github.com/windwp/nvim-autopairs) on neovim 0.5+) and [vim-closetag](https://github.com/alvan/vim-closetag).

#### Easy Comment

- `gcc` 🄽 - toggle(comment/uncomment) current line.
- `gc` 🅅 - toggle(comment/uncomment) visual selected blocks.
- `gc{motion}` 🄽 - toggle(comment/uncomment) from current line with motion such as **_jkhl_**.
- `gc<Count>{motion}` 🄽 - toggle(comment/uncomment) from current line with **_Count_** motion repeat.

Support by [tcomment_vim](https://github.com/tomtom/tcomment_vim).

## Customization

Please add plugins in `~/.vim/plugin.vim`, add settings in `~/.vim/setting.vim` and `~/.vim/coc-settings.json`.

# Embeded Language Servers

These language servers are installed by default:

- c/c++
- python3 (python2 is not supported)
- rust
- go
- html/xml/markdown
- css/sass/scss/less
- json
- javascript/typescript/jsx/tsx

# Reference

- Nerd font cheat sheet: https://www.nerdfonts.com/cheat-sheet.
- IDE-like defaults for neovim: [LunarVim](https://github.com/LunarVim/LunarVim).
- Color Schemes:
  - [solarized](https://github.com/lifepillar/vim-solarized8).
  - [monokai](https://github.com/crusoexia/vim-monokai).
  - [dracula](https://github.com/dracula/vim).
  - [neodark](https://github.com/KeitaNakamura/neodark.vim).
  - [srcery](https://github.com/srcery-colors/srcery-vim).
  - [palenight](https://github.com/drewtempelmeyer/palenight.vim).
  - [onedark](https://github.com/joshdick/onedark.vim).
  - [code-dark](https://github.com/tomasiser/vim-code-dark).
  - [rigel](https://github.com/Rigellute/rigel).
  - [base16](https://github.com/chriskempson/base16-vim).
  - [jellybeans](https://github.com/nanotech/jellybeans.vim).
  - [edge](https://github.com/sainnhe/edge).
  - [gruvbox-material](https://github.com/sainnhe/gruvbox-material).
  - [everforest](https://github.com/sainnhe/everforest).
  - [sonokai](https://github.com/sainnhe/sonokai).
  - [nightfox](https://github.com/EdenEast/nightfox.nvim).
  - [material](https://github.com/kaicataldo/material.vim).
  - [tokyonight](https://github.com/folke/tokyonight.nvim) (for neovim 0.5+ only).
  - [github](https://github.com/projekt0n/github-nvim-theme) (for neovim 0.5+ only).
  - [kanagawa](https://github.com/rebelot/kanagawa.nvim) (for neovim 0.6+ only).

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
