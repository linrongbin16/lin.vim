"" ---- color scheme ----

"" pick random color
syntax enable
set background=dark
let s:mycolor = ['solarized', 'molokai', 'monokai', 'dracula', 'torte', 'darkblue', 'evening', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'one']

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
