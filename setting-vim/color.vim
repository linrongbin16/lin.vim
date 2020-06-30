"" ---- color scheme ----

"" pick random color
syntax enable
let s:guicolor=['solarized', 'molokai', 'monokai', 'dracula', 'darkblue', 'evening', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'one', 'rigel']
let s:termcolor=['molokai', 'monokai', 'dracula', 'darkblue', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'one', 'rigel']

if localtime() % 5 == 0
    set background=light
else
    set background=dark
endif

if has("gui_running")
    let curcolor = localtime() % len(s:guicolor)
    execute 'colorscheme ' .s:guicolor[curcolor]
    execute 'syntax sync fromstart'
else
    let curcolor = localtime() % len(s:termcolor)
    execute 'colorscheme ' .s:termcolor[curcolor]
    execute 'syntax sync fromstart'
endif

function NextColor()
    if has("gui_running")
        let curcolor = localtime() % len(s:guicolor)
        execute 'colorscheme ' .s:guicolor[curcolor]
        execute 'syntax sync fromstart'
    else
        let curcolor = localtime() % len(s:termcolor)
        execute 'colorscheme ' .s:termcolor[curcolor]
        execute 'syntax sync fromstart'
    endif
endfunction

:command NextColor :call NextColor()
