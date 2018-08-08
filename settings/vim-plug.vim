"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    " Make windows use ~/.vim too, I don't want to use _vimfiles
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" Common
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'elzr/vim-json'
Plug 'terryma/vim-multiple-cursors'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', { 'on': [] } | call plug#load('vimfiler.vim')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'ervandew/supertab'

" C++ Python
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'CC', 'cxx', 'cpp', 'h', 'hpp', 'HH', 'hxx', 'hh'] }
Plug 'Valloric/YouCompleteMe'
Plug 'hdima/python-syntax', { 'for': ['py'] }
" Java
"Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java'] }
" html/css/js
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json', 'less'] }
Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json', 'less'] }
Plug 'groenewege/vim-less', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json', 'less'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'mxw/vim-jsx', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'maksimr/vim-jsbeautify'
" Golang
Plug 'fatih/vim-go', { 'for': ['go'] }
" Thrift
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
" php
"Plug 'StanAngeloff/php.vim', { 'for': ['php'] }
" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['hs']}
" rust
Plug 'rust-lang/rust.vim', { 'for': ['rs'] }
Plug 'phildawes/racer', { 'for': ['rs'] }
" ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['rb', 'ruby'] }
Plug 'tpope/vim-rails', { 'for': ['rb', 'ruby'] }
" scala
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" markdown
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown', 'MD'] }


call plug#end()
