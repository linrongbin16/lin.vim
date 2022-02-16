" disable default mappings, use your mappings when you truely need
let g:EasyMotion_do_mapping = 0
" turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char} (1-char)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char} (2-char)
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Move to line
nmap <Leader>l <Plug>(easymotion-overwin-line)
