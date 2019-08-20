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

" easy move

" normal mode move
nnoremap <c-j> 5j
nnoremap <c-k> 5k
nnoremap <c-h> 5h
nnoremap <c-l> 5l
" visual mode move
xnoremap <c-j> 5j
xnoremap <c-k> 5k
xnoremap <c-h> 5h
xnoremap <c-l> 5l
