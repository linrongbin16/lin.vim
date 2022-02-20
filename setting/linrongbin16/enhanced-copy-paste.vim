" copy visual selection to cache
vnoremap <Leader>y :w! ~/.vim/.enhanced-copy-paste-cache<CR>
" paste cache to cursor position
nnoremap <Leader>p :r ~/.vim/.enhanced-copy-paste-cache<CR>
