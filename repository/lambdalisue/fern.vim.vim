" Open fern file explorer on vim start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * ++nested Fern -keep -toggle -drawer %:h | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Drawer width
let g:fern#drawer_width=40
" Show hidden files
let g:fern#default_hidden=1
" Icon render
let g:fern#renderer = "nerdfont"
" Disable default key mapping
let g:fern#disable_default_mappings=1
" Better indent
let g:fern#renderer#nerdfont#leading=" │ "

" Key mappings for fern explorer
function! s:fern_settings() abort
  " fern key mapping

  " navigation
  " expand folder or open file
  nmap <silent> <buffer><nowait> l <Plug>(fern-action-open-or-expand)
  " collapse folder
  nmap <silent> <buffer><nowait> h <Plug>(fern-action-collapse)
  " cd into folder
  nmap <silent> <buffer><nowait> <CR> <Plug>(fern-action-enter)
  " goto upper folder and leave current folder
  nmap <silent> <buffer><nowait> <BS> <Plug>(fern-action-leave)

  " split
  nmap <silent> <buffer><nowait> e <Plug>(fern-action-open:split)
  nmap <silent> <buffer><nowait> E <Plug>(fern-action-open:vsplit)
  nmap <silent> <buffer><nowait> t <Plug>(fern-action-open:tabedit)

  " refresh
  nmap <silent> <buffer><nowait> R <Plug>(fern-action-reload)

  " create/rename/delete
  nmap <silent> <buffer><nowait> N <Plug>(fern-action-new-file)
  nmap <silent> <buffer><nowait> A <Plug>(fern-action-new-dir)
  nmap <silent> <buffer><nowait> r <Plug>(fern-action-move)
  nmap <silent> <buffer><nowait> m <Plug>(fern-action-move)
  nmap <silent> <buffer><nowait> d <Plug>(fern-action-trash)
  nmap <silent> <buffer><nowait> D <Plug>(fern-action-remove)

  " copy/paste/cut
  nmap <silent> <buffer><nowait> C <Plug>(fern-action-clipboard-copy)
  nmap <silent> <buffer><nowait> X <Plug>(fern-action-clipboard-move)
  nmap <silent> <buffer><nowait> V <Plug>(fern-action-clipboard-paste)

  " open in system
  nmap <silent> <buffer><nowait> s <Plug>(fern-action-open:system)

  " help
  nmap <silent> <buffer><nowait> ? <Plug>(fern-action-help)

  " resize explorer width
  nmap <silent> <buffer><nowait> <D-,> <Plug>(fern-action-zoom:reset)
  nmap <silent> <buffer><nowait> <D-Left> <Plug>(fern-action-zoom:reset)
  nmap <silent> <buffer><nowait> <A-,> <Plug>(fern-action-zoom:reset)
  nmap <silent> <buffer><nowait> <A-Left> <Plug>(fern-action-zoom:reset)
  nmap <silent> <buffer><nowait> <M-,> <Plug>(fern-action-zoom:reset)
  nmap <silent> <buffer><nowait> <M-Left> <Plug>(fern-action-zoom:reset)
  nmap <silent> <buffer><nowait> <C-,> <Plug>(fern-action-zoom:reset)
  nmap <silent> <buffer><nowait> <C-Left> <Plug>(fern-action-zoom:reset)

  nmap <silent> <buffer><nowait> <D-.> <Plug>(fern-action-zoom:half)
  nmap <silent> <buffer><nowait> <D-Right> <Plug>(fern-action-zoom:half)
  nmap <silent> <buffer><nowait> <A-.> <Plug>(fern-action-zoom:half)
  nmap <silent> <buffer><nowait> <A-Right> <Plug>(fern-action-zoom:half)
  nmap <silent> <buffer><nowait> <M-.> <Plug>(fern-action-zoom:half)
  nmap <silent> <buffer><nowait> <M-Right> <Plug>(fern-action-zoom:half)
  nmap <silent> <buffer><nowait> <C-.> <Plug>(fern-action-zoom:half)
  nmap <silent> <buffer><nowait> <C-Right> <Plug>(fern-action-zoom:half)
endfunction

augroup my_fern_group
  autocmd!
  autocmd FileType fern call s:fern_settings()
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fern setl nonumber
  autocmd FileType fern setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
augroup END
