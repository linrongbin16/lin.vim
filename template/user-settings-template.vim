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
" run codeActions on current buffer
nmap <F5>  <Plug>(coc-codeaction)
" run codeActions on selected code
xmap <S-F5>  <Plug>(coc-codeaction-selected)
nmap <S-F5>  <Plug>(coc-codeaction-selected)
" hover/rename symbol
" hover symbol
nmap <F6> :call CocActionAsync('doHover')<CR>
" rename symbol
nmap <S-F6> <Plug>(coc-rename)
" open markdown preview
nmap <F7> :MarkdownPreview<CR>
" next color
nmap <F8> :call NextRandomColor()<CR>
" open buffer explorer
nnoremap <silent> <F10> :BufExplorer<CR>
" close buffer explorer if it's opened
nnoremap <silent> <S-F10> :ToggleBufExplorer<CR>


" 2. Enhanced copy paste

" copy visual selection to cache
vnoremap <Leader>y :w! ~/.vim/.lin-vim-enhanced-copy-paste<CR>
" paste cache to cursor
nnoremap <Leader>p :r ~/.vim/.lin-vim-enhanced-copy-paste<CR>


" 3. Filetype mapping
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


" 4. GUI window size
if has('gui_running')
    set lines=999
    set columns=999
    if has('win32')
        au GUIEnter * simalt ~x
    endif
endif


" 5. GUI fonts
if has("win32")
    " win32
    set guifont=Hack\ NF:h9
elseif has("mac")
    " macos
    " set guifont=CodeNewRoman\ Nerd\ Font\ Mono:h12
    set guifont=FantasqueSansMono\ Nerd\ Font\ Mono:h14
    " set guifont=Hack\ Nerd\ Font\ Mono:h12
else
    " linux, unix
    set guifont=Hack\ Nerd\ Font\ Mono\ 10
    " FantasqueSansMono\ Nerd\ Font\ Mono\ 12
    " CodeNewRoman\ Nerd\ Font\ Mono\ 10
endif


" 6. Fern settings
" drawer width
let g:fern#drawer_width=40


" 7. indent with 2 space for some languages
autocmd FileType c,cpp,lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType html,xml,xhtml,json,javascript,typescript,javascriptreact,typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" 8. Line length marker=120
set colorcolumn=120

" 9. coc.nvim extensions
let g:coc_global_extensions = ['coc-git', 'coc-snippets', 'coc-yank', 'coc-lists', 'coc-pyright', 'coc-clangd', 'coc-rust-analyzer', 'coc-cmake', 'coc-html', 'coc-xml', 'coc-json', 'coc-css', 'coc-tsserver', '@yaegassy/coc-volar', 'coc-eslint', 'coc-prettier', 'coc-sqlfluff', 'coc-tabnine']

" 10. search engine key mappings for fzf.vim or vim-clap
" by default key mappings are provided only for fzf.vim
" if you want to disable key mappings for fzf.vim, please comment below line
source $HOME/.vim/setting/junegunn-fzf.vim.vim
" if you want to enable key mappings for vim-clap, please uncomment below line
" source $HOME/.vim/setting/liuchengxu-vim-clap.vim
