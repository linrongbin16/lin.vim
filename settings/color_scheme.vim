"" ---- color theme ----

syntax enable

" 1) certain color theme
"if has("gui_running")
    "set background=light
    "colorscheme oceanicnext
    "let g:airline_theme='oceanicnext'
"endif


" 2) pick random color
let s:mycolor = ['solarized', 'molokai', 'monokai', 'dracula', 'koehler', 'gruvbox', 'torte', 'darkblue', 'desert', 'evening', 'peachpuff', 'carbonized-dark', 'carbonized-light', 'oceanicnext', 'neodark', 'tender', 'solarized8_high', 'base16-default-dark', 'lucario', 'srcery', 'subtle_light', 'subtle_dark', 'stellarized']
if has("gui_running")
    let curcolor = localtime() % 101 % len(s:mycolor)
    if localtime() % 3 == 0
        execute 'set background=light'
    else
        execute 'set background=dark'
    endif
    execute 'colorscheme ' .s:mycolor[curcolor]
endif

