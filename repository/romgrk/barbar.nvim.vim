let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.icons = 'both'
let bufferline.no_name_title = '[No Name]'
let bufferline.maximum_length = 80

function! s:LinVimDefineBarbarKeys(k) abort
    " go to buffer-1~9, or the last buffer
    " <D-?>/<A-?>/<M-?>/<C-?>
    " ?: 0-9
    execute printf('nnoremap <silent> <expr> <%s-1> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 1\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-2> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 2\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-3> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 3\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-4> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 4\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-5> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 5\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-6> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 6\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-7> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 7\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-8> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 8\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-9> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferGoto 9\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-0> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferLast\<CR>"', a:k)

    " go to next/previous buffer
    " <D-?>/<A-?>/<M-?>/<C-?>
    " ?: ,/Left/./Right
    execute printf('nnoremap <silent> <expr> <%s-.> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferNext\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-Right> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferNext\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-,> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferPrevious\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-Left> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferPrevious\<CR>"', a:k)

    " re-order current buffer to next/previous position
    " <D-S-?>/<A-S-?>/<M-S-?>/<C-S-?>
    " ?: ,/Left/./Right
    execute printf('nnoremap <silent> <expr> <%s-S-,> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferMovePrevious\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-S-Left> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferMovePrevious\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-S-.> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferMoveNext\<CR>"', a:k)
    execute printf('nnoremap <silent> <expr> <%s-S-Right> (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>BufferMoveNext\<CR>"', a:k)
endfunction


call s:LinVimDefineBarbarKeys('D')
call s:LinVimDefineBarbarKeys('A')
call s:LinVimDefineBarbarKeys('M')
call s:LinVimDefineBarbarKeys('C')

" go to next/previous buffer, close buffer
nnoremap <silent> <expr> <Leader>bn (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern "? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
nnoremap <silent> <expr> <Leader>bp (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
nnoremap <silent> <expr> <Leader>bd (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"
