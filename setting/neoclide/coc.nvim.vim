" default extensions
let g:coc_global_extensions = ['coc-git', 'coc-snippets', 'coc-yank', 'coc-lists', 'coc-pyright', 'coc-clangd', 'coc-rust-analyzer', 'coc-go', 'coc-cmake', 'coc-html', 'coc-xml', 'coc-json', 'coc-css', 'coc-tsserver', '@yaegassy/coc-volar', 'coc-eslint', 'coc-prettier']

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use `<Tab>` `<C-n>` `<Down>` to navigate next suggestion
" use `<S-Tab>` `<C-p>` `<Up>` to navigate previous suggestion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" use `<c-f>` to jump to next snippet position in insert mode
let g:coc_snippet_next = '<C-f>'
" use `<c-b>` to jump to previous snippet position in insert mode
let g:coc_snippet_prev = '<C-b>'

" use `<c-k>` to force trigger complete
inoremap <silent><expr> <c-k> coc#refresh()

" use `<cr>` to confirm the complete item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use `[d` and `]d` to navigate diagnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" go to definition
nmap <silent> gd <Plug>(coc-definition)
" go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" go to references
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" highlight current symbol, we use vim-illuminate instead of this
" autocmd CursorHold * silent call CocActionAsync('highlight')

" hover symbol
nnoremap K :call CocActionAsync('doHover')<CR>

augroup mycocgroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" rename symbol
nmap <leader>rs  <Plug>(coc-rename)

" run code format (async) on current buffer or visual selection
nmap <leader>cf  <Plug>(coc-format)
xmap <leader>cf  <Plug>(coc-format-selected)

" apply code action on the current buffer or visual selection
nmap <leader>ca  <Plug>(coc-codeaction)
xmap <leader>ca  <Plug>(coc-codeaction-selected)

" apply auto-fix to problem on the current line
xmap <leader>qf  <Plug>(coc-fix-current)

" run code lens on current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" coc-git operations
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap <leader>gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <leader>gc <Plug>(coc-git-commit)
