set runtimepath+=$HOME/.vim
set nocompatible

" bell
set noerrorbells
set novisualbell
if has("gui_running")
    " gui bell
    autocmd GUIEnter * set vb t_vb=
endif

" file writing
set autoread
set autowrite
set ruler
set magic
set showmatch
set noundofile
set nobackup
set noswapfile
set nowritebackup

" encoding

" set fileformat=unix
" set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
set termencoding=utf-8
set encoding=utf-8

" windows behave
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
source $VIMRUNTIME/mswin.vim
behave mswin
language messages en_US.UTF-8

" mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" plugins
set noignorecase
filetype on
filetype plugin on
filetype indent on

" syntax
syntax on
syntax enable

" no menu window
set completeopt=menu

" folding
set foldenable
set foldmethod=indent
set foldnestmax=99
set foldlevel=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" indent
set cindent
set smartindent
set autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" display
set showcmd
set hlsearch
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
set clipboard+=unnamed
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set modifiable

set cursorline
set scrolloff=1
set nocursorcolumn
set norelativenumber
set number
set laststatus=2
set lazyredraw
set ttyfast
set hidden
set updatetime=100
set cmdheight=2
set regexpengine=1

if has("gui_running")
    " gvim toolbox
    set guioptions-=T
    " gvim menu
    set guioptions-=m
endif

" fix maxmatchparen memory issue for syntax on large file
set mmp=10000

" faster regex engine
set regexpengine=1
set termguicolors
