" Highlight delay
let g:Illuminate_delay = 800

" Highlight group
augroup my_illuminate_group
    autocmd!
    autocmd VimEnter * hi link illuminatedWord Visual
augroup END
