""" ---- Basic settings ----

set runtimepath+=$HOME/.vim
set nocompatible

""" bell
set noerrorbells
set visualbell t_vb=

""" file
set autoread
autocmd FocusGained,BufEnter * checktime
set autowrite
set noundofile
set nobackup
set noswapfile
set nowritebackup
set modifiable
set hidden

""" editing
set backspace=indent,eol,start
set whichwrap+=b,s,<,>,[,]
set clipboard^=unnamed,unnamedplus

""" language
language messages en_US.UTF-8

""" encoding
" set fileformat=unix
" set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,big5,euc-jp,euc-kr,default,latin1
set termencoding=utf-8
set encoding=utf-8

" mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" indent
set cindent
set smartindent
set autoindent
set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4

" plugin
filetype on
filetype plugin on
filetype indent on

" syntax
syntax on
syntax enable

" menu window
set completeopt=menu

" folding
set foldenable
set foldmethod=indent
set foldnestmax=100
set foldlevel=100
nnoremap zz @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" search
set magic
set noignorecase
set hlsearch
if has('patch-8.0.1238')
    set incsearch
endif

""" whitespace
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

""" color
set background=dark
if has("termguicolors")
    set termguicolors
endif
set nocursorcolumn
" set colorcolumn=120
set cursorline

""" ui
set ruler
set showmatch
set showcmd
set wrap
set number
set norelativenumber
set signcolumn=yes

""" scroll
set scrolloff=1

""" notification
set shortmess+=c
set cmdheight=2
set laststatus=2

""" update
set updatetime=300

" render optimization
set lazyredraw
set ttyfast
" set regexpengine=1
" set re=0

" fix maxmatchparen memory issue
set mmp=10000

" disable macvim GUI key mappings
let macvim_skip_cmd_opt_movement=1

" disable syntax highlighting sync on big file for better lantency
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syn sync clear | endif
