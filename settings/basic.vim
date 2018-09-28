"" ---- basic.vim ----

set runtimepath+=$HOME/.vim
set nocompatible

" ---- windows ----
set fileformats=unix,dos,mac
if has("gui_running")
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif
if has("win32")
    "source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

" ---- display ----
set showcmd
set hlsearch
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
set clipboard+=unnamed
set number
set numberwidth=5
if has("gui_running")
    "set lines=60
    "set columns=180
    au GUIEnter * simalt ~x
    "gvim工具栏
    set guioptions-=T
    "gvim菜单栏
    set guioptions-=m
endif

" ---- guifonts ----
if has("win32")
    "set guifont=Monaco:h10
    "set guifont=Inconsolata:h11
    "set guifont=Office\ Code\ Pro:h10
    set guifont=Hack:h10
elseif has("mac")
    "set guifont=Monaco:h14
    "set guifont=Inconsolata:h11
    "set guifont=Office\ Code\ Pro:h10
    set guifont=Hack:h10
else
    "set guifont=Monaco\ 10
    "set guifont=Inconsolata\ Regular\ 11
    "set guifont=Office\ Code\ Pro\ 10
    set guifont=Hack\ 10
endif


" show whitespace
set list listchars=tab:>-,trail:.,extends:>
set modifiable
set cursorline

"set nocursorline
set scrolloff=1
set ttyfast
set lazyredraw
set nocursorcolumn
set norelativenumber
syntax sync minlines=256

" sound
set noerrorbells
set novisualbell

" file writing
set autoread
set autowrite
set ruler
set magic
set showmatch

" auto reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" encoding
set encoding=utf-8 
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
set termencoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages en_US.utf-8

" mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" plugins
set noignorecase
set laststatus=2
filetype on
filetype plugin on
filetype indent on
syntax on
syntax enable
set nobackup
set noswapfile
set nowritebackup

" fix bug for gvim
map Q <Nop>

" no more window
set completeopt=menu

" fold code
set foldenable
set foldmethod=indent
set foldnestmax=50
set foldlevel=50
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" ---- indent ----
" all
set cindent
set smartindent
set autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
" C/C++
autocmd FileType c,cpp,cc,cxx,h,hh,hpp,hxx setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab smarttab

" conceallevel
set conceallevel=0
autocmd BufRead,BufNewFile *.md set filetype=markdown
