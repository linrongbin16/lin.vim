syntax enable
let s:guicolor=['darkblue', 'solarized', 'molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'one', 'onedark', 'codedark', 'gruvbox', 'rigel', 'apprentice', 'base16-default-dark', 'jellybeans']
let s:termcolor=['molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'rigel', 'apprentice', 'jellybeans']

set background=dark

function NextColor()
    try
        if has("gui_running")
            let idx = localtime() % len(s:guicolor)
            execute 'colorscheme ' .s:guicolor[idx]
        else
            let idx = localtime() % len(s:termcolor)
            execute 'colorscheme ' .s:termcolor[idx]
        endif
        execute 'syntax sync fromstart'
        catch
    endtry
endfunction

call NextColor()
