" don't show git blame by default since it's a little bit noisy.
" only use hotkey to toggle it.

let g:gitblame_enabled=0

" toggle git blame info
nnoremap <Leader>gb :<C-u>GitBlameToggle<CR>
