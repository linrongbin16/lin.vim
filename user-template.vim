" width height
set lines=50
set columns=200

" fonts
" win32
set guifont=Fira\ Code:h9
" linux, unix
set guifont=Hack\ 9
" macos
set guifont=Hack:h14

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
