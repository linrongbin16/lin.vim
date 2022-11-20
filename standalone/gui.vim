""" ---- GUI settings ----

" disable GUI menu
set guioptions-=T
set guioptions-=m

" maximize GUI window
set lines=9999
set columns=9999
if has('win32') || has('win64')
    autocmd GUIEnter * simalt ~x
endif
