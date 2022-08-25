let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.animation = v:false
let bufferline.clickable = v:true
let bufferline.no_name_title = '[No Name]'
let bufferline.maximum_length = 80

let NVIM_TREE='NvimTree'
let FERN='fern'

if has('nvim-0.7')
  nnoremap <silent> <expr> <D-1> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <silent> <expr> <D-2> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <silent> <expr> <D-3> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <silent> <expr> <D-4> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <silent> <expr> <D-5> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <silent> <expr> <D-6> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <silent> <expr> <D-7> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <silent> <expr> <D-8> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <silent> <expr> <D-9> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <silent> <expr> <D-0> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  " go to next buffer
  nnoremap <silent> <expr> <Leader><Tab> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-.> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-Right> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  " go to previous buffer
  nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-,> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-Left> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  " close current buffer without closing vim window
  nnoremap <silent> <expr> <Leader>bd (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

  " re-order current buffer to previous(left)
  nnoremap <silent> <expr> <D-S-Left> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  " re-order current buffer to next(right)
  nnoremap <silent> <expr> <D-S-Right> (&filetype == NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
else
  nnoremap <silent> <expr> <D-1> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
  nnoremap <silent> <expr> <D-2> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
  nnoremap <silent> <expr> <D-3> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
  nnoremap <silent> <expr> <D-4> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
  nnoremap <silent> <expr> <D-5> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
  nnoremap <silent> <expr> <D-6> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
  nnoremap <silent> <expr> <D-7> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
  nnoremap <silent> <expr> <D-8> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
  nnoremap <silent> <expr> <D-9> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
  nnoremap <silent> <expr> <D-0> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

  " go to next buffer
  nnoremap <silent> <expr> <Leader><Tab> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-.> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  nnoremap <silent> <expr> <D-Right> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
  " go to previous buffer
  nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-,> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  nnoremap <silent> <expr> <D-Left> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
  " close current buffer without closing vim window
  nnoremap <silent> <expr> <Leader>bd (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

  " re-order current buffer to previous(left)
  nnoremap <silent> <expr> <D-S-Left> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
  " re-order current buffer to next(right)
  nnoremap <silent> <expr> <D-S-Right> (&filetype == FERN ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
endif
