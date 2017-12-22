# lin-vim : Lin Rongbin's Vim Distribution

         _   _                    _
        | | (_)____       __   __(_)_ __ ___
        | | | |  _ \ _____\ \ / /| | '_ ` _ \
        | | | | | | |_____|\ V / | | | | | | |
        |__\|_|_| |_|       \_/  |_|_| |_| |_|
            

lin-vim is a distribution of vim configurations, plugins and commands for Vim, Gvim. Project is forked from [spf13-vim](https://github.com/spf13/spf13-vim), while completely different from the origin one.

It is for anyone intending to use VIM for development running equally well on Windows, Linux, \*nix and Mac.

On Windows, lin-vim depend on the MingW32 Msys environment of Git.

# Installation

### Windows Dependencies

*Requires*
1. [vim for windows](https://tuxproject.de/projects/vim/)
2. [python27](https://www.python.org/downloads/release/python-2714/)
3. [git](https://git-scm.com/)
4. [TDM-GCC](http://tdm-gcc.tdragon.net/download)

### Installing lin-vim

```bash
    git clone https://github.com/linrongbin16/lin-vim ~/.vim && cd ~/.vim && bash install.sh
```

# A highly optimized .vimrc config file

The .vimrc file is suited to programming. It is extremely well organized and folds in sections.
Each section is labeled and each option is commented.

It fixes many of the inconveniences of vanilla vim including

 * A single config can be used across Windows, Mac and linux
 * Eliminates swap and backup files from littering directories, preferring to store in a central location.
 * Fixes common typos like :W, :Q, etc
 * Setup a solid set of settings for Formatting (change to meet your needs)
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
