
""" ---- GUI font ----
if has("win32") || has("win64")
    " for Windows
    set guifont=Hack\ NFM:h10
elseif has("mac")
    " for macOS
    set guifont=Hack\ Nerd\ Font\ Mono:h12
else
    " for other *NIX
    set guifont=Hack\ Nerd\ Font\ Mono:h10
endif

""" ---- Hot keys ----
" Toggle file explorer
if has('nvim-0.7')
    nnoremap <F1> :<C-u>NvimTreeToggle<CR>
else
    nnoremap <F1> :<C-u>Fern -keep -toggle . -drawer<CR>
endif
" Toggle undotree
nnoremap <F2> :<C-u>UndotreeToggle<CR>
" Toggle outline
nnoremap <F3> :<C-u>Vista!!<CR>
" Switch between C/C++ headers and sources
nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>
" Toggle git blame
nnoremap <F7> :<C-u>GitBlameToggle<CR>
" Markdown preview
nnoremap <F8> :<C-u>MarkdownPreview<CR>
" Next random color scheme
nnoremap <F9> :<C-u>call NextRandomColorSchemeSync()<CR>
" Open bufexplorer
nnoremap <F10> :<C-u>BufExplorer<CR>
" Toggle(close) bufexplorer
nnoremap <S-F10> :<C-u>ToggleBufExplorer<CR>

""" ---- Python3 host ----
" let g:python3_host_prog='python3'

""" ---- Neovide ----
" let g:neovide_refresh_rate=60
" let g:neovide_transparency=1.0
" let g:neovide_scroll_animation_length=0.0
" let g:neovide_remember_window_size=v:true
" let g:neovide_input_use_logo=v:false  " v:true on macOS
" let g:neovide_cursor_animation_length=0.0
" let g:neovide_cursor_trail_length=0.0
" let g:neovide_cursor_antialiasing=v:true

""" ---- Add more settings here ----

