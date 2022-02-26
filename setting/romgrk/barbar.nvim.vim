let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.animation = v:false
let bufferline.clickable = v:true
let bufferline.no_name_title = '[No Name]'

" use Meta+? key mappings to navigate buffers, for macOS Meta is Command key,
" for other OS Meta is Alt key.
"
" - <Meta-1> ~ <Meta-9> to switch to the 1st ~ 9th buffers, <Meta-10> to switch to
"   the last buffers
" - <\><tab> <Meta-.> <Meta->> to switch to next buffer on the right
" - <\><shift-tab> <Meta-,> <Meta-<> to switch to previous buffer on the left
" - <\>bd to close current buffer without closing window
" - <Meta-Shift->> to move current buffer to next position on the right
" - <Meta-Shift-<> to move current buffer to previous position on the left

if has('nvim-0.6')
  nnoremap <expr> <D-1> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <expr> <D-2> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <expr> <D-3> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <expr> <D-4> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <expr> <D-5> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <expr> <D-6> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <expr> <D-7> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <expr> <D-8> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <expr> <D-9> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <expr> <D-0> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  nnoremap <expr> <A-1> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <expr> <A-2> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <expr> <A-3> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <expr> <A-4> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <expr> <A-5> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <expr> <A-6> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <expr> <A-7> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <expr> <A-8> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <expr> <A-9> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <expr> <A-0> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  " go to next buffer
  nnoremap <expr> <Leader><Tab> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <D-.> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <A-.> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <D-Right> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <A-Right> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  " go to previous buffer
  nnoremap <expr> <Leader><S-Tab> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <D-,> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <A-,> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <D-Left> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <A-Left> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  " close current buffer without closing vim window
  nnoremap <expr> <Leader>bd (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

  " re-order current buffer to previous(left)
  nnoremap <expr> <D-S-Left> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  nnoremap <expr> <A-S-Left> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  " re-order current buffer to next(right)
  nnoremap <expr> <D-S-Right> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
  nnoremap <expr> <A-S-Right> (expand('%') ==# 'NvimTree' ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
else
  nnoremap <expr> <D-1> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <expr> <D-2> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <expr> <D-3> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <expr> <D-4> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <expr> <D-5> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <expr> <D-6> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <expr> <D-7> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <expr> <D-8> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <expr> <D-9> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <expr> <D-0> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  nnoremap <expr> <A-1> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <expr> <A-2> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <expr> <A-3> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <expr> <A-4> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <expr> <A-5> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <expr> <A-6> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <expr> <A-7> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <expr> <A-8> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <expr> <A-9> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <expr> <A-0> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  " go to next buffer
  nnoremap <expr> <Leader><Tab> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <D-.> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <A-.> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <D-Right> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <expr> <A-Right> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  " go to previous buffer
  nnoremap <expr> <Leader><S-Tab> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <D-,> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <A-,> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <D-Left> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <expr> <A-Left> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  " close current buffer without closing vim window
  nnoremap <expr> <Leader>bd (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

  " re-order current buffer to previous(left)
  nnoremap <expr> <D-S-Left> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  nnoremap <expr> <A-S-Left> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  " re-order current buffer to next(right)
  nnoremap <expr> <D-S-Right> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
  nnoremap <expr> <A-S-Right> (expand('%') =~ 'fern://drawer' ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
endif
