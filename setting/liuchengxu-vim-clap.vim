" 1. search text

" search text
nnoremap <silent> <space>g :Clap grep2<CR>
" search lines
nnoremap <silent> <space>bl :Clap blines<CR>
" search lines only on current buffer
nnoremap <silent> <space>l :Clap lines<CR>
" search text on tags
nnoremap <silent> <space>t :Clap tags<CR>
" search symbols based on coc.nvim language server
nnoremap <silent> <space>s :Clap coc_symbols<CR>
" search diagnostics based on coc.nvim language server
nnoremap <silent> <space>d :Clap coc_diagnostics<CR>
" search symbol outlines based on coc.nvim language server
nnoremap <silent> <space>o :Clap coc_outline<CR>

" 2. search files

" search files
nnoremap <silent> <space>f :Clap files<CR>
nnoremap <silent> <C-p> :Clap files<CR>
" search files order by most recently used
nnoremap <silent> <space>r :Clap recent_files<CR>
" search opened buffers
nnoremap <silent> <space>bf :Clap buffers<CR>

" 3. search git
" search git commits
nnoremap <silent> <space>c :Clap commits<CR>
" search git commits only on current buffer
nnoremap <silent> <space>bc :Clap bcommits<CR>

" 4. other search types

" search lvy-like file explorer
nnoremap <silent> <space>e :Clap filer<CR>
" search marks
nnoremap <silent> <space>mk :Clap marks<CR>
" search maps
nnoremap <silent> <space>mp :Clap maps<CR>
" search yank history
nnoremap <silent> <space>y :Clap yanks<CR>
