let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.animation = v:false
let bufferline.clickable = v:true
let bufferline.no_name_title = '[No Name]'
let bufferline.maximum_length = 80

let s:NVIM_TREE='NvimTree'
let s:FERN='fern'

if has('nvim-0.7')
    nnoremap <silent> <expr> <D-1> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <D-2> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <D-3> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <D-4> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <D-5> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <D-6> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <D-7> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <D-8> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <D-9> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <D-0> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"
    nnoremap <silent> <expr> <A-1> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <A-2> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <A-3> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <A-4> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <A-5> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <A-6> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <A-7> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <A-8> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <A-9> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <A-0> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

    " go to next buffer
    nnoremap <silent> <expr> <Leader><Tab> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    " go to previous buffer
    nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

    " re-order current buffer to previous(left)
    nnoremap <silent> <expr> <D-S-Left> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    nnoremap <silent> <expr> <A-S-Left> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    " re-order current buffer to next(right)
    nnoremap <silent> <expr> <D-S-Right> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
    nnoremap <silent> <expr> <A-S-Right> (&filetype == s:NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
else
    nnoremap <silent> <expr> <D-1> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <D-2> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <D-3> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <D-4> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <D-5> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <D-6> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <D-7> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <D-8> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <D-9> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <D-0> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"
    nnoremap <silent> <expr> <A-1> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <A-2> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <A-3> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <A-4> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <A-5> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <A-6> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <A-7> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <A-8> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <A-9> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <A-0> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

    " go to next buffer
    nnoremap <silent> <expr> <Leader><Tab> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    " go to previous buffer
    nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

    " re-order current buffer to previous(left)
    nnoremap <silent> <expr> <D-S-Left> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    nnoremap <silent> <expr> <A-S-Left> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    " re-order current buffer to next(right)
    nnoremap <silent> <expr> <D-S-Right> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
    nnoremap <silent> <expr> <A-S-Right> (&filetype == s:FERN ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
endif
