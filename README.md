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
1. Add `%HOMEPATH%\.vim\commands` to *PATH*.
2. Install [Git](https://git-scm.com/) with *Use Git from Windows Command Prompt*, since we reply on UNIX command.
3. Install [Vim for Windows](https://tuxproject.de/projects/vim/), add *gvim.exe* to *PATH*.
5. Install [NodeJs](https://nodejs.org/) with *Add Nodejs to PATH for ALL Users*
6. Install [Python27](https://www.python.org/downloads/release/python-2714/) with *Add python to PATH for ALL Users*.
7. Install [liblua5.x.dll](http://luabinaries.sourceforge.net/download.html) to `%HOMEPATH%\.vim\commands` which match the *Vim* built lua version.

```bash
    git clone https://github.com/linrongbin16/lin-vim %HOMEPATH%/.vim
    cd %HOMEPATH%/.vim
    install.bat
```

Optionally install *WINMONACO.TTF*, *Monaco-Powerline.ttf*, [Cmder](http://cmder.net/) or [ConEmu](http://conemu.github.io), choose fonts *Monaco-Powerline* for *Terminal* in order to enable Oh-My-Zsh theme *agnoster*.

# A highly optimized .vimrc config file

The .vimrc file is suited to programming.
* A basic config can be used across Windows, Mac and linux.
* Completion Engine based on YouCompleteMe, JavaComplete2, UltiSnip, etc.
* Configured plugins.

# Plugins

lin-vim contains a curated set of popular vim plugins, colors, snippets and syntaxes. Great care has been made to ensure that these plugins play well together and have optimal configuration.

* [Vundle](https://github.com/gmarik/vundle)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [NERDTree](https://github.com/scrooloose/nerdtree)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [solarized](https://github.com/altercation/vim-colors-solarized)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [EasyMotion](https://github.com/Lokaltog/vim-easymotion)
* [Airline](https://github.com/bling/vim-airline)
* [Powerline Fonts](https://github.com/Lokaltog/powerline-fonts)

# Fork me on GitHub

I'm always happy to take pull requests from others. Go ahead and fork me.
