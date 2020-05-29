" Key Operations

" open/close nerdtree file explorer
map <F6> :NERDTreeToggle<CR>
" open terminal
map <F7> :terminal ++rows=20<CR>
" next color
map <F8> :NextColor<CR>
" format
map <F9> :Autoformat<CR>

" Command Operations

" copy visual selection to disk cache
vnoremap <Leader>y :w! ~/.cache/.lin-vim-copypaste<CR>
" copy disk cache to cursor
nnoremap <Leader>p :r ~/.cache/.lin-vim-copypaste<CR>
