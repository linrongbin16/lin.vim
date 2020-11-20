# lin.vim : Lin Rongbin's (Neo)Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development running on most operating systems.

![pic1.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic1.jpg)

![pic2.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic2.jpg)

![pic3.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic3.jpg)

![pic4.jpg](https://raw.githubusercontent.com/linrongbin16/lin.vim/master/picture/pic4.jpg)

# Feature

- Running on multiple platforms: UNIX/Linux, Windows and MacOS.
- Code complete, lint and format for most programming languages by [coc.nvim](https://github.com/neoclide/coc.nvim).
- Random color schemes and pretty icons.
- File and buffer explorer and better status line.
- Source code and file fuzzy search.
- Useful command line utilities for: git, text search and encoding/decoding, file operation and compression/extraction, datetime calculation, ip calculation, etc.
- Support both [VIM](https://www.vim.org/) and [Neovim](https://neovim.io/).
- Custom configuration.

# Project Structure

| File/Directory |  Introduction |
|----------------|---------------|
| command        | Contains command line utilities(called vcmd): vcmd/vencode/vfile/vgen/vgit/vpack/vrg/vtime. These commands are implemented in python3. |
| picture        | Screenshot for README. |
| setting-plugin | VimL script settings for vim plugins. |
| setting-vim    | VimL script settings for lin.vim. |
| *install.sh*   | MacOS/UNIX/Linux bash installation script. |
| *install.ps1*  | MacOS/UNIX/Linux bash installation script. |
| install        | Detailed installation scripts for different platforms. There will be **plugged** folder which is auto-managed by [vim-plug](https://github.com/junegunn/vim-plug) after installation. |
| LICENSE        | The license file. |
| *lin.vim*      | The *.vimrc* file. |
| *user.vim*     | Vim settings, customize you own settings here. |
| *coc-settings.json* | Coc-nvim settings, customize your own settings here. |

# User Guide

### Hot Key
- `F1` in normal mode: switch between C/C++ header source file.
- `F2` in normal mode: format current file.
- `F5` in normal mode: open/close file explorer.
- `F6` in normal mode: open/close tagbar explorer.
- `F9` in normal mode: change color theme randomly.
- `F10` in normal mode: open/close terminal.

Please see **user.vim** for more details.

### Enhanced Copy Paste
- `<leader>y` in visual mode: copy visual-selected text to locale machine cache.
- `<leader>p` in normal mode: paste text saved from local machine cache.

Please see **user.vim** for more details.

### Text Search
- `:Ag [text]` or `:Rg [text]` in normal mode: search [text].

Please see **setting-plugin/ripgrep.vim** for more details.

### File Fuzzy Search
- `<c-p>` in normal mode: fuzzy search file.

Please see **setting-plugin/leaderf.vim** for more details.

### Easy Align
- `vipga=` in visual mode: align visual-selected paragraph.
- `gaip=` in normal mode: align inner paragraph.

Please see **setting-plugin/vim-easy-align.vim** for more details.

### Easy Move
- `<leader>s [char]`: go to [char].
- `<leader>w`: go to [word].
- `<leader>j`: go to [forward line].
- `<leader>k`: go to [backward line].

Please see **setting-plugin/vim-easymotion.vim** for more details.

### Coc.nvim Go To
- `gd` in normal mode: go to definition.
- `gy` in normal mode: go to type definition.
- `gi` in normal mode: go to implementation.
- `gr` in normal mode: go to reference.
- `[g` in normal mode: go to previous diagnostic.
- `]g` in normal mode: go to next diagnostic.

Please see **setting-plugin/coc-nvim.vim** and **coc-settings.json** for more details.

### Tags Go To
- `<c-o>` in normal mode: go back to previous position.
- `<c-]>` in normal mode: go to definition if `gd` not working.

Please see **setting-plugin/gutentags.vim** for more details.

### Commentary
- `<leader>c<space>` in normal/visual mode: toggle one line or selected lines.

Please see **setting-plugin/nerdcomment.vim** for more details.

### File Explorer
- `ma` in normal mode: create new file/directory.
- `mc` in normal mode: copy file/directory.
- `md` in normal mode: delete file/directory.
- `mm` in normal mode: move file/directory.

Please see **setting-plugin/nerdtree.vim** for more details.

### Buffer Explorer
- `<leader>bn` in normal mode: go to next buffer.
- `<leader>bp` in normal mode: go to previous buffer.
- `<leader>bd` in normal mode: close current buffer.

Please see **setting-plugin/statusline.vim** for more details.

### Customization
- custom your own settings in **user.vim** and **coc-settings.json**.

### Command Line Utility
- try `vcmd` to find more.

# Installation

### Linux, UNIX, MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

Note: we don't support CMD any more, please use PowerShell on Windows.

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

lin.vim use fonts by default:

* [Hack Nerd Font Complete Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) on UNIX/Linux.
* [Hack Nerd Font Complete Mono Windows Compatible](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) on Windows.

Please manually install other [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) and configure font settings in `~/.vim/user.vim` if you want to customize GUI fonts.

### Vim vs Neovim

Both Vim and Neovim are supported. `nvim` not installed by default. Please install Neovim manually if you need.

### Installation Failure Notification

lin.vim installation needs access:
* [github.com](https://github.com/).
* [raw.githubusercontent.com](https://raw.githubusercontent.com/).
* [chocolatey](https://chocolatey.org/) on Windows.

Please make sure your network is available before installation.
