
""" ---- GUI font ----
if has("win32") || has("win64")
    " for Windows
    set guifont=Hack\ NFM:h10
elseif has("mac")
    " for macOS
    set guifont=Hack\ Nerd\ Font\ Mono:h13
else
    " for other *NIX
    set guifont=Hack\ Nerd\ Font\ Mono:h10
endif

""" ---- Hot keys ----
" Toggle file explorer
if has('nvim-0.8')
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
" Toggle marks
nmap <F6> <Plug>MarkToggle
" Clear marks
nmap <S-F6> <Plug>MarkAllClear
" Toggle git blame
if has('nvim-0.7')
    nnoremap <F7> :<C-u>Gitsigns toggle_current_line_blame<CR>
elseif has('nvim-0.5')
    nnoremap <F7> :<C-u>GitBlameToggle<CR>
endif
" Markdown preview
nnoremap <F8> :<C-u>MarkdownPreview<CR>
" Toggle terminal
nnoremap <F9> :<C-u>FloatermToggle<CR>
" Toggle bufexplorer
nnoremap <F10> :<C-u>ToggleBufExplorer<CR>

""" ---- Ctrl/cmd keys ----
if exists('$VIMRUNTIME/mswin.vim')
    source $VIMRUNTIME/mswin.vim
else
    source $HOME/.vim/standalone/mswin-macvim-9.0.472_1.vim
endif
if has('mac')
    if exists('$VIMRUNTIME/macmap.vim')
        source $VIMRUNTIME/macmap.vim
    else
        source $HOME/.vim/standalone/macmap-macvim-9.0.472_1.vim
    endif
endif

""" ---- Enhanced copy-paste ----
" Copy visual selected text to cache
vnoremap <Leader>y :w! ~/.vim/.copypaste<CR>
" Paste from cache to current cursor
nnoremap <Leader>p :r ~/.vim/.copypaste<CR>

""" ---- Disable syntax highlight for super big file ----
""" filesize=1000000
" autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

""" ---- Python3 host ----
" let g:python3_host_prog='python3'

""" ---- Neovide ----
" let g:neovide_refresh_rate=60
" let g:neovide_transparency=1.0
" let g:neovide_scroll_animation_length=0.0
" let g:neovide_remember_window_size=v:true
" let g:neovide_input_use_logo=has('mac') " v:true on macOS
" let g:neovide_cursor_animation_length=0.0
" let g:neovide_cursor_trail_length=0.0
" let g:neovide_cursor_antialiasing=v:true

""" ---- Add more settings here ----

