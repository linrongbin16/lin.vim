" highlight delay
let g:Illuminate_delay = 0

" highlight group
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord Visual
augroup END
