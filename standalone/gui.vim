" disable menu
if has("gui_running")
    " gvim toolbox
    set guioptions-=T
    " gvim menu
    set guioptions-=m
endif

" maximize
if has("gui_running")
    set lines=999
    set columns=999
    if has('win32') || has('win64')
        au GUIEnter * simalt ~x
    endif
endif
