# lin-vim : Lin Rongbin's Vim Distribution


         _   _                    _
        | | (_)____       __   __(_)_ __ ___
        | | | |  _ \ _____\ \ / /| | '_ ` _ \
        | | | | | | |_____|\ V / | | | | | | |
        |__\|_|_| |_|       \_/  |_|_| |_| |_|



lin-vim is a distribution of Vim and DevTools.

It is for anyone intending to use VIM for development running equally well on Windows, Linux, \*nix and Mac.

*Suggest using with [boostscript](https://github.com/linrongbin16/boostscript) Project*

# Installation

### Linux, UNIX, MacOS Installation

```bash
    git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

### Windows Installation

Install on Windows mannually:
1. Install [Git](https://git-scm.com/), choose **Use Git from Windows Command Prompt** since we rely on UNIX command.
2. Install [7-zip](http://www.7-zip.org/).
3. Install [Python3](https://www.python.org/downloads/).
4. Install [CMake](https://cmake.org/), choose **Add cmake to PATH**.
5. Install [Vim for Windows](https://tuxproject.de/projects/vim/), **Add gvim.exe to PATH**.
6. Install [Visual Studio](https://www.visualstudio.com/), choose **VC++**.
7. Install [LLVM](http://releases.llvm.org/download.html) choose **Add LLVM to PATH**.
8. Install [Golang](https://golang.org/).
9. Install [JavaSE](http://www.oracle.com/technetwork/java/javase/downloads/index.html), [Maven](https://maven.apache.org/download.cgi), [Gradle](https://gradle.org/install/#manually), **add java,** **mvn,** **gradle to PATH**, **add CLASSPATH**, **JAVA_HOME to PATH**.
10. Install [NodeJs](https://nodejs.org/) choose **Add Node to PATH**.

```bash
    git clone https://github.com/linrongbin16/lin-vim %USERPROFILE%\.vim
    cd %USERPROFILE%\.vim
    install.bat
```

# A highly optimized .vimrc config file

The .vimrc file is suited to programming.
* Used across Linux, Windows and Mac.
* Completion Engine based on YouCompleteMe, UltiSnip, Ctags.
* Multiple Languages supported.
* Configured plugins.

# Fork me on GitHub

Happy to take pull requests. Go ahead and fork me.
