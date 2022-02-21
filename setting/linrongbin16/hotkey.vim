" open/close file explorer
nnoremap <F1> :<C-u>Fern -stay -keep -toggle . -drawer<CR>
" open/close vista
nnoremap <F2> :<C-u>Vista!!<CR>
" format current file
nnoremap <F3> :<C-u>call CocActionAsync('format')<CR>
nnoremap <S-F3> :<C-u>call CocAction('format')<CR>
" switch between C/C++ header source
nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>
" run codeActions on current buffer
nmap <F5>  <Plug>(coc-codeaction)
" run codeActions on selected code
xmap <S-F5>  <Plug>(coc-codeaction-selected)
nmap <S-F5>  <Plug>(coc-codeaction-selected)
" hover/rename symbol
" hover symbol
nnoremap <F6> :<C-u>call CocActionAsync('doHover')<CR>
" rename symbol
nmap <S-F6> <Plug>(coc-rename)
" open markdown preview
nnoremap <F7> :<C-u>MarkdownPreview<CR>
" next color
nnoremap <F8> :<C-u>call NextRandomColor()<CR>
" open buffer explorer
nnoremap <silent> <F10> :<C-u>BufExplorer<CR>
" close buffer explorer if it's opened
nnoremap <silent> <S-F10> :<C-u>ToggleBufExplorer<CR>
