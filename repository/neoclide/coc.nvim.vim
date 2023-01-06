" Check if previous char is whitespace
function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <CR> and <TAB> to confirm suggestion
inoremap <silent> <expr> <CR>
            \ coc#pum#visible() ? coc#_select_confirm(): "\<CR>"

inoremap <silent> <expr> <TAB>
            \ coc#pum#visible() ? coc#_select_confirm():
            \ <SID>CheckBackspace() ? "\<TAB>" : coc#refresh()

" Use <C-f> and <C-b> to navigate snippet position in insert mode
let g:coc_snippet_next = '<C-f>'
let g:coc_snippet_prev = '<C-b>'

" Use `<C-k>` to force trigger complete
inoremap <silent><expr> <c-k> coc#refresh()

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> gd <Plug>(coc-definition)
" Go to declaration
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gl <Plug>(coc-declaration)
" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gt <Plug>(coc-type-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Go to references
nmap <silent> gr <Plug>(coc-references)

function! LinVimShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('definitionHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Show hover information
nnoremap <silent> K :call LinVimShowDocumentation()<CR>

augroup lin_vim_coc_group
    autocmd!
     " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Rename symbol
nmap <Leader>rs <Plug>(coc-rename)

" Format code (sync) on whole buffer in normal mode
nmap <Leader>cf <Plug>(coc-format)
" Or selected code in visual mode
xmap <Leader>cf <Plug>(coc-format-selected)

" Run code action (interactive) under cursor in normal mode
nmap <Leader>ca <Plug>(coc-codeaction-cursor)
" Or selected code in visual mode
xmap <Leader>ca <Plug>(coc-codeaction-selected)

" Apply quick fix (non-interactive) for diagnostics of current line
nmap <Leader>qf <Plug>(coc-fix-current)

" Run the CodeLens on current line
nmap <Leader>cl <Plug>(coc-codelens-action)
