""" ---- GUI settings ----

" disable GUI menu
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
endif

" maximize GUI window
if has("gui_running")
    set lines=9999
    set columns=9999
endif
if has('win32') || has('win64')
    autocmd GUIEnter * simalt ~x
endif
