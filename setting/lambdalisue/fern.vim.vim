" open fern file explorer on vim start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * ++nested Fern -stay -keep -toggle -drawer %:h | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" drawer width
let g:fern#drawer_width=40
" show hidden files
let g:fern#default_hidden=1
" icon render
let g:fern#renderer = "nerdfont"
" disable default key mapping
" let g:fern#disable_default_mappings=1



" key mappings for fern explorer
function! s:fern_settings() abort

  " fern key mapping
  " nmap <buffer><nowait> ? <Plug>(fern-action-help)
  " nmap <buffer><nowait> . <Plug>(fern-action-repeat)
  nmap <buffer><nowait> R <Plug>(fern-action-reload)
  " nmap <buffer><nowait> h <Plug>(fern-action-collapse)
  " nmap <buffer><nowait> l <Plug>(fern-action-open-or-expand)
  " nmap <buffer><nowait> <CR> <Plug>(fern-action-enter)
  " nmap <buffer><nowait> <BS> <Plug>(fern-action-leave)
  " nmap <buffer><nowait> s <Plug>(fern-action-open:system)
  " nmap <buffer><nowait> N <Plug>(fern-action-new-leaf)
  " nmap <buffer><nowait> K <Plug>(fern-action-new-branch)
  " nmap <buffer><nowait> c <Plug>(fern-action-copy)
  " nmap <buffer><nowait> m <Plug>(fern-action-move)
  " nmap <buffer><nowait> D <Plug>(fern-action-remove)

  " enhanced preview key mapping
  nmap <buffer> <Tab> <Plug>(fern-action-preview:toggle)
  " nmap <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  " nmap <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  nmap <buffer> <expr> <Plug>(my-fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
  nmap <buffer> q <Plug>(my-fern-quit-or-close-preview)
endfunction

augroup FernCustom
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
