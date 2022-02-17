lua<<EOF
require("bufferline").setup{
    options = {
        numbers = function(opts)
            return string.format('%s·%s', opts.raise(opts.ordinal), opts.lower(opts.id))
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
nnoremap <silent> <D-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent> <D-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent> <D-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent> <D-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent> <D-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent> <D-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent> <D-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent> <D-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent> <D-9> <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent> <D-0> <Cmd>BufferLineGoToBuffer 10<CR>

" for other OS alt-key
nnoremap <silent> <A-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent> <A-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent> <A-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent> <A-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent> <A-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent> <A-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent> <A-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent> <A-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent> <A-9> <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent> <A-0> <Cmd>BufferLineGoToBuffer 10<CR>
