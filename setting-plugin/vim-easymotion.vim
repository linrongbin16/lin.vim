" disable default mappings, use your mappings when you truely need
let g:EasyMotion_do_mapping = 0
" turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" search char
map <Leader>s <Plug>(easymotion-overwin-f)
map <Leader>s <Plug>(easymotion-bd-f)
" search words
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" jump lines
" `leader + j{char}{label}`
map <Leader>j <Plug>(easymotion-j)
" `leader + k{char}{label}`
map <Leader>k <Plug>(easymotion-k)

" 10 times faster move
map <c-j> 10j
map <c-k> 10k
map <c-h> 10h
map <c-l> 10l
