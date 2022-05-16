let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.animation = v:false
let bufferline.clickable = v:true
let bufferline.no_name_title = '[No Name]'
let bufferline.maximum_length = 80

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

let NVIM_EXPLORER='NvimTree'
let VIM_EXPLORER='coc-explorer'

if has('nvim-0.6')
  nnoremap <silent> <expr> <D-1> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <silent> <expr> <D-2> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <silent> <expr> <D-3> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <silent> <expr> <D-4> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <silent> <expr> <D-5> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <silent> <expr> <D-6> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <silent> <expr> <D-7> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <silent> <expr> <D-8> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <silent> <expr> <D-9> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <silent> <expr> <D-0> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  nnoremap <silent> <expr> <A-1> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <silent> <expr> <A-2> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <silent> <expr> <A-3> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <silent> <expr> <A-4> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <silent> <expr> <A-5> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <silent> <expr> <A-6> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <silent> <expr> <A-7> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <silent> <expr> <A-8> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <silent> <expr> <A-9> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <silent> <expr> <A-0> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  " go to next buffer
  nnoremap <silent> <expr> <Leader><Tab> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-.> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <A-.> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-Right> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <A-Right> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  " go to previous buffer
  nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-,> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <A-,> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-Left> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <A-Left> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  " close current buffer without closing vim window
  nnoremap <silent> <expr> <Leader>bd (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

  " re-order current buffer to previous(left)
  nnoremap <silent> <expr> <D-S-Left> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  nnoremap <silent> <expr> <A-S-Left> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  " re-order current buffer to next(right)
  nnoremap <silent> <expr> <D-S-Right> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
  nnoremap <silent> <expr> <A-S-Right> (&filetype == NVIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
else
  nnoremap <silent> <expr> <D-1> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <silent> <expr> <D-2> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <silent> <expr> <D-3> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <silent> <expr> <D-4> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <silent> <expr> <D-5> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <silent> <expr> <D-6> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <silent> <expr> <D-7> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <silent> <expr> <D-8> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <silent> <expr> <D-9> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <silent> <expr> <D-0> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  nnoremap <silent> <expr> <A-1> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <silent> <expr> <A-2> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <silent> <expr> <A-3> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <silent> <expr> <A-4> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <silent> <expr> <A-5> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <silent> <expr> <A-6> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <silent> <expr> <A-7> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <silent> <expr> <A-8> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <silent> <expr> <A-9> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <silent> <expr> <A-0> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  " go to next buffer
  nnoremap <silent> <expr> <Leader><Tab> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-.> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <A-.> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-Right> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <A-Right> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  " go to previous buffer
  nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-,> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <A-,> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-Left> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <A-Left> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  " close current buffer without closing vim window
  nnoremap <silent> <expr> <Leader>bd (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

  " re-order current buffer to previous(left)
  nnoremap <silent> <expr> <D-S-Left> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  nnoremap <silent> <expr> <A-S-Left> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  " re-order current buffer to next(right)
  nnoremap <silent> <expr> <D-S-Right> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
  nnoremap <silent> <expr> <A-S-Right> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
endif
