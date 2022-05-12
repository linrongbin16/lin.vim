" by default, wordmotion will make w/b move just a literally text word
" it's useful, but not compatible with most text editor behaviour
" we map w/b to the compatible move behaviour, while use W/B to move just a
" word when need
let g:wordmotion_mappings = {
        \ 'w': '<Plug>WordMotion_W',
        \ 'W': '<Plug>WordMotion_w',
        \ 'e': '<Plug>WordMotion_E',
        \ 'E': '<Plug>WordMotion_e',
        \ 'b': '<Plug>WordMotion_B',
        \ 'B': '<Plug>WordMotion_b',
        \ 'ge': '<Plug>WordMotion_gE',
        \ 'gE': '<Plug>WordMotion_ge',
      \ }
