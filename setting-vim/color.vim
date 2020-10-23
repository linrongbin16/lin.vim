"" ---- color scheme ----

"" pick random color
syntax enable
let s:guicolor=['solarized', 'molokai', 'monokai', 'dracula', 'darkblue', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'one', 'rigel']
let s:termcolor=['molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'rigel']

set background=dark

function NextColor()
    try
        if has("gui_running")
            let curcolor = localtime() % len(s:guicolor)
            execute 'colorscheme ' .s:guicolor[curcolor]
            execute 'syntax sync fromstart'
        else
            let curcolor = localtime() % len(s:termcolor)
            execute 'colorscheme ' .s:termcolor[curcolor]
            execute 'syntax sync fromstart'
        endif
        catch
    endtry
endfunction

call NextColor()
