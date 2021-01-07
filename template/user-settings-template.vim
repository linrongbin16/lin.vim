" custom configurations

" 1. Hot key

" open/close nerdtree file explorer
map <F1> :NERDTreeToggle<CR>
" open/close tagbar
map <F2> :TagbarToggle<CR>
" format current file
map <F3> :call CocAction('format')<CR>
" switch between C/C++ header source
map <F4> :CocCommand clangd.switchSourceHeader<CR>
" open/close terminal
map <F5> :below terminal ++rows=20<CR>
" open enhanced yank list
map <F6> :CocList -A --normal yank<CR>
" open markdown preview
map <F7> :MarkdownPreview<CR>
" next color
map <F8> :call NextColor()<CR>


" 2. Enhanced copy paste

" copy visual selection to cache
vnoremap <Leader>y :w! ~/.vim/.lin-vim-enhanced-copy-paste<CR>
" paste cache to cursor
nnoremap <Leader>p :r ~/.vim/.lin-vim-enhanced-copy-paste<CR>


" 3. Buffer operations

" go to next buffer
map <Leader>bn :bn<cr>
" go to previous buffer
map <Leader>bp :bp<cr>
" close current buffer
map <Leader>bd :bd<cr>


" 4. 10 times faster jkhl
map <c-j> 10j
map <c-k> 10k
map <c-h> 10h
map <c-l> 10l


" 5. Filetype mapping
autocmd BufRead,BufNewFile *.hql set filetype=sql
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.hs set filetype=haskell
autocmd BufRead,BufNewFile *Makefile* set filetype=make
autocmd BufRead,BufNewFile *makefile* set filetype=make
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd BufRead,BufNewFile *.scm set filetype=lisp


" 6. GUI window size
if has('gui_running')
    set lines=999
    set columns=999
    if has('win32')
        au GUIEnter * simalt ~x
    endif
endif

" 7. GUI fonts
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


" 8. Nerdtree settings

" nerdtree window size
let g:NERDTreeWinSize=40
" nerdtree auto open
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" 9. C++ indent with 2 space
autocmd FileType c,cpp,h,hpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" 10. Line length marker=80
set colorcolumn=80

" 11. coc.nvim plugin list
let g:coc_global_extensions = ['coc-marketplace', 'coc-highlight', 'coc-yank', 'coc-snippets', 'coc-tag', 'coc-pyright', 'coc-jedi', 'coc-clangd', 'coc-cmake', 'coc-json', 'coc-html', 'coc-xml', 'coc-css', 'coc-tsserver', 'coc-eslint', 'coc-sql', 'coc-prettier', 'coc-emmet']
