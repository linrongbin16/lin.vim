""" python3 host
let g:python3_host_prog='python3'

""" default coc extensions
let g:coc_global_extensions = ['coc-explorer', 'coc-git', 'coc-snippets', 'coc-yank', 'coc-lists', 'coc-pyright', 'coc-clangd', 'coc-rust-analyzer', 'coc-go', 'coc-cmake', 'coc-html', 'coc-xml', 'coc-json', 'coc-css', 'coc-tsserver', '@yaegassy/coc-volar', 'coc-eslint', 'coc-prettier', 'coc-powershell']

""" guifont
if has("win32") || has("win64")
    " for Windows
    set guifont=Hack\ NF:h9
elseif has("mac")
    " for macOS
    set guifont=Hack\ Nerd\ Font\ Mono:h12
else
    " for other *NIX
    set guifont=Hack\ Nerd\ Font\ Mono:h10
endif

""" hotkeys
" open/close file explorer
if has('nvim-0.6')
  nnoremap <F1> :<C-u>NvimTreeToggle<CR>
else
  " nnoremap <F1> :<C-u>Fern -keep -toggle . -drawer<CR>
  nnoremap <F1> :<C-u>CocCommand explorer<CR>
endif
" toggle (open/close) undo tree
nnoremap <F2> :<C-u>UndotreeToggle<CR>
" toggle (open/close) vista
nnoremap <F3> :<C-u>Vista!!<CR>
" switch between C/C++ header source
nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>
" open buffer explorer
nnoremap <silent> <F10> :<C-u>BufExplorer<CR>
" close buffer explorer if it's opened
nnoremap <silent> <S-F10> :<C-u>ToggleBufExplorer<CR>
" open browser to preview markdown
nnoremap <F11> :<C-u>MarkdownPreview<CR>
" next color scheme
nnoremap <silent> <F12> :<C-u>call NextColorSchemeAndSync()<CR>


""" add more settings here...

" 2 spaces indent for specific languages
" autocmd FileType c,cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
" autocmd FileType html,xml,xhtml,json,javascript,typescript,javascriptreact,typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
