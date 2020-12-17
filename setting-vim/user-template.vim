" key operations
" switch between C/C++ header source
map <F1> :CocCommand clangd.switchSourceHeader<CR>
" format current file
map <F2> :call CocAction('format')<CR>
" open/close nerdtree file explorer
map <F5> :NERDTreeToggle<CR>
" open/close tagbar
nmap <F6> :TagbarToggle<CR>
" next color
map <F9> :call NextColor()<CR>
" open terminal
map <F10> :terminal ++rows=20<CR>

" command operations
" copy visual selection to disk cache
vnoremap <Leader>y :w! ~/.cache/.lin.vim.copypaste<CR>
" copy disk cache to cursor
nnoremap <Leader>p :r ~/.cache/.lin.vim.copypaste<CR>

" buffer operations
" go to next buffer
map <Leader>bn :bn<cr>
" go to previous buffer
map <Leader>bp :bp<cr>
" close current buffer
map <Leader>bd :bd<cr>

" filetype mapping
autocmd BufRead,BufNewFile *.hql set filetype=sql
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.hs set filetype=haskell
autocmd BufRead,BufNewFile *Makefile* set filetype=make
autocmd BufRead,BufNewFile *makefile* set filetype=make
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd BufRead,BufNewFile *.scm set filetype=lisp

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
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" C++ indent with 2 space
autocmd FileType c,cpp,h,hpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" line length marker=80
set colorcolumn=80
