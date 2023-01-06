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

function! s:LinVimDefineBuffetKeys(k) abort
    " go to buffer-1~10
    " <D-?>/<A-?>/<M-?>/<C-?>
    " ?: 0-9
    execute printf('nnoremap <silent> <expr> <%s-1> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(1)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-2> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(2)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-3> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(3)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-4> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(4)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-5> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(5)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-6> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(6)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-7> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(7)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-8> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(8)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-9> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(9)"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-0> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "")."\<Plug>BuffetSwitch(10)"', a:k)

    " go to next/previous buffer
    " <D-?>/<A-?>/<M-?>/<C-?>
    " ?: ,/Left/./Right
    execute printf('nnoremap <silent> <expr> <%s-.> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>bn\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-Right> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>bn\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-,> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>bp\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-Left> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>bp\<CR>"', a:k)
endfunction

call s:LinVimDefineBuffetKeys('D')
call s:LinVimDefineBuffetKeys('A')
call s:LinVimDefineBuffetKeys('M')
call s:LinVimDefineBuffetKeys('C')

" go to next/previous buffer, close buffer
nnoremap <silent> <expr> <Leader>bn (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>bn\<CR>"
nnoremap <silent> <expr> <Leader>bp (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>bp\<CR>"
nnoremap <silent> <expr> <Leader>bd (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>Bw\<CR>"
