set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


" 1. Tools
"Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
"Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'

" 2. Color Theme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" 3 Programming Tools
Plugin 'vim-scripts/a.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'

" 4 Programming Languages
" 4     bash shell
"Plugin 'Shougo/vimshell.vim'
" 4     c++/python
Plugin 'Valloric/YouCompleteMe'
" 4     java
Plugin 'artur-shaik/vim-javacomplete2'
" 4     html/css
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
" 4     javascript
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
" 4     python
Plugin 'hdima/python-syntax'
" 4     golang
Plugin 'fatih/vim-go'
" 4     thrift
Plugin 'solarnz/thrift.vim'
" 4     php
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
" 4     haskell
Plugin 'neovimhaskell/haskell-vim'
" 4     rust
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
" 4     ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
" 4     scala
Plugin 'derekwyatt/vim-scala'
" 4     maven
Plugin 'mikelue/vim-maven-plugin'
" 4     gradle


call vundle#end()            " required
filetype plugin indent on    " required
