set completeopt=menu,menuone,noselect

lua <<EOF

local cmp = require'cmp'

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local select_next_or_fallback = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    else
        fallback()
    end
end

local select_prev_or_fallback = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i'}),
        ["<Tab>"] = cmp.mapping(select_next_or_fallback, { "i", "s" }),
        ["<C-n>"] = cmp.mapping(select_next_or_fallback, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(select_prev_or_fallback, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(select_prev_or_fallback, { "i", "s" }),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if vim.fn["vsnip#jumpable"](1) == 1 then
                feedkey("<Plug>(vsnip-jump-next)", "")
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<C-k>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
-- }

require'lspconfig'.clangd.setup {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--header-insertion=never",
        "--background-index",
        "--limit-references=100",
        "--limit-results=20",
        "-j=20",
        "--pch-storage=memory"
     }
}
EOF
