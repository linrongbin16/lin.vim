""" ---- Basic settings ----

set runtimepath^=$HOME/.vim

""" VI compatible
set nocompatible

""" bell
set noerrorbells novisualbell
autocmd GUIEnter * set visualbell t_vb=

""" file
set autoread autowrite nobackup noswapfile nowritebackup modifiable hidden
autocmd FocusGained,BufEnter * checktime

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
set encoding=utf-8
set termencoding=utf-8

" mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" indent
set cindent smartindent autoindent
set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4

" plugin
filetype on
filetype plugin indent on

" syntax
syntax on
syntax enable

" complete
set completeopt=menu,menuone,preview

" folding
set foldenable foldlevel=100 foldnestmax=100 foldmethod=indent
nnoremap zz @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" search
set magic noignorecase hlsearch
if has('patch-8.0.1238')
    set incsearch
endif

""" whitespace
set listchars=tab:>·,trail:~,extends:>,precedes:<
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

""" color
set background=dark
if has("termguicolors")
    set termguicolors
endif
set nocursorcolumn cursorline
" set colorcolumn=120

""" ui
set number norelativenumber ruler showcmd showmatch showmode wrap
set signcolumn=yes cmdheight=2 laststatus=2 scrolloff=1 shortmess+=c updatetime=300

""" render
set lazyredraw ttyfast redrawtime=1000 maxmempattern=102400

""" tags
set tags+=./tags,tags

""" disable GUI menu
set guioptions-=T
set guioptions-=m

""" maximize GUI window
if has("gui_running")
    set lines=9999
    set columns=9999
endif
if has('win32') || has('win64')
    autocmd GUIEnter * simalt ~x
endif

""" shorter timeout for better response
set timeout timeoutlen=3000 ttimeoutlen=100

""" disable macvim GUI key mappings
if has("gui_macvim")
    let macvim_skip_cmd_opt_movement = 1
endif
