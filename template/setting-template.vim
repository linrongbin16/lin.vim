""" python3 host
let g:python3_host_prog='python3'

""" default coc extensions
let g:coc_global_extensions = ['coc-git', 'coc-snippets', 'coc-yank', 'coc-lists', 'coc-pyright', 'coc-clangd', 'coc-rust-analyzer', 'coc-go', 'coc-cmake', 'coc-html', 'coc-xml', 'coc-json', 'coc-css', 'coc-tsserver', '@yaegassy/coc-volar', 'coc-eslint', 'coc-prettier']

""" guifont
if has("win32") || has("win64")
    " for Windows
    set guifont=Hack\ NFM:h9
elseif has("mac")
    " for macOS
    set guifont=Hack\ Nerd\ Font\ Mono:h12
else
    " for other *NIX
    set guifont=Hack\ Nerd\ Font\ Mono:h10
endif

""" hotkeys
" open/close file explorer
if has('nvim-0.7')
  nnoremap <F1> :<C-u>NvimTreeToggle<CR>
else
  nnoremap <F1> :<C-u>Fern -keep -toggle . -drawer<CR>
endif
" toggle (open/close) undo tree
nnoremap <F2> :<C-u>UndotreeToggle<CR>
" toggle (open/close) vista
nnoremap <F3> :<C-u>Vista!!<CR>
" switch between C/C++ header source
nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>
" open browser to preview markdown
nnoremap <F8> :<C-u>MarkdownPreview<CR>
" next color scheme
nnoremap <silent> <F9> :<C-u>call NextColorSchemeSync()<CR>
" open buffer explorer
nnoremap <silent> <F10> :<C-u>BufExplorer<CR>
" close buffer explorer if it's opened
nnoremap <silent> <S-F10> :<C-u>ToggleBufExplorer<CR>

""" add more settings here...

" 2 spaces indent for specific languages
" autocmd FileType c,cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
" autocmd FileType html,xml,xhtml,json,javascript,typescript,javascriptreact,typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

""" neovide
" let g:neovide_refresh_rate=60
" let g:neovide_transparency=1.0
" let g:neovide_scroll_animation_length=0.0
" let g:neovide_remember_window_size=v:true
" let g:neovide_input_use_logo=v:false  " v:true on macOS
" let g:neovide_cursor_animation_length=0.0
" let g:neovide_cursor_trail_length=0.0
" let g:neovide_cursor_antialiasing=v:true
