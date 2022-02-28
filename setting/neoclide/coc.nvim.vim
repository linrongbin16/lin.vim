" default extensions
let g:coc_global_extensions = ['coc-snippets', 'coc-yank', 'coc-lists', 'coc-pyright', 'coc-clangd', 'coc-rust-analyzer', 'coc-cmake', 'coc-html', 'coc-xml', 'coc-json', 'coc-css', 'coc-tsserver', '@yaegassy/coc-volar', 'coc-eslint', 'coc-prettier', 'coc-sqlfluff', 'coc-tabnine']
let g:coc_snippet_prev = '<TAB>'
let g:coc_snippet_next = '<S-TAB>'

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use `<c-n>` `<PnDown>` to select next suggestion
" use `<c-p>` `<PnUp>` to select previous suggestion
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ?
"       \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" use `<tab>` `<c-n>` `<PnDown>` to select next suggestion
" use `<s-tab>` `<c-p>` `<PnUp>` to select previous suggestion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" use `<c-k>` to force trigger complete
inoremap <silent><expr> <c-k> coc#refresh()

" use `<cr>` to confirm the complete item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" highlight current symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

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
