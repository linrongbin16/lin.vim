"" ---- color scheme ----

"" pick random color
syntax enable
set background=dark
let s:mycolor = ['solarized', 'molokai', 'monokai', 'dracula', 'koehler', 'torte', 'darkblue', 'desert', 'evening', 'neodark', 'solarized8_high', 'lucario', 'srcery', 'palenight', 'one', 'zenburn', 'badwolf']

if has("gui_running")
    let curcolor = localtime() % 101 % len(s:mycolor)
    execute 'colorscheme ' .s:mycolor[curcolor]
    execute 'syntax sync fromstart'
endif

function RandomColor()
    if has("gui_running")
        let curcolor = localtime() % 101 % len(s:mycolor)
        execute 'colorscheme ' .s:mycolor[curcolor]
        execute 'syntax sync fromstart'
    endif
endfunction
