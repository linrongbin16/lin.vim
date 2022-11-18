let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.animation = v:false
let bufferline.clickable = v:true
let bufferline.no_name_title = '[No Name]'
let bufferline.maximum_length = 80

let MY_NVIM_TREE='NvimTree'
let MY_FERN='fern'

if has('nvim-0.7')
    nnoremap <silent> <expr> <D-1> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <D-2> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <D-3> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <D-4> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <D-5> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <D-6> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <D-7> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <D-8> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <D-9> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <D-0> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"
    nnoremap <silent> <expr> <A-1> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <A-2> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <A-3> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <A-4> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <A-5> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <A-6> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <A-7> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <A-8> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <A-9> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <A-0> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

    " go to next buffer
    nnoremap <silent> <expr> <Leader><Tab> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    " go to previous buffer
    nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

    " re-order current buffer to previous(left)
    nnoremap <silent> <expr> <D-S-Left> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    nnoremap <silent> <expr> <A-S-Left> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    " re-order current buffer to next(right)
    nnoremap <silent> <expr> <D-S-Right> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
    nnoremap <silent> <expr> <A-S-Right> (&filetype == MY_NVIM_TREE ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
else
    nnoremap <silent> <expr> <D-1> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <D-2> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <D-3> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <D-4> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <D-5> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <D-6> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <D-7> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <D-8> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <D-9> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <D-0> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"
    nnoremap <silent> <expr> <A-1> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 1<CR>"
    nnoremap <silent> <expr> <A-2> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 2<CR>"
    nnoremap <silent> <expr> <A-3> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 3<CR>"
    nnoremap <silent> <expr> <A-4> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 4<CR>"
    nnoremap <silent> <expr> <A-5> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 5<CR>"
    nnoremap <silent> <expr> <A-6> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 6<CR>"
    nnoremap <silent> <expr> <A-7> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 7<CR>"
    nnoremap <silent> <expr> <A-8> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 8<CR>"
    nnoremap <silent> <expr> <A-9> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferGoto 9<CR>"
    nnoremap <silent> <expr> <A-0> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferLast<CR>"

    " go to next buffer
    nnoremap <silent> <expr> <Leader><Tab> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-.> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <D-Right> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-.> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    nnoremap <silent> <expr> <A-Right> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
    " go to previous buffer
    nnoremap <silent> <expr> <Leader><S-Tab> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-,> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <D-Left> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-,> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    nnoremap <silent> <expr> <A-Left> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
    " close current buffer without closing vim window
    nnoremap <silent> <expr> <Leader>bd (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

    " re-order current buffer to previous(left)
    nnoremap <silent> <expr> <D-S-Left> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    nnoremap <silent> <expr> <A-S-Left> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
    " re-order current buffer to next(right)
    nnoremap <silent> <expr> <D-S-Right> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
    nnoremap <silent> <expr> <A-S-Right> (&filetype == MY_FERN ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
endif
