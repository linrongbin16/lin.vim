" open fern file explorer on vim start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * ++nested Fern -stay -keep -toggle -drawer %:h | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" show hidden files
let g:fern#default_hidden=1

" key mappings for fern explorer
function! s:fern_settings() abort
    nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
    nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
    nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
    nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
    nmap <silent> <buffer> <expr> <Plug>(fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
    nmap <silent> <buffer> q <Plug>(fern-quit-or-close-preview)
endfunction

augroup FernCustom
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

" icon render
let g:fern#renderer = "nerdfont"
