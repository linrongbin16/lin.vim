"" ---- color scheme ----

"" pick random color
syntax enable
let s:mycolor=['solarized', 'molokai', 'monokai', 'dracula', 'darkblue', 'evening', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'one', 'rigel']

if localtime() % 5 == 0
    set background=light
else
    set background=dark
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
