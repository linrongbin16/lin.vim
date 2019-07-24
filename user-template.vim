" width height
if has('gui_running')
    set lines=35
    set columns=140
endif

" fonts
if has("win32")
    " win32
    set guifont=Hack:h12
elseif has("mac")
    " macos
    set guifont=Hack:h14
else
    " linux, unix
    set guifont=Hack\ 10
endif

" nerdtree width
let g:NERDTreeWinSize=40
" nerdtree auto open
if has('gui_running')
    autocmd StdinReadPre * let s:std_in=1
    autocmd vimenter * NERDTree
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
endif

" terminal
nmap <F9> :terminal ++rows=20<cr>
