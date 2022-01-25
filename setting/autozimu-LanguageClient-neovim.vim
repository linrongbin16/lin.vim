let g:LanguageClient_hasSnippetSupport = 0


set hidden
set signcolumn=yes

nmap gd <Plug>(lcn-definition)
nmap gt <Plug>(lcn-type-definition)
nmap gr <Plug>(lcn-references)
nmap gi <Plug>(lcn-implementation)
nmap <leader>ls <Plug>(lcn-symbols)
nmap <leader>lc <Plug>(lcn-code-action)
nmap <leader>ll <Plug>(lcn-code-lens-action)
nmap <leader>lh <Plug>(lcn-hover)

" use <tab> <s-tab> to select next/previous complete candidate
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
