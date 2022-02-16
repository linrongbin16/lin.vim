" default extensions

set shortmess+=c

" use `<tab>` `<c-n>` `<PnDown>` to select next suggestion
" use `<s-tab>` `<c-p>` `<PnUp>` to select previous suggestion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use `<c-space>` to trigger complete
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" use `<cr>` to confirm the complete item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use `[d` and `]d` to navigate diagnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" use `gd` to go to definition
nmap <silent> gd <Plug>(coc-definition)
" use `gy` to go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" use `gi` to go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" use `gr` to go to references
nmap <silent> gr <Plug>(coc-references)

" Use `K` to hover
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

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

" use `<leader>rs` to rename symbol
nmap <leader>rs  <Plug>(coc-rename)

augroup mycocgroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" use `<leader>cs` to apply codeAction to the selected code.
xmap <leader>cs  <Plug>(coc-codeaction-selected)
nmap <leader>cs  <Plug>(coc-codeaction-selected)

" use `<leader>ca` to apply codeAction to the current buffer
nmap <leader>ca  <Plug>(coc-codeaction)

" use `<leader>cf` to apply auto-fix problem on the current line
" xmap <leader>cf  <Plug>(coc-fix-current)

" use `<leader>cl` to run codeLens on current line
" nmap <leader>cl  <Plug>(coc-codelens-action)
