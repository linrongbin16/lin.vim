" open/close file explorer
if has('nvim-0.6')
  nnoremap <F1> :<C-u>NvimTreeToggle<CR>
else
  nnoremap <F1> :<C-u>Fern -keep -toggle . -drawer<CR>
endif
" open/close vista
nnoremap <F2> :<C-u>Vista!!<CR>
" open browser to preview markdown
nnoremap <F3> :<C-u>MarkdownPreview<CR>
" switch between C/C++ header source
nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>
" next color scheme
nnoremap <F9> :<C-u>call NextColorScheme(v:true)<CR>
" open buffer explorer
nnoremap <silent> <F10> :<C-u>BufExplorer<CR>
" close buffer explorer if it's opened
nnoremap <silent> <S-F10> :<C-u>ToggleBufExplorer<CR>
