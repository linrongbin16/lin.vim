# lin-vim : Lin Rongbin's Vim Distribution


         _   _                    _
        | | (_)____       __   __(_)_ __ ___
        | | | |  _ \ _____\ \ / /| | '_ ` _ \
        | | | | | | |_____|\ V / | | | | | | |
        |__\|_|_| |_|       \_/  |_|_| |_| |_|



lin-vim is a distribution of Vim and DevTools.

It is for anyone intending to use VIM for development running equally well on Windows, Linux, \*nix and Mac.

# Installation

### Linux, UNIX, MacOS Installation

```bash
    git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

### Windows Installation

Install on Windows mannually:
1. Install [Git](https://git-scm.com/), during setup choose *Use Git from Windows Command Prompt* since we reply on UNIX command.
2. Install [7-zip](http://www.7-zip.org/).
3. Install [Python27](https://www.python.org/downloads/release/python-2714/), during setup choose *Add python to PATH for ALL Users*.
4. Install [Vim for Windows](https://tuxproject.de/projects/vim/), add *gvim.exe* to *PATH*.
5. Install [Visual Studio](https://www.visualstudio.com/), during setup choose *VC++*.
6. Install [LLVM](http://releases.llvm.org/download.html), during setup choose *Add LLVM to PATH for ALL Users*.
7. Install [NodeJs](https://nodejs.org/), during setup choose *Add Nodejs to PATH for ALL Users*
8. Install [Golang](https://golang.org/), add *Add Go to PATH for ALL Users*, add `GOPATH=%HOMEPATH%/go`, `%GOPATH%/bin`, `%GOROOT%/bin`, `%HOMEPATH%\.vim\commands` to *PATH*.
9. Install [JavaSE](http://www.oracle.com/technetwork/java/javase/downloads/index.html), [Maven](https://maven.apache.org/download.cgi), [Gradle](https://gradle.org/install/#manually), add *java* *mvn* *gradle* to *PAT*.

```bash
    git clone https://github.com/linrongbin16/lin-vim %HOMEPATH%\.vim
    cd %HOMEPATH%\.vim
    install.bat
```

# A highly optimized .vimrc config file

The .vimrc file is suited to programming.
* Used across Linux, Windows and Mac.
* Completion Engine based on YouCompleteMe, UltiSnip, Ctags.
* Multiple Languages supported.
* Configured plugins.

# Plugins

lin-vim contains a tons of popular plugins, colors, snippets and syntaxes. These plugins are highly configured and work well together.

* [vim-plug](https://github.com/junegunn/vim-plug)
* [solarized-color-theme](https://github.com/altercation/vim-colors-solarized)
* [dracula-color-theme](https://draculatheme.com/vim/)
* [airline](https://github.com/bling/vim-airline)
* [indentline](https://github.com/Yggdroot/indentLine)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [Powerline Fonts](https://github.com/Lokaltog/powerline-fonts)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [EasyMotion](https://github.com/Lokaltog/vim-easymotion)
* [DoxygenToolkit](https://github.com/vim-scripts/DoxygenToolkit.vim)
* [Ag](https://github.com/rking/ag.vim)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [ctags](ctags.sourceforge.net)
* [cscope](cscope.sourceforge.net)
* [CscopeMaps](http://cscope.sourceforge.net/cscope_maps.vim)
* [Asynchronous Lint Engine](https://github.com/w0rp/ale)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [UltiSnips](https://github.com/SirVer/ultisnips)
* [emmet-vim](https://github.com/mattn/emmet-vim)
* [vim-go](https://github.com/fatih/vim-go)
* [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
* [haskell-vim](https://github.com/neovimhaskell/haskell-vim)
* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [vim-scala](https://github.com/derekwyatt/vim-scala)
* [rust.vim](https://github.com/rust-lang/rust)
* [vim-racer](https://github.com/racer-rust/vim-racer)
* etc

# Fork me on GitHub

Happy to take pull requests. Go ahead and fork me.
