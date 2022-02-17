lua<<EOF
require("bufferline").setup{
    options = {
        numbers = function(opts)
            return string.format('%s·%s', opts.ordinal, opts.raise(opts.id))
        end,
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = false,
        diagnostics_update_in_insert = false,
        separator_style = "slant",
    }
}
EOF

" key mappings to switch buffers

" macOS command-key
nnoremap <silent> <expr> <D-1> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 1<CR>"
nnoremap <silent> <expr> <D-2> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 2<CR>"
nnoremap <silent> <expr> <D-3> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 3<CR>"
nnoremap <silent> <expr> <D-4> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 4<CR>"
nnoremap <silent> <expr> <D-5> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 5<CR>"
nnoremap <silent> <expr> <D-6> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 6<CR>"
nnoremap <silent> <expr> <D-7> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 7<CR>"
nnoremap <silent> <expr> <D-8> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 8<CR>"
nnoremap <silent> <expr> <D-9> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 9<CR>"
nnoremap <silent> <expr> <D-0> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 10<CR>"

" alt-key
nnoremap <silent> <expr> <A-1> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 1<CR>"
nnoremap <silent> <expr> <A-2> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 2<CR>"
nnoremap <silent> <expr> <A-3> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 3<CR>"
nnoremap <silent> <expr> <A-4> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 4<CR>"
nnoremap <silent> <expr> <A-5> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 5<CR>"
nnoremap <silent> <expr> <A-6> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 6<CR>"
nnoremap <silent> <expr> <A-7> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 7<CR>"
nnoremap <silent> <expr> <A-8> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 8<CR>"
nnoremap <silent> <expr> <A-9> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 9<CR>"
nnoremap <silent> <expr> <A-0> (expand('%') =~ 'fern' ? "\<c-w>\<c-w>" : '')."<Cmd>BufferLineGoToBuffer 10<CR>"
