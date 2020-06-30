" gui window size
if has('gui_running')
    set lines=999
    set columns=999
    if has('win32')
        au GUIEnter * simalt ~x
    endif
endif

" gui fonts
if has("win32")
    " win32
    set guifont=Hack\ NF:h9
elseif has("mac")
    " macos
    set guifont=Hack\ Nerd\ Font\ Mono:h12
else
    " linux, unix
    set guifont=Hack\ Nerd\ Font\ Mono\ 10
endif


" nerdtree width
let g:NERDTreeWinSize=40

" nerdtree auto open
" if has('gui_running')
    autocmd StdinReadPre * let s:std_in=1
    autocmd vimenter * NERDTree
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" endif

" C++ indent with 2 space
autocmd FileType c,cpp,h,hpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
