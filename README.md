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

Optionally choose fonts *Monaco-Powerline* for *Terminal* in order to enable Oh-My-Zsh theme *agnoster*.

### Windows Installation

Install on Windows mannually:
1. Install [Git](https://git-scm.com/), during setup choose *Use Git from Windows Command Prompt* since we reply on UNIX command.
2. Install [7-zip](http://www.7-zip.org/).
3. Install [Python27](https://www.python.org/downloads/release/python-2714/), during setup choose *Add python to PATH for ALL Users*.
4. Install [Vim for Windows](https://tuxproject.de/projects/vim/), add *gvim.exe* to *PATH*.
5. Install [Visual Studio](https://www.visualstudio.com/), during setup choose *VC++*.
6. Install [LLVM](http://releases.llvm.org/download.html), during setup choose *Add LLVM to PATH for ALL Users*.
7. Install [NodeJs](https://nodejs.org/), during setup choose *Add Nodejs to PATH for ALL Users*
8. Install [Golang](https://golang.org/), add *Add Go to PATH for ALL Users*.
9. Add `GOPATH=%HOMEPATH%/go`, Add `%GOPATH%/bin`, `%GOROOT%/bin`, `%HOMEPATH%\.vim\commands` to *PATH*.

```bash
    git clone https://github.com/linrongbin16/lin-vim %HOMEPATH%\.vim
    cd %HOMEPATH%\.vim
    install.bat
```

Optionally install *WINMONACO.TTF*, *Monaco-Powerline.ttf*, [Cmder](http://cmder.net/) or [ConEmu](http://conemu.github.io), choose fonts *Monaco-Powerline* for *Terminal* in order to enable Oh-My-Zsh theme *agnoster*.

# A highly optimized .vimrc config file

The .vimrc file is suited to programming.
* Used across Windows, Mac and linux.
* Completion Engine based on YouCompleteMe, UltiSnip, JavaComplete2, Ctags.
* Configured plugins.

# Plugins

lin-vim contains a tons of popular plugins, colors, snippets and syntaxes. These plugins are highly configured and work well together.

* [vim-plug](https://github.com/junegunn/vim-plug)
* [Ag](https://github.com/rking/ag.vim)
* [Asynchronous Lint Engine](https://github.com/w0rp/ale)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [solarized](https://github.com/altercation/vim-colors-solarized)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [EasyMotion](https://github.com/Lokaltog/vim-easymotion)
* [airline](https://github.com/bling/vim-airline)
* [Powerline Fonts](https://github.com/Lokaltog/powerline-fonts)
* [ClangComplete](https://github.com/Rip-Rip/clang_complete)
* [CscopeMaps](http://cscope.sourceforge.net/cscope_maps.vim)
* [DoxygenToolkit](https://github.com/vim-scripts/DoxygenToolkit.vim)
* [emmet-vim](https://github.com/mattn/emmet-vim)
* [haskell-vim](https://github.com/neovimhaskell/haskell-vim)
* [indentline](https://github.com/Yggdroot/indentLine)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* etc

# Fork me on GitHub

Happy to take pull requests. Go ahead and fork me.
