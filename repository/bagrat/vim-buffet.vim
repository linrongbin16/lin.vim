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

let MY_NVIM_TREE='NvimTree'
let MY_FERN='fern'

if has('nvim-0.6')
    nmap <silent> <expr> <D-1> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <D-2> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <D-3> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <D-4> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <D-5> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <D-6> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <D-7> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <D-8> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <D-9> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <D-0> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"
    nmap <silent> <expr> <A-1> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <A-2> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <A-3> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <A-4> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <A-5> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <A-6> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <A-7> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <A-8> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <A-9> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <A-0> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

    " go to next buffer
    nnoremap <silent> <expr> <Leader><Tab> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    " go to previous buffer
    nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":Bw<CR>"
else
    nmap <silent> <expr> <D-1> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <D-2> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <D-3> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <D-4> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <D-5> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <D-6> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <D-7> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <D-8> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <D-9> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <D-0> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"
    nmap <silent> <expr> <A-1> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <A-2> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <A-3> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <A-4> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <A-5> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <A-6> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <A-7> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <A-8> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <A-9> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <A-0> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

    " go to next buffer
    nnoremap <silent> <expr> <Leader><Tab> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    " go to previous buffer
    nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":Bw<CR>"
endif
