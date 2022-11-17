lua<<EOF
require'hop'.setup()
EOF

" <Leader>f{char} - move to {char}
nmap <silent> <Leader>f :HopChar1<CR>

" <Leader>s{char}{char} - move to {char}{char}
nmap <silent> <leader>s :HopChar2<CR>

" Move to word
nmap <silent> <Leader>w :HopWord<CR>

" Move to line
nmap <silent> <Leader>l :HopLine<CR>
