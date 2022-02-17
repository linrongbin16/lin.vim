" always show tabline and index
let g:buffet_always_show_tabline=1
let g:buffet_show_index=1

" better UI with devicons
let g:buffet_powerline_separators = 1
" \uf00a
let g:buffet_tab_icon = ""
" \uf0a8
let g:buffet_left_trunc_icon = ""
" \uf0a9
let g:buffet_right_trunc_icon = ""

" key mappings to switch buffers/tabs

" macOS command-key
nmap <D-1> <Plug>BuffetSwitch(1)
nmap <D-2> <Plug>BuffetSwitch(2)
nmap <D-3> <Plug>BuffetSwitch(3)
nmap <D-4> <Plug>BuffetSwitch(4)
nmap <D-5> <Plug>BuffetSwitch(5)
nmap <D-6> <Plug>BuffetSwitch(6)
nmap <D-7> <Plug>BuffetSwitch(7)
nmap <D-8> <Plug>BuffetSwitch(8)
nmap <D-9> <Plug>BuffetSwitch(9)
nmap <D-0> <Plug>BuffetSwitch(10)

" for other OS alt-key
nmap <A-1> <Plug>BuffetSwitch(1)
nmap <A-2> <Plug>BuffetSwitch(2)
nmap <A-3> <Plug>BuffetSwitch(3)
nmap <A-4> <Plug>BuffetSwitch(4)
nmap <A-5> <Plug>BuffetSwitch(5)
nmap <A-6> <Plug>BuffetSwitch(6)
nmap <A-7> <Plug>BuffetSwitch(7)
nmap <A-8> <Plug>BuffetSwitch(8)
nmap <A-9> <Plug>BuffetSwitch(9)
nmap <A-0> <Plug>BuffetSwitch(10)
