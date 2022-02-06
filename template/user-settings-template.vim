" custom configurations

" 1. Hot key

" open/close file explorer
nmap <F1> :Fern -stay -keep -toggle -width=40 . -drawer<CR>
" open/close vista
nmap <F2> :Vista!!<CR>
" format current file
nmap <F3> :call CocActionAsync('format')<CR>
nmap <S-F3> :call CocAction('format')<CR>
" switch between C/C++ header source
nmap <F4> :CocCommand clangd.switchSourceHeader<CR>
" run codeLens/codeActions
" run codeLens on current buffer
nmap <F5>  <Plug>(coc-codelens-action)
" run codeAction to quick auto-fix problem on current line
xmap <S-F5>  <Plug>(coc-fix-current)
" hover/rename symbol
" hover symbol
nmap <F6> :call CocActionAsync('doHover')<CR>
" rename symbol
nmap <S-F6> <Plug>(coc-rename)
" open markdown preview
nmap <F7> :MarkdownPreview<CR>
" next color
nmap <F8> :call NextColor()<CR>
" open/close buffer explorer
nnoremap <silent> <F10> :BufExplorer<CR>
nnoremap <silent> <S-F10> :ToggleBufExplorer<CR>


" 2. Enhanced copy paste

" copy visual selection to cache
vnoremap <Leader>y :w! ~/.vim/.lin-vim-enhanced-copy-paste<CR>
" paste cache to cursor
nnoremap <Leader>p :r ~/.vim/.lin-vim-enhanced-copy-paste<CR>


" 3. Buffer operations

" go to next buffer
nmap <Leader>bn :bn<cr>
nmap <C-Tab> :bn<cr>
" go to previous buffer
nmap <Leader>bp :bp<cr>
nmap <C-S-Tab> :bn<cr>
" close current buffer
nmap <Leader>bd :bd<cr>


" 4. Filetype mapping
autocmd BufRead,BufNewFile *.hql setlocal filetype=hive
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile *.hs setlocal filetype=haskell
autocmd BufRead,BufNewFile Makefile setlocal filetype=make
autocmd BufRead,BufNewFile makefile setlocal filetype=make
autocmd BufRead,BufNewFile *.ll setlocal filetype=llvm
autocmd BufRead,BufNewFile *.lex setlocal filetype=lex
autocmd BufRead,BufNewFile *.yacc setlocal filetype=yacc
autocmd BufRead,BufNewFile *.l setlocal filetype=flex
autocmd BufRead,BufNewFile *.y setlocal filetype=bison


" 5. GUI window size
if has('gui_running')
    set lines=999
    set columns=999
    if has('win32')
        au GUIEnter * simalt ~x
    endif
endif

" 6. GUI fonts
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


" 7. Nerdtree settings

" " nerdtree window size
" let g:NERDTreeWinSize=40
" " nerdtree auto open
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" 8. indent with 2 space for some languages
autocmd FileType c,cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType html,xml,xhtml,json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" 9. Line length marker=120
set colorcolumn=120

" 10. coc.nvim plugin list
let g:coc_global_extensions = ['coc-git', 'coc-snippets', 'coc-lists', 'coc-yank', 'coc-highlight', 'coc-pyright', 'coc-clangd', 'coc-rust-analyzer', 'coc-cmake', 'coc-json', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-sqlfluff', 'coc-tabnine']

" coc-lists configuration
" coc-lists grep
nnoremap <silent> <Leader>lg :CocList grep<CR>
" coc-lists files
nnoremap <silent> <Leader>lf :CocList files<CR>
" coc-lists symbols
nnoremap <silent> <Leader>ls :CocList symbols<CR>
" coc-lists yank
nnoremap <silent> <Leader>ly :CocList yank<CR>

" 11. other stuffs

" auto-pairs config
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`"}
