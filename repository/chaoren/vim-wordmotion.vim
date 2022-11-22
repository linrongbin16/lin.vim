" Disable default key mappings
let g:wordmotion_nomap=1

" <Leader>w
nmap <Leader>w <Plug>WordMotion_w
xmap <Leader>w <Plug>WordMotion_w
omap <Leader>w <Plug>WordMotion_w

" <Leader>W
nmap <Leader>W <Plug>WordMotion_W
xmap <Leader>W <Plug>WordMotion_W
omap <Leader>W <Plug>WordMotion_W

" Since <leader>bn <leader>bp <leader>bd are used by tabline plugins.
" <leader>b will be delayed (try to wait for bn/bp/bd), so here we map <leader>b to <leader>bb to avoid this.
" <Leader>bb
nmap <Leader>bb <Plug>WordMotion_b
xmap <Leader>bb <Plug>WordMotion_b
omap <Leader>bb <Plug>WordMotion_b

" <Leader>B
nmap <Leader>B <Plug>WordMotion_B
xmap <Leader>B <Plug>WordMotion_B
omap <Leader>B <Plug>WordMotion_B

" <Leader>e
nmap <Leader>e <Plug>WordMotion_e
xmap <Leader>e <Plug>WordMotion_e
omap <Leader>e <Plug>WordMotion_e

" <Leader>E
nmap <Leader>E <Plug>WordMotion_E
xmap <Leader>E <Plug>WordMotion_E
omap <Leader>E <Plug>WordMotion_E

" <Leader>ge
nmap <Leader>ge <Plug>WordMotion_ge
xmap <Leader>ge <Plug>WordMotion_ge
omap <Leader>ge <Plug>WordMotion_ge

" <Leader>gE
nmap <Leader>gE <Plug>WordMotion_gE
xmap <Leader>gE <Plug>WordMotion_gE
omap <Leader>gE <Plug>WordMotion_gE
