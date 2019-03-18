# lin-vim : Lin Rongbin's Vim Distribution

         _ _                  _           
        | (_)_ __      __   _(_)_ __ ___  
        | | | '_ \ ____\ \ / / | '_ ` _ \ 
        | | | | | |_____\ V /| | | | | | |
        |_|_|_| |_|      \_/ |_|_| |_| |_|


lin-vim is a distribution of Vim and DevTools.

It is for anyone intending to use VIM for development running equally well on Windows, Linux, \*nix and Mac.

![pic1.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic1.png)

![pic2.png](https://raw.githubusercontent.com/linrongbin16/lin-vim/master/pic2.png)

_Suggest using with [boostscript](https://github.com/linrongbin16/boostscript)_.

# Installation

### Linux, UNIX, MacOS Installation

```bash
    git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

### Windows Installation

1.  Install [Git](https://git-scm.com/), choose **Use Git from Windows Command Prompt**.
2.  Install [7-zip](http://www.7-zip.org/).
3.  Install [Python3](https://www.python.org/downloads/), install globally with **pip install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint**.
4.  Install [CMake](https://cmake.org/), choose **Add cmake to PATH**.
5.  Install [Vim for Windows](https://tuxproject.de/projects/vim/), **Add gvim.exe to PATH**.
6.  Install [Visual Studio](https://www.visualstudio.com/), choose **VC++ for desktop**.
7.  Install [LLVM](http://releases.llvm.org/download.html), choose **Add LLVM to PATH**.
9.  Install [ag](https://github.com/k-takata/the_silver_searcher-win32/releases), **add ag.exe to PATH**.
10. Install [ctags](https://github.com/universal-ctags/ctags-win32/releases), **add ctags.exe readtags.exe to PATH**.
11. Install [Hack Font](https://sourcefoundry.org/hack/).

```bash
    git clone https://github.com/linrongbin16/lin-vim %USERPROFILE%\.vim
    cd %USERPROFILE%\.vim
    install.bat
```

# A highly optimized .vimrc config file

The .vimrc file is suited to programming.

-   Used across Linux, Windows and Mac.
-   Completion Engine based on YouCompleteMe, Universal-Ctags.
-   Multiple Programming Languages supported.
-   Configured plugins and Develop Tools.

# Fork me on GitHub

Happy to take pull requests. Go ahead and fork me.
