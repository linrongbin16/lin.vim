" custom configurations

" 1. Hot key

" open/close nerdtree file explorer
nmap <F1> :NERDTreeToggle<CR>
" open/close tagbar
nmap <F2> :TagbarToggle<CR>
" format current file
nmap <F3> <Plug>(lcn-format)
nmap <S-F3> <Plug>(lcn-format-sync)
" switch between C/C++ header source
nmap <F4> :call LanguageClient#textDocument_switchSourceHeader()<CR>
" open LanguageClient-neovim menu
nmap <F5> :call LanguageClient_contextMenu<CR>
" rename symbol
nmap <F6> <Plug>(lcn-rename)
nmap <S-F6> <Plug>(lcn-rename)
" open markdown preview
nmap <F7> :MarkdownPreview<CR>
" next color
nmap <F8> :call NextColor()<CR>
" open buffer explorer
nmap <script> <silent> <unique> <F9> :BufExplorer<CR>
" close buffer explorer
nmap <script> <silent> <unique> <F10> :ToggleBufExplorer<CR>

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
" use ctrl-tab, ctrl-shift-tab to switch buffer
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>


" 4. 10 times faster jkhl
map <c-j> 10j
map <c-k> 10k
map <c-h> 10h
map <c-l> 10l


" 5. Filetype mapping
autocmd BufRead,BufNewFile *.hql setlocal filetype=sql
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile *.hs setlocal filetype=haskell
autocmd BufRead,BufNewFile *Makefile* setlocal filetype=make
autocmd BufRead,BufNewFile *makefile* setlocal filetype=make
autocmd BufRead,BufNewFile *.ll setlocal filetype=llvm
autocmd BufRead,BufNewFile *.scm setlocal filetype=lisp
autocmd BufRead,BufNewFile *.vuejs setlocal filetype=vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue


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


" 9. indent with 2 space for some languages
autocmd FileType c,cpp,h,hpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType html,xml,xhtml,json,js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" 10. Line length marker=120
set colorcolumn=120

" 11. language server
let g:LanguageClient_serverCommands = {
            \ 'c': ['clangd', '-j=12', '-background-index', '--clang-tidy', "--all-scopes-completion", "--completion-style=detailed", "--header-insertion=iwyu", "--pch-storage=memory"],
            \ 'cpp': ['clangd', '-j=12', '-background-index', '--clang-tidy', "--all-scopes-completion", "--completion-style=detailed", "--header-insertion=iwyu", "--pch-storage=memory"],
            \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
            \ 'python': ['pyls'],
            \ }


" 12. other stuffs

" disable () in auto-pairs
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`"}
