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

" display
set showcmd
set hlsearch
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
set clipboard+=unnamed

" show whitespace
set list listchars=tab:>-,trail:.,extends:>
set modifiable

set cursorline
set scrolloff=1
set ttyfast
set lazyredraw
set nocursorcolumn
set norelativenumber
set number
"syntax sync minlines=120

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

"" guiconf
if has("gui_running")
    set lines=500
    set columns=500
    if has("win32")
        au GUIEnter * simalt ~x
    endif
    "gvim工具栏
    set guioptions-=T
    "gvim菜单栏
    set guioptions-=m
endif

" ---- guifonts ----
if has("win32") || has("mac")
    "set guifont=Monaco:h10
    "set guifont=Hack:h10
    "set guifont=Fira\ Code:h10
    "set guifont=DejaVu\ Sans\ Mono:h10
    set guifont=Fantasque\ Sans\ Mono:h11
    "set guifont=IBM\ Plex\ Mono:h10
    "set guifont=Andale\ Mono:h10
    "set guifont=Bitstream\ Vera\ Sans\ Mono:h10
    "set guifont=Office\ Code\ Pro:h10
    "set guifont=Inconsolata:h11
    "set guifont=Monofur:h11
    "set guifont=Anonymous\ Pro:h11
else
    "set guifont=Monaco\ 10
    "set guifont=Hack\ 10
    "set guifont=Fira\ Code\ 10
    "set guifont=DejaVu\ Sans\ Mono\ 10
    set guifont=Fantasque\ Sans\ Mono\ 11
    "set guifont=IBM\ Plex\ Mono\ 10
    "set guifont=Andale\ Mono\ 10
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
    "set guifont=Office\ Code\ Pro\ 10
    "set guifont=Inconsolata\ 11
    "set guifont=Monofur\ 12
    "set guifont=Anonymous\ Pro\ 11
endif


" statusline
"set laststatus=2
function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction

set statusline=
set statusline+=%0*[%n]                                         "buffer number
set statusline+=%1*\ \ %<%F                                     "filepath
set statusline+=%2*\ \ [%{''.(&fenc!=''?&fenc:&enc).''}]          "encoding
set statusline+=%2*\ [%{&spelllang}\%{HighlightSearch()}]       "language & Highlight on?
set statusline+=%3*\ %y                                         "filetype
set statusline+=%3*\ [%{&ff}]                                   "fileformat (dos/unix..)
set statusline+=%4*\ %=row:%l/%L\ (%03p%%)                      "row/total (%)
set statusline+=%4*\ \ col:%c                                   "column
set statusline+=%4*\ \ char:0x%04B\ \                           "character under cursor
set statusline+=%0*\ \ %m%r%w\ %P\ \                            "Modified? Readonly? Top/bot.
