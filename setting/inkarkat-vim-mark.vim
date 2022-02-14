" disable default key mappings
let g:mw_no_mappings = 1
let g:mwDefaultHighlightingPalette = 'extended'

" only enable some basic key mappings
nmap <unique> <Leader>m <Plug>MarkSet
xmap <unique> <Leader>m <Plug>MarkSet
nmap <unique> <Leader>n <Plug>MarkClear
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear
