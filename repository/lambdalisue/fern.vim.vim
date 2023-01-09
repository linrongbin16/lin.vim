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

function! s:LinVimDefineFernKeys(k) abort
    execute printf('nmap <silent> <buffer><nowait> <%s-,> <Plug>(fern-action-zoom:reset)', a:k)
    execute printf('nmap <silent> <buffer><nowait> <%s-Left> <Plug>(fern-action-zoom:reset)', a:k)
    execute printf('nmap <silent> <buffer><nowait> <%s-.> <Plug>(fern-action-zoom:half)', a:k)
    execute printf('nmap <silent> <buffer><nowait> <%s-Right> <Plug>(fern-action-zoom:half)', a:k)
endfunction

" Key mappings for fern explorer
function! s:LinVimFernSettings() abort
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
    call s:LinVimDefineFernKeys('D')
    call s:LinVimDefineFernKeys('A')
    call s:LinVimDefineFernKeys('M')
    call s:LinVimDefineFernKeys('C')
endfunction

augroup my_fern_group
    autocmd!
    autocmd FileType fern call s:LinVimFernSettings()
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType fern setlocal nonumber
    autocmd FileType fern setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
augroup END
