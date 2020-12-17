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
    $ choco install git python cmake vim llvm nodejs ag ripgrep universal-ctags
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```
3. Add third party dependencies in `$env:Path`, add `$env:UserProfile\.vim\command` to `$env:Path`.
4. Install hack nerd fonts windows compatible manually downloaded in `$env:UserProfile\.vim\guifonts`:
    * `Hack Regular Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Italic Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf`
    * `Hack Bold Nerd Font Complete Mono Windows Compatible.ttf`

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

- vencode

```
$ vencode -h
usage: vencode [option] text

  Encode and decode text with algorithms.

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

- vfile

```
$ vfile -h
usage: vfile [option] filetype

  File operations recursively in current directory.

option:
  -d/--delete                           delete files with filetype
  -r/--replace [old] [new]              replace old text with new text in files with filetype
  -l/--list                             list files with filetype
  -c/--convert-encoding [encoding]      convert file encoding from old encoding to new with files with filetype
  -s/--show-encoding                    show file encoding with files in filetype

  --hidden                              include hidden directories/files (.svn .git etc) for operations above, by default exclude hidden directories/files.
  -h/--help                             show help message

encoding:
  GB18030/GB2312/GBK                    Windows chinese encoding
  UTF-8                                 Unicode UTF-8


example:
  $ vfile -d log
  remove => 2020-11-12-23_03_16.log
  remove => 2020-11-12-23_07_30.log
  remove => ./testcases/2020-11-12-23_12_51.log
  remove => ./testcases/2020-11-12-23_30_07.log

  $ vfile -s test.log
  test.log: ascii
```

- vgen

```
$ vgen -h
usage: vgen [option]

  Generate common configurations.

option:
  -c/--clangd                           generate 'compile_commands.json' for clangd
                                        generate 'compile_flags.txt' otherwise if 'CMakeLists.txt' not available or on Windows Visual Studio toolchain
  -s/--sshkey [email]                   generate '~/.ssh/id_rsa' and '~/.ssh/id_rsa.pub' for [email]
  -m/--mirror [country/region]          generate mirrors of pip(python), npm(nodejs) and homebrew(macos) for [country/region]

  -h/--help                             show help message

country/region:
  china

example:
  $ vgen -s linrongbin16@outlook.com
  Generating public/private rsa key pair.
  Enter file in which to save the key (/Users/linrongbin/.ssh/id_rsa):
  Enter passphrase (empty for no passphrase):
  Enter same passphrase again:
  Your identification has been saved in /Users/linrongbin/.ssh/id_rsa
  Your public key has been saved in /Users/linrongbin/.ssh/id_rsa.pub
  The key fingerprint is:
  SHA256:LiSwQUBzThXXXXXXXXXXXXXXXXXXXXHQxTNow3o61W8 linrongbin16@outlook.com
  The key's randomart image is:
  +---[RSA 4096]----+
  |XXXXXXXXXX       |
  | XXXXXXXXXX      |
  |  XXXXXXXXXX     |
  |   XXXXXXXX      |
  |  XXXXXXXXX      |
  |     XXXXXXX     |
  |      XXXXX      |
  |       X         |
  |                 |
  +----[SHA256]-----+
```

- vgit

```
$ vgit -h
usage: vgit [option]

  Git quick operations.

option:
  -b/--branch [command]     branch operations, the commands are:
                              a/all             - show all git repository branches, include local and remote
                              l/local           - show git repository local branches
                              r/remote          - show git repository remote branches
                              t/this            - show git repository current branch
                              c/create [branch] - create new local branch and move to it
                              m/move [branch]   - move to existing local branch
                              d/delete [branch] - delete local branch

  -pl/--pull                pull operation
  -ps/--push                push operation
  -f/--force                force pull/push, use with pull/push

  -d/--discard              discard temporary changes
  --rebase [branch]         rebase to specified remote/branch
  --revert [n]              revert to last n commit(create new commit without push force), by default 1
  --reset [n]               reset to last n commit(do not create new commit, have to push force to overwrite remote), by default 1

  --proxy [command]         proxy configuration, the commands are:
                              c/config [proxy]  - configure proxy for git
                              s/show            - show git proxy configuration
                              e/enable          - enable git proxy configuration
                              d/disable         - disable git proxy configuration

  -h/--help                 show help message

example:
  $ vgit -ps
  [vcmd] detected remote repositories: 'origin'[0]
  [vcmd] choose remote repository 0, by default: 'origin'[0]:
  [vcmd] choose branch, by default: 'master':
  [vcmd] enter comment: optimize vgit
  [vcmd] git push to origin/master with 'optimize vgit', yes? y
  [master 3666d83] optimize vgit
   1 file changed, 74 insertions(+), 121 deletions(-)
  Enumerating objects: 7, done.
  Counting objects: 100% (7/7), done.
  Delta compression using up to 12 threads
  Compressing objects: 100% (4/4), done.
  Writing objects: 100% (4/4), 1.42 KiB | 1.42 MiB/s, done.
  Total 4 (delta 3), reused 0 (delta 0)
  remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
  To https://github.com/linrongbin16/lin.vim
     31e5da9..3666d83  master -> master
```

- vip

```
$ vip -h
usage: vip [option] [ipaddress]

  Validate IP address.

option:
  -v/--validate [mode]                  validate ipaddress, by default validate IPv4 address.
  --min [mode]                          print minimum ipaddress
  --max [mode]                          print maximum ipaddress
  --loopback [mode]                     print loopback ipaddress

  -h/--help                             show help message

mode:
  v4                                    ipv4
  v6                                    ipv6

example:
  $ vip 127.0.0.1
  127.0.0.1 (2130706433)

  $ vip 2133706831
  127.45.200.79 (2133706831)

  $ vip -v v6 2133706831
  127.45.200.79 (2133706831)

  $ vip --max v6
  ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff (340282366920938463463374607431768211455)

  $ vip.py 289.a.i.1
  error: invalid IPv4:289.a.i.1
```

- vpack

```
$ vpack -h
usage: vpack [option] filename

  Compression and extraction.

option:
  -c/--compress [algorithm]         pack directory/file with algorithm, by default generate .tar.gz package
  -e/--extract                      unpack packaged file with detected algorithm

  -h/--help                         show help message

algorithm:
  targz                             .tar.gz file
  tgz                               .tar.gz file
  tarbz2                            .tar.bz2 file
  tar                               .tar file
  zip                               .zip file
  7z                                .7z file

example:
  $ vpack -e Hack.zip
  Archive:  Hack.zip
    inflating: Hack Bold Nerd Font Complete Mono.ttf
    inflating: Hack Bold Nerd Font Complete Mono Windows Compatible.ttf
    inflating: Hack Bold Nerd Font Complete Windows Compatible.ttf
    inflating: Hack Bold Nerd Font Complete.ttf
    inflating: Hack Bold Italic Nerd Font Complete Mono.ttf
    inflating: Hack Bold Italic Nerd Font Complete.ttf
    inflating: Hack Bold Italic Nerd Font Complete Windows Compatible.ttf
    inflating: Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf
    inflating: Hack Regular Nerd Font Complete.ttf
    inflating: Hack Regular Nerd Font Complete Windows Compatible.ttf
    inflating: Hack Regular Nerd Font Complete Mono Windows Compatible.ttf
    inflating: Hack Regular Nerd Font Complete Mono.ttf
    inflating: Hack Italic Nerd Font Complete Mono Windows Compatible.ttf
    inflating: Hack Italic Nerd Font Complete Mono.ttf
    inflating: Hack Italic Nerd Font Complete.ttf
    inflating: Hack Italic Nerd Font Complete Windows Compatible.ttf

  $ vpack -c package
  a package
  a package/test.log
  a package/test3.log
  a package/test2.log
```

- vag

```
$ vag -h
usage: vag [option] filetype

  Text search implemented by the silver searcher ag.

option:
  -w/--word                         search word
  -c/--count                        count text
  -d/--depth [number]               search depth, search current directory only if 0, by default 25
  --case-sensitive                  search case sensitively, by default false

  -i/--ignore [filetype]            add filetype to search ignore configuration, the filetype will be ignored in next search
  -p/--purge                        purge all filetypes in search ignore configurations
  -s/--show                         show all filetypes in search ignore configurations

  -h/--help                         show help message

example:
  $ vag Binder
  $ vag --depth=0 Binder
  $ vag --depth=0 --case-sensitive Binder
  $ vag --word Binder
  $ vag --count Binder
  $ vag --ignore=svn
  $ vag --purge
  $ vag --show
```

- vtime

```
$ vtime -h
usage: vtime [option] datetime

  Datetime and timestamp conversion.

option:
  [utc] -d/--datetime [timestamp]       convert timestamp to datetime string, by default timestamp is local system timestamp
  [utc] -t/--timestamp [datetime]       convert datetime string to timestamp, by default datetime is local system datetime

  -h/--help                             show help message

utc:
  -u/--utc                              convert with UTC zone, by default false

example:
  $ vtime -d
  2020-12-16 17:27:41.872

  $ vtime -t
  1608110863.764814
```
