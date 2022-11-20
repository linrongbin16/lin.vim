""" ---- Enhanced copypaste ----

" Copy selected code to cache in virual mode 
vnoremap <Leader>y :w! ~/.vim/.copypaste<CR>
" Paste cache under cursor
nnoremap <Leader>p :r ~/.vim/.copypaste<CR>
