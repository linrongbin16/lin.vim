# lin-vim : Lin Rongbin's Vim Distribution


         _   _                    _
        | | (_)____       __   __(_)_ __ ___
        | | | |  _ \ _____\ \ / /| | '_ ` _ \
        | | | | | | |_____|\ V / | | | | | | |
        |__\|_|_| |_|       \_/  |_|_| |_| |_|



Lin-Vim is a distribution of Vim and DevTools.

It is for anyone intending to use VIM for development running equally well on Windows, Linux, \*nix and Mac.

# Installation

### Windows Installation

Windows need these software as dependencies. Make sure they're available in `%PATH%`:
1. [git](https://git-scm.com/), curl
2. [vim for Windows](https://tuxproject.de/projects/vim/)
3. [Visual Studio](https://www.visualstudio.com/)
4. [cmake](https://cmake.org/)
5. [node](https://nodejs.org/), npm

```bash
    git clone https://github.com/linrongbin16/lin-vim %HOMEPATH%/.vim && cd %HOMEPATH%/.vim && cmd install.bat
```

Mannually install *guifonts/WINMONACO.TTF* font for *GVim*.

### Linux, UNIX, MacOS Installation

```bash
    git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

Mannually install *guifonts/Monaco.ttf* and *guifonts/Monaco-for-Powerline.tty* font.
Choose *Fonts -> Monaco-Powerline* to support *Oh-My-Zsh Theme Agnoster*.

# A highly optimized .vimrc config file

The .vimrc file is suited to programming.

 * A single config can be used across Windows, Mac and linux
 * Setup the interface to take advantage of vim's features including
   * omnicomplete
   * line numbers
   * syntax highlighting
   * A better ruler & status line
   * & more
 * Configuring included plugins

# Plugins

lin-vim contains a curated set of popular vim plugins, colors, snippets and syntaxes. Great care has been made to ensure that these plugins play well together and have optimal configuration.

* [Vundle]:https://github.com/gmarik/vundle
* [NERDCommenter]:https://github.com/scrooloose/nerdcommenter
* [NERDTree]:https://github.com/scrooloose/nerdtree
* [ctrlp]:https://github.com/kien/ctrlp.vim
* [solarized]:https://github.com/altercation/vim-colors-solarized
* [Fugitive]:https://github.com/tpope/vim-fugitive
* [Surround]:https://github.com/tpope/vim-surround
* [Tagbar]:https://github.com/majutsushi/tagbar
* [vim-easymotion]:https://github.com/Lokaltog/vim-easymotion
* [YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
* [Tabularize]:https://github.com/godlygeek/tabular
* [EasyMotion]:https://github.com/Lokaltog/vim-easymotion
* [Airline]:https://github.com/bling/vim-airline
* [Powerline]:https://github.com/lokaltog/powerline
* [Powerline Fonts]:https://github.com/Lokaltog/powerline-fonts

# Fork me on GitHub

I'm always happy to take pull requests from others. Go ahead and fork me.
