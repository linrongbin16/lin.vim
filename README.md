# lin-vim : Lin Rongbin's Vim Distribution

lin-vim is a distribution of Vim.

It is highly configured [VIM](https://www.vim.org/) integrated tons of utilities for development running on most operating systems.

![pic1.jpg](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic1.jpg)

![pic2.jpg](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic2.jpg)

_Suggestion: using with [boostscript](https://github.com/linrongbin16/boostscript)_.

# Feature

- Multiple platform support: linux, unix, windows and mac.
- Auto complete engine based on: YouCompleteMe, universal-ctags and ultisnips.
- Multiple file format and programming languages support: C/C++, Python, Golang, Rust, Javascript, Haskell, Markdown, etc.
- Random color schemes, better UI and syntax highlighting.
- Async syntastics check.
- File explorer and finder.
- Well configured hot key.

# Installation

### Linux, UNIX, MacOS Installation

```bash
    $ git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

### Windows Installation

1.  Install [Git](https://git-scm.com/), choose **Use Git from Windows Command Prompt**.
2.  Install [7-zip](http://www.7-zip.org/).
3.  Install [Python3](https://www.python.org/downloads/), install globally with **pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint sqlparse sqlformat**.
4.  Install [CMake](https://cmake.org/), choose **Add cmake to PATH**.
5.  Install [Vim for Windows](https://tuxproject.de/projects/vim/), **Add gvim.exe to PATH**.
6.  Install [Visual Studio](https://www.visualstudio.com/), choose **VC++ for desktop**.
7.  Install [LLVM](http://releases.llvm.org/download.html), choose **Add LLVM to PATH**.
8.  Install [NodeJs](https://nodejs.org/), choose **Add node to PATH**, install globally with **npm install -g --unsafe-perm js-beautify eslint tslint typescript-formatter**.
9.  Install [ag](https://github.com/k-takata/the_silver_searcher-win32/releases), **add ag.exe to PATH**.
10. Install [ctags](https://github.com/universal-ctags/ctags-win32/releases), **add ctags.exe readtags.exe to PATH**.
11. Install [Hack Font](https://sourcefoundry.org/hack/).

```bash
    $ git clone https://github.com/linrongbin16/lin-vim %USERPROFILE%\.vim
    $ cd %USERPROFILE%\.vim
    $ install.bat
```
