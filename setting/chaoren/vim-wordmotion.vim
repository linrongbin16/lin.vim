" by default, wordmotion will make w/b move just a literally text word
" it's useful, but not compatible with most text editor behaviour
" we map w/b to the compatible move behaviour, while use W/B to move just a
" word when need
let g:wordmotion_mappings = {
        \ 'w': 'W',
        \ 'W': 'w',
        \ 'e': 'E',
        \ 'E': 'e',
        \ 'b': 'B',
        \ 'B': 'b',
        \ 'ge': 'gE',
        \ 'gE': 'ge',
      \ }
