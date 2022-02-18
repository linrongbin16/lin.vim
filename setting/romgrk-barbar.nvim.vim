let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.animation = v:false
let bufferline.clickable = v:true
let bufferline.no_name_title = '[No Name]'


" key mappings to switch buffers

" macOS command-key
nnoremap <silent> <expr> <D-1> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 1<CR>"
nnoremap <silent> <expr> <D-2> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 2<CR>"
nnoremap <silent> <expr> <D-3> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 3<CR>"
nnoremap <silent> <expr> <D-4> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 4<CR>"
nnoremap <silent> <expr> <D-5> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 5<CR>"
nnoremap <silent> <expr> <D-6> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 6<CR>"
nnoremap <silent> <expr> <D-7> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 7<CR>"
nnoremap <silent> <expr> <D-8> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 8<CR>"
nnoremap <silent> <expr> <D-9> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 9<CR>"
nnoremap <silent> <expr> <D-0> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLast<CR>"

" alt-key
nnoremap <silent> <expr> <A-1> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 1<CR>"
nnoremap <silent> <expr> <A-2> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 2<CR>"
nnoremap <silent> <expr> <A-3> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 3<CR>"
nnoremap <silent> <expr> <A-4> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 4<CR>"
nnoremap <silent> <expr> <A-5> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 5<CR>"
nnoremap <silent> <expr> <A-6> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 6<CR>"
nnoremap <silent> <expr> <A-7> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 7<CR>"
nnoremap <silent> <expr> <A-8> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 8<CR>"
nnoremap <silent> <expr> <A-9> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferGoto 9<CR>"
nnoremap <silent> <expr> <A-0> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLast<CR>"

" go to next buffer
nnoremap <expr> <Leader><Tab> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
nnoremap <expr> <D-.> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
nnoremap <expr> <A-.> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
nnoremap <expr> <D-Right> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
nnoremap <expr> <A-Right> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferNext<CR>"
" go to previous buffer
nnoremap <expr> <Leader><S-Tab> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
nnoremap <expr> <D-,> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
nnoremap <expr> <A-,> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
nnoremap <expr> <D-Left> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
nnoremap <expr> <A-Left> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferPrevious<CR>"
" close current buffer without closing vim window
nnoremap <expr> <Leader>bd (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferClose<CR>"

" re-order current buffer to previous(left)
nnoremap <expr> <D-S-Left> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
nnoremap <expr> <A-S-Left> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferMovePrevious<CR>"
" re-order current buffer to next(right)
nnoremap <expr> <D-S-Right> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
nnoremap <expr> <A-S-Right> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '').":BufferMoveNext<CR>"
