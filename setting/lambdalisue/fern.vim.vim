" open fern file explorer on vim start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * ++nested Fern -keep -toggle -drawer %:h | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" drawer width
let g:fern#drawer_width=40
" show hidden files
let g:fern#default_hidden=1
" icon render
let g:fern#renderer = "nerdfont"
" disable default key mapping
let g:fern#disable_default_mappings=1

let g:fern#renderer#nerdfont#leading="  "

" key mappings for fern explorer
function! s:fern_settings() abort
  " fern key mapping

  " navigation
  nmap <buffer><nowait> l <Plug>(fern-action-open-or-expand)
  nmap <buffer><nowait> h <Plug>(fern-action-collapse)
  nmap <buffer><nowait> <CR> <Plug>(fern-action-enter)
  nmap <buffer><nowait> <BS> <Plug>(fern-action-leave)

  " split
  nmap <buffer><nowait> <C-v> <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> <C-x> <Plug>(fern-action-open:split)
  nmap <buffer><nowait> <C-t> <Plug>(fern-action-open:tabedit)

  " refresh
  nmap <buffer><nowait> R <Plug>(fern-action-reload)

  " create/delete/rename
  nmap <buffer><nowait> N <Plug>(fern-action-new-file)
  nmap <buffer><nowait> K <Plug>(fern-action-new-dir)
  nmap <buffer><nowait> d <Plug>(fern-action-trash)
  nmap <buffer><nowait> D <Plug>(fern-action-remove)
  nmap <buffer><nowait> m <Plug>(fern-action-move)
  nmap <buffer><nowait> r <Plug>(fern-action-move)

  nmap <buffer><nowait> C <Plug>(fern-action-clipboard-copy)

  " copy/paste/cut
  nmap <buffer><nowait> X <Plug>(fern-action-clipboard-move)
  nmap <buffer><nowait> V <Plug>(fern-action-clipboard-pate)
  nmap <buffer><nowait> P <Plug>(fern-action-clipboard-pate)

  " open in system
  nmap <buffer><nowait> s <Plug>(fern-action-open:system)

  " help
  nmap <buffer><nowait> ? <Plug>(fern-action-help)

  " resize explorer width
  nmap <buffer><nowait> <D-,> <Plug>(fern-action-zoom:reset)
  nmap <buffer><nowait> <D-.> <Plug>(fern-action-zoom:half)
  nmap <buffer><nowait> <A-,> <Plug>(fern-action-zoom:reset)
  nmap <buffer><nowait> <A-.> <Plug>(fern-action-zoom:half)
  nmap <buffer><nowait> <D-Left> <Plug>(fern-action-zoom:reset)
  nmap <buffer><nowait> <D-Right> <Plug>(fern-action-zoom:half)
  nmap <buffer><nowait> <A-Left> <Plug>(fern-action-zoom:reset)
  nmap <buffer><nowait> <A-Right> <Plug>(fern-action-zoom:half)
endfunction

augroup FernExplorerCustom
  autocmd!
  autocmd FileType fern call s:fern_settings()
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fern setl nonumber
  autocmd FileType fern setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
augroup END
