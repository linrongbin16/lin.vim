" By default, wordmotion will make w/b move just a literal text word.
" But it's not compatible with normal text editor behaviour.
" So we map w/b follow the compatible normal text editor behaviour.
" Use W/B to move a literal text word.

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
