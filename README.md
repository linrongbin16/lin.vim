# lin.vim : Lin Rongbin's (Neo)Vim Distribution

lin.vim is a highly configured [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development, inspired by [spf13-vim](https://github.com/spf13/spf13-vim).

# Table of Contents

- [Introduction](#introduction)
  - [Screenshots](#screenshots)
  - [Feature](#feature)
  - [Project Structure](#project-structure)
- [Installation](#installation)
  - [Requirements](#requirements)
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
    - [Rg Search](#rg-search)
  - [Other Enhancements](#other-enhancements)
    - [Enhanced Copy Paste](#enhanced-copy-paste)
    - [Fast Cursor Movement](#fast-cursor-movement)
    - [Fast Repeat](#fast-repeat)
    - [Fast Quotes Operation](#fast-quotes-operation)
    - [Match Brackets and HTML Tags](#match-brackets-and-html-tags)
    - [Auto Close Brackets and HTML Tags](#auto-close-brackets-and-html-tags)
    - [Easy Comment](#easy-comment)
  - [Customization](#customization)
- [Embeded Language Servers](#embeded-language-servers)
- [Reference](#reference)
- [Contribute](#contribute)

## Introduction

lin.vim is aimed to out of box, IDE-like editing features, high performance, light weight and friendly to most users.

lin.vim is focused on and only on editing, it doesn't compile/package/debug projects, not tutorial for new vim users neither.

lin.vim solved such issues:

- Solved the difficulty of choosing/grouping/configuring plugins, a set of plugins are embeded and well configured which meets most needs.
- Solved the difficulty of repeatable install work on different OS and machines, installation has been made easier by one line command (not on Windows for now).
- Solved the performance/feature/UI-looking issue, only carefully chosen plugins are installed, try to be a modern editor just like [vscode](https://code.visualstudio.com/), pretty colorschemes/UI/icons to make you happy working.
- Documented almost everything so nothing been confused.
- Customization ability for special needs.

### Screenshots

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
  - Windows
  - macOS
  - Linux(Ubuntu/Debian/Fedora/Manjaro)
- Support both [Vim](https://www.vim.org/) and [Neovim](https://neovim.io/), neovim 0.6+ is strongly recommended for better performance and experience.
- Modern editor UI features:
  - File explorer
  - Pretty icons
  - Pretty color schemes (see [Color Schemes - Reference](#reference)) collected and randomly selected on start
  - Status line
  - Tab line and buffer explorer
  - Outline/Tags
- IDE-like editing features supported by [coc.nvim](https://github.com/neoclide/coc.nvim), a set of language servers(see [Embeded Language Servers](#embeded-language-servers)) are embeded by default:
  - Code complete
  - Diagnostic
  - Lint
  - Code format
  - Jump between symbols
  - Code Actions
  - Code Lens
- Search engine features supported default by [fzf.vim](https://github.com/junegunn/fzf.vim):
  - Text search on text/lines/tags/search-histories/command-histories/yank-histories
  - File search on files/buffers/history-files
  - Git search on commits/uncommit-changes
  - Coc.nvim integrated search on symbols/outline/diagnostics/yank
  - Other enhancement search on vim-marks/vim-key-mappings/vim-commands/help-tags
- Custom configuration.

### Project Structure

```
 |+install              Installation scripts for different platforms.
 |+setting              VimL script settings.
 |+template             Templates for ~/.vim/plugin.vim, ~/.vim/coc-settings.json and ~/.vim/setting.vim.
 |`install.sh           UNIX/Linux/MacOS install script.
 |`install.ps1          Windows PowerShell install script.
 |`LICENSE              The license file.
 |`lin.vim              The .vimrc file.
 |`README.md            The readme document.
```

## Installation

### Requirements

lin.vim requires below softwares:

- vim, nvim
- clang/gcc, make, cmake
- python3 and pip3 (python 2.x is not supported)
- node and npm
- golang
- rustc and cargo
- curl, wget
- universal-ctags
- unzip
- hack nerd font

The install script `install.sh` will automatically install these requirements with system package managers:

- `install/apt.sh` for debian/ubuntu based linux
- `install/brew.sh` for macOS homebrew, install [Xcode](https://guide.macports.org/chunked/installing.html) and [homebrew](https://brew.sh/) as pre-requirements
- `install/dnf.sh` for fedora/redhat based linuxx
- `install/pacman.sh` for archlinux based linuxx

Other Linux/UNIX systems(Gentoo based linux, bsd, etc) are not supported yet.

Access of below websites are required as well, please make sure they're available:

- github: [github.com](https://github.com/), [raw.githubusercontent.com](https://raw.githubusercontent.com/)
- rust: [www.rust-lang.org](https://www.rust-lang.org/), [crates.io](https://crates.io/)
- golang: [go.dev](https://go.dev/)

### UNIX/Linux/MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

The goal of installation on windows is to install native executable file, no [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) or [MYSY2](https://www.msys2.org/) for below reasons:

- Native executable file has better performance, WSL/MYSY2 either use portable GNU shell or ubuntu virtual machine, which is quite slow and heavy.
- Supporting WSL backend mode (actually remote mode) like vscode is too heavy development work.
- [Git for Windows](https://git-scm.com) already contains MYSY2 and provide Unix/Linux builtin commands, lin.vim use it directly.

1. Install [Visual Studio](https://www.visualstudio.com/) with at least these components:

   - .NET Desktop Development
   - Visual C++ Desktop Development
   - Common Windows Platform Development

2. Install [64-bit Git for Windows Setup](https://git-scm.com/downloads) with especially these options:

   - In the 3rd **_Select Components_** step, enable **_Associate .sh files to be run with Bash_**
   - In the 7th **_Adjusting your PATH environment_** step, choose **_Use Git and optional Unix tools from the Command Prompt_**
   - In the 11th **_Configuring the terminal emulator to use with Git Bash_** step, choose **_Use Windows's default console window_**

After git installation, `git.exe` should be found in `$env:Path`, Unix/Linux builtin commands such as `bash.exe`, `cp.exe`, `mv.exe`, `cd.exe`, `find.exe`, `cat.exe` should be found as well.

Notice:

- if you are using WSL, `C:\Windows\System32\bash.exe` could lead you to WSL instead of the `bash.exe` provided by Git for Windows. Make sure Git for Windows PATH environment is ahead of `C:\Windows\System32` so `bash.exe` from Git for Windows (`wsl.exe` could connect to WSL as well) will be first detected on Command Prompt.
- Don't use old-version `vim.exe` provided by Git for Windows, use `gvim.exe` provided by followed steps.

3. Install other third party dependencies (x64 is preferred):

   - (Optional) [make](http://gnuwin32.sourceforge.net/packages/make.htm): add `make.exe` in `$env:Path`
   - [cmake](https://cmake.org/download/): add `cmake.exe` in `$env:Path`
   - [gvim](https://github.com/vim/vim-win32-installer/releases): add `gvim.exe` in `$env:Path`
   - (Recommended) [neovim](https://github.com/neovim/neovim/releases): add `nvim.exe`, `nvim-qt.exe` in `$env:Path`
   - [python3](https://www.python.org/downloads/): since python3 installer don't provide `python3.exe` and `pip3.exe`, manually copy `python.exe` as `python3.exe`, copy `pip.exe` as `pip3.exe`, then add them in `$env:Path`
   - [llvm](https://releases.llvm.org/): add `clang.exe`, `clang++.exe`, `clangd.exe`, `clang-tidy.exe`, `clang-format.exe` in `$env:Path`
   - [rust](https://www.rust-lang.org/tools/install): add `rustc.exe`, `cargo.exe` in `$env:Path`
   - [golang](https://go.dev/dl/): add `go.exe` in `$env:Path`
   - [nodejs](https://nodejs.org/en/download/): add `node.exe`, `npm.exe` in `$env:Path`
   - [ripgrep](https://github.com/BurntSushi/ripgrep/releases): add `rg.exe` in `$env:Path`
   - [fzf](https://github.com/junegunn/fzf/releases): add `fzf.exe` in `$env:Path`
   - [bat](https://github.com/sharkdp/bat): add `bat.exe` in `$env:Path`
   - [fd](https://github.com/sharkdp/fd): add `fd.exe` in `$env:Path`
   - [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases): add `ctags.exe`, `readtags.exe` in `$env:Path`

Notice:

- Python3 version must be compatible with gvim/neovim's libpython3.so version, or it will not been loaded. Please use `gvim --version` to find its libpython3.so version.
- Install these dependencies with a package manager (such as [chocolatey](https://chocolatey.org/) and [scoop](https://scoop.sh/)) is another option, just make sure they're available.

4. Install [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases):

   - `Hack Bold Nerd Font Complete Mono.ttf`
   - `Hack Bold Italic Nerd Font Complete Mono.ttf`
   - `Hack Italic Nerd Font Complete Mono.ttf`
   - `Hack Regular Nerd Font Complete Mono.ttf`

5. Install following components as administrator:

```bash
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```

## User Guide

In this section, vim editing modes are specified with:

- 🄽 - Normal Mode
- 🅅 - Visual Mode
- 🄸 - Insert Mode

### Hot Key

- `F1` 🄽 - toggle(open/close) fern file explorer, see [Simple but pretty UI](#simple-but-pretty-ui).
- `F2` 🄽 - toggle(open/close) vista outline/tags, see [Code complete for C++](#code-complete-for-c).
- `F3` 🄽 - open markdown preview in browser, see [Markdown preview](#markdown-preview).
- `F4` 🄽 - switch between C/C++ header and source files.
- `F9` 🄽 - change color theme randomly, see [Screenshots](#screenshots).
- `F10`/`SHIFT-F10` 🄽 - open/close(toggle) opened buffers explorer.

You could configure these keys in **_~/.vim/setting.vim_**.

### UI

#### File Explorer

File explorer is supported by [fern.vim](https://github.com/lambdalisue/fern.vim) (switched to [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) on neovim 0.6+), you could use key mappings on the file explorer left side:

Navigation:

- `h` 🄽 - collapse directory.
- `l` 🄽 - open or expand directory.
- `<CR>` 🄽 - open file or cd into directory.
- `<BS>` 🄽 - leave directory and goto upper directory.
- `<C-v>` 🄽 - open file in `vsplit`.
- `<C-x>` 🄽 - open file in `split`.
- `<C-t>` 🄽 - open file in new tab.

Create/Delete/Copy/Paste/Cut:

- `N`/`K` 🄽 - create new file/directory.
- `m`/`r` 🄽 - move/rename file/directory.
- `C` 🄽 - copy file/directory into internal clipboard.
- `X` 🄽 - cut file/directory into internal clipboard.
- `V`/`P` 🄽 - paste internal clipboard file/directory to current directory.
- `d` 🄽 - trash file/directory to system trash-bin, only works on Windows/macOS.
- `D` 🄽 - delete file/directory with `rm`.
- `R` 🄽 - reload file explorer.

Others:

- `s` 🄽 - open file in system file manager(such as Finder in macOS).
- `?` 🄽 - open/close(toggle) help.

You could editing **_~/.vim/setting/lambdalisue/fern.vim.vim_** (or **_~/.vim/setting/kyazdani42/nvim-tree.lua.vim_**) to customize key mappings.
Please refer to [fern.vim - wiki - Mappings](https://github.com/lambdalisue/fern.vim/wiki/Mappings) (or [nvim-tree.lua - README](https://github.com/kyazdani42/nvim-tree.lua)) for more key mappings.

#### Buffers/Tabs

Buffers/tabs is supported by [vim-buffet](https://github.com/bagrat/vim-buffet)(switched to [barbar.nvim](https://github.com/romgrk/barbar.nvim) on neovim 0.5+), you could switch/close them by key mappings:

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

For neovim 0.5+ using barbar.nvim, especially you could **_re-ordering_** and **_mouse-clicking_** on buffers:

- `<A-S-Right>`(`<D-S-Right>`) 🄽 - move current buffer to next position(on the right).
- `<A-S-Left>`(`<D-S-Left>`) 🄽 - move current buffer to previous position(on the left).
- `<LeftMouse>` 🄽 - go to selected buffer.
- `<MiddleMouse>` 🄽 - close selected buffer.

#### Font

lin.vim use [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) by default. Please manually install other nerd fonts and configure in **_~/.vim/setting.vim_** for other options.

### IDE-like Editing Features

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

- `[c` 🄽 - go to previous git chunk.
- `]c` 🄽 - go to next git chunk.

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

- `<space>cs` 🄽 - search symbols by `:CocFzfList symbols`. Notice coc-fzf's symbols only work on neovim, it fallback to `:CocList symbols` on vim.
- `<space>cd` 🄽 - search diagnostics by `:CocFzfList diagnostics`.
- `<space>co` 🄽 - search outline/tags by `:CocFzfList outline`.
- `<space>cc` 🄽 - search commands by `:CocFzfList commands`.
- `<space>cl` 🄽 - search location by `:CocFzfList location`.

Please visit [fzf.vim](https://github.com/junegunn/fzf.vim) and [coc-fzf](https://github.com/antoinemadec/coc-fzf) for more information.

### Editing Support

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

### Customization

Please add more settings in **_~/.vim/setting.vim_** and **_~/.vim/coc-settings.json_**.

## Embeded Language Servers

These language servers are installed by default:

- c/c++
- python3 (python2 is not supported)
- rust
- go
- html/xml/markdown
- css/sass/scss/less
- json
- javascript/typescript/jsx/tsx

## Reference

- Nerd font cheat sheet: https://www.nerdfonts.com/cheat-sheet
- IDE-like defaults for neovim: [LunarVim](https://github.com/LunarVim/LunarVim)
- Color Schemes:
  - [solarized](https://github.com/lifepillar/vim-solarized8)
  - [monokai](https://github.com/crusoexia/vim-monokai)
  - [dracula](https://github.com/dracula/vim)
  - [neodark](https://github.com/KeitaNakamura/neodark.vim)
  - [srcery](https://github.com/srcery-colors/srcery-vim)
  - [palenight](https://github.com/drewtempelmeyer/palenight.vim)
  - [onedark](https://github.com/joshdick/onedark.vim)
  - [code-dark](https://github.com/tomasiser/vim-code-dark)
  - [rigel](https://github.com/Rigellute/rigel)
  - [base16](https://github.com/chriskempson/base16-vim)
  - [jellybeans](https://github.com/nanotech/jellybeans.vim)
  - [edge](https://github.com/sainnhe/edge)
  - [gruvbox-material](https://github.com/sainnhe/gruvbox-material)
  - [everforest](https://github.com/sainnhe/everforest)
  - [sonokai](https://github.com/sainnhe/sonokai)
  - [nightfox](https://github.com/EdenEast/nightfox.nvim)
  - [material](https://github.com/kaicataldo/material.vim)
  - [tokyonight](https://github.com/folke/tokyonight.nvim) (Only on neovim 0.5+)
  - [github](https://github.com/projekt0n/github-nvim-theme) (Only on neovim 0.5+)
  - [kanagawa](https://github.com/rebelot/kanagawa.nvim) (Only on neovim 0.6+)

## Contribute

Please open issue/PR for anything about lin.vim.

Like lin.vim? Consider

<a href="https://www.buymeacoffee.com/linrongbin16" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

Or

<p align="center">
  <img alt="wechat-pay.jpeg" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/wechat-pay.jpeg" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="alipay.jpeg" src="https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/alipay.jpeg" width="45%">
</p>
