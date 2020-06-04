" Key Operations

" switch between C/C++ header source
map <F1> :CocCommand clangd.switchSourceHeader<CR>
" open terminal
map <F2> :terminal ++rows=20<CR>
" next color
map <F3> :NextColor<CR>
" open/close nerdtree file explorer
map <F5> :NERDTreeToggle<CR>

" Command Operations

" copy visual selection to disk cache
vnoremap <Leader>y :w! ~/.cache/.lin.vim.copypaste<CR>
" copy disk cache to cursor
nnoremap <Leader>p :r ~/.cache/.lin.vim.copypaste<CR>

" Buffer

" go to next buffer
map <Leader>bn :bn<cr>

" go to previous buffer
map <Leader>bp :bp<cr>

" close current buffer
map <Leader>bd :bd<cr>
