" Disable default mappings, use your mappings when you truely need
let g:EasyMotion_do_mapping=0
" Turn on case insensitive feature
let g:EasyMotion_smartcase=1

" <Leader>f{char} - move to {char}
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-bd-f)

" <Leader>s{char}{char} - move to {char}{char}
map <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-bd-f2)

" Move to word
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-bd-w)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-bd-jk)
