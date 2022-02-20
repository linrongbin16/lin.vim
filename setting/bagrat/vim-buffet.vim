" always show tabline and index
let g:buffet_always_show_tabline=1
let g:buffet_show_index=1

" better UI with devicons
let g:buffet_powerline_separators = 0
let g:buffet_noseparator = ""
let g:buffet_separator = "▎"
" \uf00a
let g:buffet_tab_icon = ""
" \uf0a8
let g:buffet_left_trunc_icon = ""
" \uf0a9
let g:buffet_right_trunc_icon = ""
let g:buffet_modified_icon = " ●"

" key mappings to switch buffers/tabs

" macOS command-key
nmap <silent> <expr> <D-1> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(1)"
nmap <silent> <expr> <D-2> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(2)"
nmap <silent> <expr> <D-3> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(3)"
nmap <silent> <expr> <D-4> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(4)"
nmap <silent> <expr> <D-5> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(5)"
nmap <silent> <expr> <D-6> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(6)"
nmap <silent> <expr> <D-7> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(7)"
nmap <silent> <expr> <D-8> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(8)"
nmap <silent> <expr> <D-9> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(9)"
nmap <silent> <expr> <D-0> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(10)"

" for other OS alt-key
nmap <silent> <expr> <A-1> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(1)"
nmap <silent> <expr> <A-2> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(2)"
nmap <silent> <expr> <A-3> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(3)"
nmap <silent> <expr> <A-4> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(4)"
nmap <silent> <expr> <A-5> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(5)"
nmap <silent> <expr> <A-6> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(6)"
nmap <silent> <expr> <A-7> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(7)"
nmap <silent> <expr> <A-8> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(8)"
nmap <silent> <expr> <A-9> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(9)"
nmap <silent> <expr> <A-0> (expand('%') =~ 'fern' ? "<c-w><c-w>" : '')."<Plug>BuffetSwitch(10)"

" go to next buffer
nnoremap <expr> <Leader><Tab> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
nnoremap <expr> <D-.> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
nnoremap <expr> <A-.> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
nnoremap <expr> <D-Right> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
nnoremap <expr> <A-Right> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
" go to previous buffer
nnoremap <expr> <Leader><S-Tab> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
nnoremap <expr> <D-,> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
nnoremap <expr> <A-,> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
nnoremap <expr> <D-Left> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
nnoremap <expr> <A-Left> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
" close current buffer without closing vim window
nnoremap <expr> <Leader>bd (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":Bw<CR>"
