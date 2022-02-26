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
  nmap <silent> <expr> <D-1> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <D-2> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <D-3> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <D-4> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <D-5> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <D-6> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <D-7> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <D-8> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <D-9> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <D-0> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  nmap <silent> <expr> <A-1> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <A-2> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <A-3> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <A-4> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <A-5> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <A-6> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <A-7> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <A-8> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <A-9> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <A-0> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  " go to next buffer
  nnoremap <expr> <Leader><Tab> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <D-.> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <A-.> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <D-Right> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <A-Right> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  " go to previous buffer
  nnoremap <expr> <Leader><S-Tab> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <D-,> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <A-,> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <D-Left> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <A-Left> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  " close current buffer without closing vim window
  nnoremap <expr> <Leader>bd (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":Bw<CR>"
else
  nmap <silent> <expr> <D-1> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <D-2> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <D-3> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <D-4> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <D-5> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <D-6> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <D-7> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <D-8> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <D-9> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <D-0> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  nmap <silent> <expr> <A-1> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(1)"
  nmap <silent> <expr> <A-2> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(2)"
  nmap <silent> <expr> <A-3> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(3)"
  nmap <silent> <expr> <A-4> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(4)"
  nmap <silent> <expr> <A-5> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(5)"
  nmap <silent> <expr> <A-6> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(6)"
  nmap <silent> <expr> <A-7> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(7)"
  nmap <silent> <expr> <A-8> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(8)"
  nmap <silent> <expr> <A-9> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(9)"
  nmap <silent> <expr> <A-0> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '')."\<Plug>BuffetSwitch(10)"

  " go to next buffer
  nnoremap <expr> <Leader><Tab> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <D-.> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <A-.> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <D-Right> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  nnoremap <expr> <A-Right> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bn<CR>"
  " go to previous buffer
  nnoremap <expr> <Leader><S-Tab> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <D-,> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <A-,> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <D-Left> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  nnoremap <expr> <A-Left> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":bp<CR>"
  " close current buffer without closing vim window
  nnoremap <expr> <Leader>bd (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":Bw<CR>"
endif
