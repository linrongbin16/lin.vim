syntax enable
let s:gui_color_scheme=['darkblue', 'solarized', 'molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'one', 'onedark', 'codedark', 'gruvbox', 'rigel', 'apprentice', 'base16-default-dark', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge']
let s:term_color_scheme=['molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'rigel', 'apprentice', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge']

set background=dark

function NextRandomColor()
    try
        if has("gui_running")
            let idx = localtime() % len(s:gui_color_scheme)
            execute 'colorscheme ' .s:gui_color_scheme[idx]
            execute 'syntax sync fromstart'
        else
            let idx = localtime() % len(s:term_color_scheme)
            execute 'colorscheme ' .s:term_color_scheme[idx]
            execute 'syntax sync fromstart'
        endif
        catch
    endtry
endfunction

call NextRandomColor()
