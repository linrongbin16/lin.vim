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

" use Meta+? key mappings to navigate buffers, for macOS Meta is Command key,
" for other OS Meta is Alt key.
"
" - <Meta-1> ~ <Meta-9> to switch to the 1st ~ 9th buffers, <Meta-10> to switch to
"   the last buffers
" - <\><tab> <Meta-.> <Meta->> to switch to next buffer on the right
" - <\><shift-tab> <Meta-,> <Meta-<> to switch to previous buffer on the left
" - <\>bd to close current buffer without closing window

if has('nvim-0.6')
  nmap <silent> <expr> <D-1> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <D-2> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <D-3> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <D-4> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <D-5> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <D-6> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <D-7> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <D-8> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <D-9> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <D-0> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  nmap <silent> <expr> <A-1> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <A-2> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <A-3> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <A-4> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <A-5> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <A-6> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <A-7> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <A-8> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <A-9> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <A-0> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  " go to next buffer
  nnoremap <silent> <expr> <Leader><Tab> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <D-.> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <A-.> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <D-Right> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <A-Right> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  " go to previous buffer
  nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <D-,> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <A-,> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <D-Left> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <A-Left> (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  " close current buffer without closing vim window
  nnoremap <silent> <expr> <Leader>bd (&filetype == 'NvimTree' ? "\<c-w>\<c-w>" : '').":Bw<CR>"
else
  nmap <silent> <expr> <D-1> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <D-2> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <D-3> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <D-4> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <D-5> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <D-6> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <D-7> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <D-8> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <D-9> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <D-0> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  nmap <silent> <expr> <A-1> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <A-2> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <A-3> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <A-4> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <A-5> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <A-6> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <A-7> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <A-8> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <A-9> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <A-0> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  " go to next buffer
  nnoremap <silent> <expr> <Leader><Tab> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <D-.> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <A-.> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <D-Right> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <silent> <expr> <A-Right> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  " go to previous buffer
  nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <D-,> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <A-,> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <D-Left> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <silent> <expr> <A-Left> (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  " close current buffer without closing vim window
  nnoremap <silent> <expr> <Leader>bd (&filetype == 'fern' ? "\<c-w>\<c-w>" : '').":Bw<CR>"
endif
