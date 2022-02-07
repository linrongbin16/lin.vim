" custom configurations

" 1. Hot key

" open/close file explorer
nmap <F1> :Fern -stay -keep -toggle . -drawer<CR>
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


" 7. Fern settings

" drawer width
let g:fern#drawer_width=40


" 8. indent with 2 space for some languages
autocmd FileType c,cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType html,xml,xhtml,json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" 9. Line length marker=120
set colorcolumn=120

" 10. coc.nvim plugin list
let g:coc_global_extensions = ['coc-git', 'coc-snippets', 'coc-lists', 'coc-yank', 'coc-highlight', 'coc-pyright', 'coc-clangd', 'coc-rust-analyzer', 'coc-cmake', 'coc-json', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-sqlfluff', 'coc-tabnine']

" coc-list mappings
" grep - text search
nnoremap <silent> <space>g :CocList grep<CR>
" files - search files
nnoremap <silent> <space>f :CocList files<CR>
nnoremap <silent> <C-p> :CocList files<CR>
" symbols - search symbols
nnoremap <silent> <space>s :CocList symbols<CR>
" yank - search yank history
nnoremap <silent> <space>y :CocList yank<CR>
" actions - search action history
nnoremap <silent> <space>a :CocList actions<CR>
" diagnostics - search diagnostics
nnoremap <silent> <space>d :CocList diagnostics<CR>
" diagnostics on current buffer - search diagnostics on current buffer
nnoremap <silent> <space>b :CocList diagnostics --current-buf<CR>
" commands - search commands
nnoremap <silent> <space>c :CocList commands<CR>
" extensions - search extensions
nnoremap <silent> <space>e :CocList extensions<CR>
" location - search location
nnoremap <silent> <space>l :CocList location<CR>
" outline - search outline
nnoremap <silent> <space>o :CocList outline<CR>


" 11. other stuffs

" auto-pairs config
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`"}
