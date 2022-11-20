lua<<EOF
require'hop'.setup()
EOF

" <Leader>f{char} - move to {char}
map <silent> <Leader>f :HopChar1<CR>
nmap <silent> <Leader>f :HopChar1<CR>

" <Leader>s{char}{char} - move to {char}{char}
map <silent> <leader>s :HopChar2<CR>
nmap <silent> <leader>s :HopChar2<CR>

" Move to word
map <silent> <Leader>w :HopWord<CR>
nmap <silent> <Leader>w :HopWord<CR>

" Move to line
map <silent> <Leader>l :HopLine<CR>
nmap <silent> <Leader>l :HopLine<CR>
