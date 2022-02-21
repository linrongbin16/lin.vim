" open/close file explorer
nnoremap <F1> :<C-u>Fern -stay -keep -toggle . -drawer<CR>
" open/close vista
nnoremap <F2> :<C-u>Vista!!<CR>
" open browser to preview markdown
nnoremap <F3> :<C-u>MarkdownPreview<CR>
" switch between C/C++ header source
nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>
" next color scheme
nnoremap <F9> :<C-u>call NextColorScheme()<CR>
" open buffer explorer
nnoremap <silent> <F10> :<C-u>BufExplorer<CR>
" close buffer explorer if it's opened
nnoremap <silent> <S-F10> :<C-u>ToggleBufExplorer<CR>
