"" ---- color theme ----

syntax enable
let g:solarized_termcolors=256
let g:rehash256=1

" 1) certain color theme
"if has("gui_running")
    "set background=light
    "colorscheme oceanicnext
    "let g:airline_theme='oceanicnext'
"endif


" 2) pick random color
let s:mycolor = ['solarized', 'molokai', 'monokai', 'dracula', 'koehler', 'gruvbox', 'torte', 'darkblue', 'desert', 'evening', 'peachpuff', 'carbonized-dark', 'carbonized-light', 'nord', 'oceanicnext', 'neodark', 'tender', 'solarized8_high', 'base16-default-dark', 'lucario', 'two-firewatch']
if has("gui_running")
    let curcolor = localtime() % len(s:mycolor)
    if localtime() % 3 == 0
        execute 'set background=light'
    else
        execute 'set background=dark'
    endif
    execute 'colorscheme ' .s:mycolor[curcolor]
endif

