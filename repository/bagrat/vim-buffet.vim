let g:buffet_show_index=1

" Better UI with devicons
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

" Adjust tab color
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#0066CC guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#999999 guifg=#0066CC
endfunction

let LIN_VIM_NVIM_TREE='NvimTree'
let LIN_VIM_FERN='fern'

if has('nvim-0.7')
    " ctrl/alt/cmd + 1~9, ctrl/alt/cmd + 0
    nmap <silent> <expr> <D-1> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <D-2> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <D-3> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <D-4> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <D-5> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <D-6> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <D-7> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <D-8> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <D-9> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <D-0> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"
    nmap <silent> <expr> <A-1> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <A-2> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <A-3> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <A-4> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <A-5> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <A-6> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <A-7> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <A-8> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <A-9> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <A-0> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"
    nmap <silent> <expr> <C-1> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <C-2> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <C-3> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <C-4> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <C-5> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <C-6> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <C-7> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <C-8> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <C-9> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <C-0> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

    " go to next(right) buffer
    nnoremap <silent> <expr> <Leader>bn (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <C-.> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <C-Right> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bn<CR>"
    " go to previous(left) buffer
    nnoremap <silent> <expr> <Leader>bp (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <C-,> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <C-Left> (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":bp<CR>"

    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":Bw<CR>"
else
    nmap <silent> <expr> <D-1> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <D-2> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <D-3> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <D-4> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <D-5> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <D-6> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <D-7> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <D-8> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <D-9> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <D-0> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"
    nmap <silent> <expr> <A-1> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <A-2> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <A-3> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <A-4> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <A-5> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <A-6> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <A-7> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <A-8> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <A-9> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <A-0> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"
    nmap <silent> <expr> <C-1> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
    nmap <silent> <expr> <C-2> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
    nmap <silent> <expr> <C-3> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
    nmap <silent> <expr> <C-4> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
    nmap <silent> <expr> <C-5> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
    nmap <silent> <expr> <C-6> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
    nmap <silent> <expr> <C-7> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
    nmap <silent> <expr> <C-8> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
    nmap <silent> <expr> <C-9> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
    nmap <silent> <expr> <C-0> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

    " go to next buffer
    nnoremap <silent> <expr> <Leader>bn (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <C-.> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    nnoremap <silent> <expr> <C-Right> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bn<CR>"
    " go to previous buffer
    nnoremap <silent> <expr> <Leader>bp (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <C-,> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"
    nnoremap <silent> <expr> <C-Left> (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":bp<CR>"

    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":Bw<CR>"
endif
