"" ---- color scheme ----

"" pick random color
syntax enable
let s:mycolor=['solarized', 'molokai', 'monokai', 'dracula', 'torte', 'darkblue', 'evening', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'one', 'rigel']

if localtime() % 2 == 0
    set background=dark
else
    set background=light
endif

if has("gui_running")
    let curcolor = localtime() % len(s:mycolor)
    execute 'colorscheme ' .s:mycolor[curcolor]
    execute 'syntax sync fromstart'
endif

function NextColor()
    if has("gui_running")
        let curcolor = localtime() % len(s:mycolor)
        execute 'colorscheme ' .s:mycolor[curcolor]
        execute 'syntax sync fromstart'
    endif
endfunction

:command NextColor :call NextColor()
