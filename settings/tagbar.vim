"" ---- tagbar ----

nmap <F9> :TagbarToggle<cr>
let g:tagbar_right=1
" let g:tagbar_width=40
let g:tagbar_foldlevel=99
let g:tagbar_show_visibility=1
let g:tagbar_show_linenumbers=0
let g:tagbar_autoshowtag=1
let g:tagbar_sort=0
let g:tagbar_expand = 2
autocmd VimEnter,BufNewFile,BufRead * nested :call tagbar#autoopen(1)
autocmd VimEnter * nested :TagbarSetFoldlevel! 99
