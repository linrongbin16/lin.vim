"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    " Make windows use ~/.vim too, I don't want to use _vimfiles
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" UI Manager
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', { 'on': [] } | call plug#load('vimfiler.vim')

" Color Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'
Plug 'crusoexia/vim-monokai'
Plug 'raphamorim/lucario'
Plug 'kadekillary/subtle_solo'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'w0ng/vim-hybrid'
Plug 'jnurmine/Zenburn'
Plug 'sjl/badwolf'

" Synatax
Plug 'w0rp/ale', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh', 'py', 'go', 'rb', 'ruby', 'hs', 'rs', 'java', 'php', 'cs', 'sql', 'lisp', 'kt', 'sh', 'el', 'erl', 'scala', 'html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
" Auto Format
Plug 'Chiel92/vim-autoformat'

" Complete Engine
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Coding Util
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Json
Plug 'elzr/vim-json'
" C++ Python Java
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }
Plug 'hdima/python-syntax', { 'for': ['py'] }
" html/css/js
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'js', 'jsx', 'xml', 'xhtml', 'json', 'less'] }
Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'js', 'jsx', 'xml', 'xhtml', 'json', 'less'] }
Plug 'groenewege/vim-less', { 'for': ['html', 'css', 'js', 'jsx', 'xml', 'xhtml', 'json', 'less'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
Plug 'mxw/vim-jsx', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
Plug 'maksimr/vim-jsbeautify', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
" Golang
Plug 'fatih/vim-go', { 'for': ['go'] }
" Thrift
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['hs'] }
" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rs'] }
Plug 'phildawes/racer', { 'for': ['rs'] }
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['rb', 'ruby'] }
Plug 'tpope/vim-rails', { 'for': ['rb', 'ruby'] }
" Scala
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" Markdown
Plug 'plasticboy/vim-markdown', { 'for': ['md'] }


call plug#end()
