lua<<EOF
require'hop'.setup()
EOF

" <Leader>f{char} to move to {char}
nmap <silent> <Leader>f :HopChar1<CR>

" s{char}{char} to move to {char}{char}
nmap <silent> <leader>s :HopChar2<CR>

" Move to word
nmap <silent> <Leader>w :HopWord<CR>

" Move to line
nmap <silent> <Leader>l :HopLine<CR>
