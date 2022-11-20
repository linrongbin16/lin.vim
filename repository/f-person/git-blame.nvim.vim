" Don't show git blame by default, since it's a little bit noisy and slowly.
" Use hotkey to toggle it.
let g:gitblame_enabled=0

" Toggle git blame info
nnoremap <Leader>gb :<C-u>GitBlameToggle<CR>
