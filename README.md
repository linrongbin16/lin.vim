# lin.vim : Lin Rongbin's (Neo)Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development.

# Table of Contents

- [Introduction](#introduction)
  - [Screenshots](#screenshots)
  - [Feature](#feature)
  - [Project Structure](#project-structure)
- [Installation](#installation)
  - [Requirements](#requirements)
  - [UNIX, Linux, MacOS](#unix-linux-macos)
  - [Windows](#windows)
  - [Notice](#notice)
- [User Guide](#user-guide)
  - [Hot Key](#hot-key)
  - [UI](#ui)
    - [File Explorer](#file-explorer)
    - [Buffers/Tabs](#buffers-tabs)
  - [IDE-like Editing Features](#ide-like-editing-features)
    - [Code Complete](#code-complete-by-coc-nvim)
    - [Jumps](#jumps-by-coc-nvim)
    - [Quick Code Actions/Lens](#quick-code-actions-lens-by-coc-nvim)
  - [Search](#search)
    - [Text Search](#text-search)
    - [File Search](#file-search)
    - [Git Search](#git-search)
    - [Other Search](#other-search)
    - [Coc.nvim Search](#coc-nvim-search)
    - [Rg Search](#rg-search)
  - [Other Enhancements](#other-enhancements)
    - [Enhanced Copy Paste](#enhanced-copy-paste)
    - [Easy Alignment](#easy-alignment-by-easy-align)
    - [Easy Cursor Movement](#easy-cursor-movement-by-vim-easymotion)
    - [Fast Repeat](#fast-repeat-by-vim-repeat)
    - [Fast Quotes Operation](#fast-quotes-operation-by-vim-surround)
    - [Match Brackets and HTML Tags](#match-brackets-and-html-tags-by-vim-matchup)
    - [Auto Close Brackets and HTML Tags](#auto-close-brackets-and-html-tags-by-auto-pairs-and-vim-closetag)
    - [Easy Comment](#easy-comment-by-nerdcommenter)
    - [Highlight(Mark) specific words](#highlight-mark-specific-words)
  - [Customization](#customization)
    - [GUI Fonts](#gui-fonts)
  - [Command Line Utility (vcmd)](#command-line-utility-vcmd)
- [Contribute](#contribute)

## Introduction

lin.vim is aimed to out of box, IDE-like editing features, high performance, light weight and friendly to most (Neo)VIM users.

lin.vim is focused on and only on editing, it doesn't compiling/packaging/debugging projects, not a tutorial for new (Neo)VIM users neither.

lin.vim solved such issues:

- Solved the difficulty of choosing/grouping/configuring plugins, a list of plugins are embeded and well configured which meets most needs.
- Solved the difficulty of repeatable install work on different OS and machines, installation has been made easier by one line command (not on Windows for now).
- Solved the performance/feature/UI-looking issue on (Neo)VIM, only carefully chosen plugins are installed, try to be a modern editor just like [vscode](https://code.visualstudio.com/), pretty colorschemes/UI/icons to make you happy working.
- Solved the repeatable daily shell command line work by offering a set of command line utilities implemented by python3, include vfile/vgit/vgp/vencode/vip/vpack/vtime/vconf/etc.
- Detailed wiki for almost everything so nothing been confused.
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
- Support both [VIM](https://www.vim.org/) and [Neovim](https://neovim.io/), Neovim 0.5+ is strongly recommended for better performance.
- Modern editor UI features:
  - File explorer
  - Buffers/tabs explorer
  - Pretty icons
  - Best color schemes collected and randomly selected on (Neo)VIM start
  - Status line
  - Outline/Tags
- IDE-like editing features supported by [coc.nvim](https://github.com/neoclide/coc.nvim), C/C++/Python3/Rust language servers are embeded by default:
  - Code complete
  - (Optional) AI complete (by [TabNine](https://www.tabnine.com/))
  - Diagnostic
  - Lint
  - Code format
  - Jump between symbols
  - Code Lens
  - Code Actions
- Search engine features supported by [fzf.vim](https://github.com/junegunn/fzf.vim). [vim-clap](https://github.com/liuchengxu/vim-clap) is also installed, both `:Fzf` and `:Clap` are available, but key mappings are only provide for fzf.vim by default:
  - Text search on text/lines/tags/search-histories/command-histories/yank-histories
  - File search on files/buffers/history-files
  - Git search on commits/uncommit-changes
  - Coc.nvim integrated search on symbols/outline/diagnostics/yank
  - Other enhancement search on vim-marks/vim-key-mappings/vim-commands/help-tags
- Command line utilities works on multiple OS platforms, implemented by python3 for easier daily work:
  - vgit: better git operations, no need to remember tons of options, better interactive UI for user
  - vgp: better text searches implement by ripgrep, no need to remember tons of options, easier management on `~/.ignore` files
  - vfile: better file operations(delete/content-replace/encoding-convert)
  - vip: easier IPv4 IPv6 address validator and translation with integer
  - vencode: easier Base64/URL encoder/decoder
  - vconf: easier configuration for generate `compile_commands.json`/`compile_flags.txt` for clangd, ssh-keys, faster china mirrors for homebrew/npm/pip3/ubuntu/debian/fedora/manjaro
  - vpack: earier compression/extraction, no need to remember tons of options on tar/zip/7z
  - vtime: earier translation with seconds/milliseconds integer and local/UTC timezone, no need to remember tons of options
- Use [zsh](https://www.zsh.org/) for macOS/Linux with pretty colorscheme, and also a `~/.linvimrc` is installed for environment variable management.
- Custom configuration.

### Project Structure

```
 |+command              Command line utilities(vcmd) implemented in python3.
 |+install              Installation scripts for all platforms.
 |+setting              VimL script settings.
 |+template             Templates for user-settings.vim, coc-settings.json, vim-plug.vim and .linvimrc.
 |`install.sh           UNIX/Linux/MacOS bash installation script.
 |`install.ps1          Windows PowerShell installation script.
 |`LICENSE              The license file.
 |`lin.vim              The .vimrc file.
 |`README.md            Readme wiki.
```

## Installation

### Requirements

lin.vim needs at least Vim 8.1+ or Neovim 0.4.2+, Python 3.6+ (Python 2 is not supported), Nodejs 10.12+. Its installation has been tested on these platforms:

- MacOS Catalina 10.15.7 with Macvim 8.2, python 3.9+, node v15.x+
- Windows 10 with Vim 8.2, python 3.8+, node v15+
- Ubuntu 20.04 LTS with Vim 8.1, python 3.8+, node v14+
- Fedora Workstation 32 with with Vim 8.2, python 3.8+, node v12+
- Manjaro 20.2 with with Vim 8.2, python 3.8+, node v15+

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

   - [git](https://git-scm.com/downloads): add `git.exe` in `$env:Path`
   - (Optional) [make](http://gnuwin32.sourceforge.net/packages/make.htm): add `make.exe` in `$env:Path`
   - [cmake](https://cmake.org/download/): add `cmake.exe` in `$env.Path`
   - [gvim](https://github.com/vim/vim-win32-installer/releases): add `gvim.exe` in `$env.Path`
   - (Optional) [neovim](https://github.com/neovim/neovim/releases): add `nvim.exe` in `$env.Path`
   - [python3](https://www.python.org/downloads/): since python3 installer don't provide `python3.exe` and `pip3.exe`, manually copy `python.exe` to `python3.exe`, copy `pip.exe` to `pip3.exe`, then add them in `$env.Path`
   - [llvm](https://releases.llvm.org/): add `clang.exe`, `clang++.exe`, `clangd.exe`, `clang-tidy.exe`, `clang-format.exe` in `$env.Path`
   - [rust](https://www.rust-lang.org/tools/install): add `rustc.exe`, `cargo.exe` in `$env.Path`
   - [golang](https://go.dev/dl/): add `go.exe` in `$env.Path`
   - [nodejs](https://nodejs.org/en/download/): add `node.exe`, `npm.exe` in `$env.Path`
   - [ripgrep](https://github.com/BurntSushi/ripgrep/releases): add `rg.exe` in `$env.Path`
   - (Optional for better fzf.vim preview) [bat](https://github.com/sharkdp/bat): add `bat.exe` in `$env.Path`
   - (Optional for better fzf.vim file search performance) [fd](https://github.com/sharkdp/fd): add `fd.exe` in `$env.Path`
   - [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases): add `ctags.exe`, `readtags.exe` in `$env.Path`
   - [7z](https://www.7-zip.org/download.html): add `7z.exe` in `$env.Path`

Notice: installed python3 version must be compatible with gvim/neovim's libpython3.so version, or gvim/neovim will not detect python3. Please use `gvim --version` to find its libpython3.so version.

You could also install these dependencies with other windows package manager such as [chocolatey](https://chocolatey.org/) or [scoop](https://scoop.sh/), just make sure these commands are available in `$env.Path`.

3. Install following components as administrator:

```bash
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```

4. Add `$env:UserProfile\.vim\command` in `$env:Path`.

5. Install [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases), `install.ps1` script will automatically download and save it as `$env:UserProfile\.vim\guifonts\Hack.zip`, please manually install the following fonts:
   - `Hack Bold Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Italic Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Regular Nerd Font Complete Mono Windows Compatible.ttf`

### Notice

[install.sh](https://github.com/linrongbin16/lin.vim/blob/master/install.sh) will install third party dependencies automatically through package manager, which could conflict with your systems:

- git, curl, wget
- (g)vim/neovim (macvim is installed on macOS)
- llvm (clang, clang++, clangd, clang-format)
- rust
- golang
- autoconf, automake, make, cmake (make is optional on windows, gcc/g++ is additionally installed on Linux)
- ripgrep(rg), bat, fd
- zip, unzip, bzip2, p7zip (7z installed on Windows as an alternative)
- python3, pip3
- nodejs, npm
- universal-ctags
- zsh (not installed on Windows)
- hack nerd font (only download on Windows, need manually installation)

Notice: installation needs access of websites below, and make sure they're available:

- [github.com](https://github.com/)
- [raw.githubusercontent.com](https://raw.githubusercontent.com/)
- [crates.io](https://crates.io/)

## User Guide

In this section, VIM edit mode are specified with:

- 🄽 - Normal Mode
- 🅅 - Visual Mode
- 🄸 - Insert Mode

### Hot Key

- `F1` 🄽 - toggle(open/close) fern file explorer, see [Simple but pretty UI](#simple-but-pretty-ui).
- `F2` 🄽 - toggle(open/close) vista outline/tags, see [Code complete for C++](#code-complete-for-c).
- `F3`/`SHIFT-F3` 🄽 - format/sync-format current file.
- `F4` 🄽 - switch between C/C++ header and source files.
- `F5` 🄽 - run code actions on current file.
- `SHFIT-F5` 🄽 - run code actions on selected code.
- `F6` 🄽 - hover symbol.
- `SHIFT-F6` 🄽 - rename symbol.
- `F7` 🄽 - open markdown preview window in browser, see [Markdown preview](#markdown-preview).
- `F8` 🄽 - change color theme randomly, see [Screenshots](#screenshots).
- `F10`/`SHIFT-F10` 🄽 - open/close(toggle) opened buffers explorer.

You could configure these keys in **_user-settings.vim_**.

### UI

#### File Explorer

File explorer is supported by [fern.vim](https://github.com/lambdalisue/fern.vim), you could use key mappings on the file explorer left side:

- `N/K` 🄽 - create new file/directory.
- `m` 🄽 - move file/directory.
- `c` 🄽 - copy file/directory.
- `R` 🄽 - rename file/directory.
- `D` 🄽 - delete file/directory to trash.
- `h` 🄽 - leave or collapse directory.
- `l` 🄽 - open or expand directory.
- `<cr>` 🄽 - open file or cd into directory.
- `<bs>` 🄽 - leave directory and goto upper directory.
- `<F5>` 🄽 - reload file explorer.

Please refer to [fern.vim - wiki - Mappings](https://github.com/lambdalisue/fern.vim/wiki/Mappings) fore more key mappings.

#### Buffers/Tabs

Buffers/tabs is supported by [vim-buffet](https://github.com/bagrat/vim-buffet), you could switch/close them by key mappings:

- `<leader>bn`/`<leader><tab>` 🄽 - go to next buffer.
- `<leader>bp`/`<leader><s-tab>` 🄽 - go to previous buffer.
- `<leader>bd` 🄽 - close current buffer.
- `F10`/`SHIFT-F10` 🄽 - open/close(toggle) opened buffers explorer.

Alt-1 ~ Alt-9 are mapped to navigate 1 ~ 9 tabs, Alt-0 are mapped to navigate to the last tab.
For macOS, Command-1 ~ Command-9 and Command-0 are configured for the same thing.

- `<A-1>`(`<D-1>`) 🄽 - go to tab-1
- `<A-2>`(`<D-2>`) 🄽 - go to tab-2
- `<A-3>`(`<D-3>`) 🄽 - go to tab-3
- `<A-4>`(`<D-4>`) 🄽 - go to tab-4
- `<A-5>`(`<D-5>`) 🄽 - go to tab-5
- `<A-6>`(`<D-6>`) 🄽 - go to tab-6
- `<A-7>`(`<D-7>`) 🄽 - go to tab-7
- `<A-8>`(`<D-8>`) 🄽 - go to tab-8
- `<A-9>`(`<D-9>`) 🄽 - go to tab-9
- `<A-0>`(`<D-0>`) 🄽 - go to tab-10
- `<A-Left>`(`<D-Left>`) 🄽 - go to previous tab
- `<A-Right>`(`<D-Right>`) 🄽 - go to next tab

### IDE-like Editing Features

The AI-Complete Engine [TabNine](https://www.tabnine.com/) is definitely worth a try(also it eats lots of memory), type `:CocCommand tabnine.openHub` to login and enable after installation.

#### Code Complete (by coc.nvim)

- `<c-n>`/`tab`/`<down>` 🄸 - select next suggestion.
- `<c-p>`/`<s-tab>`/`<up>` 🄸 - select previous suggestion.
- `<esc>`/`<c-[>` 🄸 - quit suggestion.

#### Jumps (by coc.nvim)

- `[d` 🄽 - go to previous diagnostic location.
- `]d` 🄽 - go to next diagnostic location.
- `gd` 🄽 - go to definition.
- `gy` 🄽 - go to type(function) definition.
- `gi` 🄽 - go to implemention.
- `gr` 🄽 - go to references.
- `K` 🄽 - show hover(symbol definition).

#### Quick Code Actions/Lens (by coc.nvim)

- `<leader>rs`/`<s-F6>` 🄽 - rename symbol.
- `<leader>ca`/`<F5>` 🄽 - run code actions on current buffer.
- `<leader>cs`/`<s-F5>` 🄽 - run code actions on selected code.
- `<leader>cl` 🄽 - run code lens on current line.
- `<leader>cf` 🄽 - apply quick fix on current line.

### Search

By default search engine use fzf.vim and integrated with coc.nvim with [coc-fzf](https://github.com/antoinemadec/coc-fzf), all fzf commands are configured with prefix **Fzf**, for example `:Files` are renamed to `:FzfFiles`, `:Rg` are renamed to `:FzfRg`, ...

But if you want, just edit **_user-settings.vim_**, disable(comment) the line `source $HOME/.vim/setting/junegunn-fzf.vim.vim`(which provide key mappings for fzf.vim), and enable(uncomment) the line `" source $HOME/.vim/setting/liuchengxu-vim-clap.vim`(which provide key mappings for vim-clap). Both fzf.vim and vim-clap's key mappings are functioned almost in the same way.

#### Text Search

- `<space>gr` 🄽 - search text by `:FzfRg` or `:Clap grep2`.
- `<space>l` 🄽 - search lines on opened buffers by `:FzfLines` or `:Clap lines`.
- `<space>t` 🄽 - search tags by `:FzfTags` or `:Clap tags`.
- `<space>y` 🄽 - search yank history by `:CocFzfList yank` or `:Clap yanks`, Notice yank search in fzf.vim is implemented by coc-fzf.
- `<space>sh` 🄽 - search search history by `:FzfHistory/` or `:Clap search_history`.
- `<space>ch` 🄽 - search vim command history by `:FzfHistory:` or `:Clap command_history`.

#### File Search

Implement by fzf.vim.

- `<space>f`/`<c-p>` 🄽 - search files by `:FzfFiles` or `:Clap files`.
- `<space>b` 🄽 - search opened buffers by `:FzfBuffers` or `:Clap buffers`.
- `<space>hf` 🄽 - search history files (v:oldfiles) and opened buffers by `:FzfHistory` or `:Clap history`.

#### Git Search

Implement by fzf.vim.

- `<space>gc` 🄽 - search git commits by `:FzfCommits` or `:Clap commits`.
- `<space>gf` 🄽 - search git files rby `:FzfGFile` or `:Clap gfiles`.
- `<space>gs` 🄽 - search git status(also diff files by preview) by `:FzfGFiles?` or `:Clap git_diff_files`.

#### Other Search

- `<space>mk` 🄽 - search marks by `:FzfMarks` or `:Clap marks`.
- `<space>mp` 🄽 - search normal mode vim key mappings by `:FzfMaps` or `:Clap maps`.
- `<space>vc` 🄽 - search vim commands by `:FzfCommands` or `:Clap command`.
- `<space>ht` 🄽 - search help tags by `:FzfHelptags` or `:Clap help_tags`.

#### Coc.nvim Search

Key mappings are configured with prefix char `c` after `<space>`.

- `<space>cs` 🄽 - search symbols by `:CocFzfList symbols` or `:Clap coc_symbols`, Notice coc-fzf's symbols only work on NeoVIM, it fallback to `:CocList symbols` on VIM.
- `<space>cd` 🄽 - search diagnostics by `:CocFzfList diagnostics` or `:Clap coc_diagnostics`.
- `<space>co` 🄽 - search outline/tags by `:CocFzfList outline` or `:Clap coc_outline`.
- `<space>cc` 🄽 - search commands by `:CocFzfList commands` or `:Clap coc_commands`.
- `<space>cl` 🄽 - search location by `:CocFzfList location` or `:Clap coc_location`.

#### Enhanced key mappings for vim-clap

Since vim-clap provide more search sources, lin.vim also provide more key mappings for it (only when you enabled vim-clap key mappings).

- `<space>j` 🄽 - search dumb jump locations by `:Clap dumb_jump`.
- `<space>r` 🄽 - search files order by most recently used by `:Clap recent_files`.
- `<space>gd` 🄽 - search git diff files by `:Clap git_diff_files`, same with `<space>gs`.
- `<space>e` 🄽 - search lvy-like file explorer by `:Clap filer`.

Please visit [fzf.vim](https://github.com/junegunn/fzf.vim) and [coc-fzf](https://github.com/antoinemadec/coc-fzf) for more information.

#### Rg Search

`:Rg` command is still supported by [vim-ripgrep](https://github.com/jremmen/vim-ripgrep) as an old-style search method.

### Other Enhancements

#### Enhanced Copy Paste

Enhanced copy-paste are supported when you want copy/paste between different vim instances.

- `<leader>y` 🅅 - copy visual-selected text to locale machine cache `~/.vim/.lin-vim-enhanced-copy-paste`.
- `<leader>p` 🄽 - paste text saved from local machine cache `~/.vim/.lin-vim-enhanced-copy-paste`.

Copied content will be stored in a text file, then you could paste them to other vim instances.

You could configure these keys in **_user-settings.vim_**.

#### Easy Alignment by [easy-align](https://github.com/junegunn/vim-easy-align)

- `vipga=` 🅅 - align visual-selected paragraph.
- `gaip=` 🄽 - align inner paragraph.

#### Easy Cursor Movement

Fast cursor movement is supported by [vim-easymotion](https://github.com/easymotion/vim-easymotion).
See [Fast cursor movement](#fast-cursor-movement).

- `<leader>f{char}` 🄽 - move to a single {char}.
- `<leader>s{char}{char}` 🄽 - move to consequent two {char}{char}.
- `<leader>w` 🄽 - move to word.
- `<leader>l` 🄽 - move to line.

#### Fast Repeat by [vim-repeat](https://github.com/tpope/vim-repeat)

Enhancement for `.` operation.

#### Fast Quotes Operation by [vim-surround](https://github.com/tpope/vim-surround)

Enhancement for add/remove quotes operation.

#### Match Brackets and HTML Tags by [vim-matchup](https://github.com/andymass/vim-matchup)

Enhancement for brackets(pairs) and html tags.

#### Auto Close Brackets and HTML Tags by [auto-pairs](https://github.com/jiangmiao/auto-pairs) and [vim-closetag](https://github.com/alvan/vim-closetag)

Enhancement for auto close brackets(pairs) and html tags.

#### Easy Comment by [nerdcommenter](https://github.com/preservim/nerdcommenter)

The most popular key mappings are:

- `<leader>cc` 🄽🅅 - comment current line or selected lines.
- `<leader>cn` 🄽🅅 - comment current line or selected lines with force nesting.
- `<leader>c<space>` 🄽🅅 - toggle current line or selected lines.

Please visit nerdcommenter for more key mappings.

#### Highlight/Mark words by [vim-mark](https://github.com/inkarkat/vim-mark) and [vim-ingo-library](https://github.com/inkarkat/vim-ingo-library)

Make a word or something highlight/marked could be quite useful in some cases:

- `<leader>m` 🄽 - mark/clear a (marked) word under cursor.
- `<leader>n` 🄽 - clear a mark under cursor.
- `<leader>M` 🄽 - disable/enable all marks.
- `<leader>N` 🄽 - clear all marks.

### Customization

Please custom your own settings in **_user-settings.vim_** and **_coc-settings.json_**.

#### GUI Fonts

[Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) is installed by default(only downloaded on Windows and need manually install). Please manually install other fonts and configure font settings in `~/.vim/user-settings.vim` if you want to customize gui fonts.

### Command Line Utility (vcmd)

A bunch of command line utilities (named **_vcmd_**) are implemented by python3 to speed up daily work.
Here's an example:

```
$ vgit --help
Usage: vgit [OPTIONS] [ARGS]...

  Dummy UI for git

  Example:

  $ vgit -ps
  [vcmd] choose remote repository 'origin'[0] (by default 0):
  [vcmd] choose branch (by default master):
  [vcmd] enter comment: test vgit -ps
  [vcmd] git push to origin/master with '[vcmd] git push at test vgit -ps', yes? Y
  [master 0995109] [vcmd] git push at test vgit -ps
   2 files changed, 80 insertions(+), 42 deletions(-)
  Enumerating objects: 9, done.
  Counting objects: 100% (9/9), done.
  Delta compression using up to 12 threads
  Compressing objects: 100% (5/5), done.
  Writing objects: 100% (5/5), 2.21 KiB | 1.10 MiB/s, done.
  Total 5 (delta 4), reused 0 (delta 0)
  remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
  To https://github.com/linrongbin16/lin.vim
     9ff7a14..0995109  master -> master

Options:
  -b, --branch [local|remote|all|this|create|switch|delete]
                                  branch operations, use
                                  `local/remote/all/this` to display
                                  local/remote/all branches, use
                                  `create/move/delete` to create/switch/delete
                                  with branches
  -pl, --pull                     pull, use --force to pull force
  -ps, --push                     push, use --force to push force
  -f, --force                     pull/push force
  -d, --discard                   discard local changes
  --reset TEXT                    reset N previous commits(you need to push
                                  force to override remote repository)
  --revert TEXT                   revert N previous commits(use new commit
                                  instead of push force)
  -p, --proxy [add|switch|none|purge|show]
                                  proxy configuration, use `add` to add new ip
                                  proxy, use `switch` to switch between
                                  different ip proxies, use `none` to disable
                                  ip proxy, use `purge` to remove all
                                  configured ip proxies(and disable currently
                                  using ip proxy if exist), use `show` to
                                  display configured ip proxies and currently
                                  using ip proxy if exist
  --debug                         debug mode
  --help                          Show this message and exit.
```

Please try `--help` on **_vcmd_** commands for more usage.

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
