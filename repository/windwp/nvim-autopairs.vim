lua<<EOF
require('nvim-autopairs').setup{
    -- This key mapping is conflict with coc.nvim
    -- Coc.nvim use <CR> to confirm suggestion in insert mode
    map_cr = false 
}
EOF
