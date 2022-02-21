let s:gui_color_schemes=['darkblue', 'solarized', 'molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'one', 'onedark', 'codedark', 'gruvbox', 'rigel', 'apprentice', 'base16-default-dark', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge', 'nightfox', 'material']
let s:term_color_schemes=['molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'gruvbox', 'rigel', 'apprentice', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge', 'nightfox', 'material']

if has('nvim-0.5')
    call add(s:gui_color_schemes, 'tokyonight')
    call add(s:gui_color_schemes, 'github_dark')
    call add(s:term_color_schemes, 'tokyonight')
    call add(s:term_color_schemes, 'github_dark')
endif
if has('nvim-0.6')
    call add(s:gui_color_schemes, 'kanagawa')
    call add(s:term_color_schemes, 'kanagawa')
endif

set background=dark

function NextColorScheme()
    try
        if has("gui_running")
            let idx = localtime() % len(s:gui_color_schemes)
            execute 'colorscheme ' .s:gui_color_schemes[idx]
            execute 'syntax sync fromstart'
        else
            let idx = localtime() % len(s:term_color_schemes)
            execute 'colorscheme ' .s:term_color_schemes[idx]
            execute 'syntax sync fromstart'
        endif
        catch
    endtry
endfunction

call NextColorScheme()
