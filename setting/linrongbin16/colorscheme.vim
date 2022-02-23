let s:gui_color_schemes=['darkblue', 'solarized8', 'molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'rigel', 'apprentice', 'base16-default-dark', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge', 'nightfox', 'material']
let s:term_color_schemes=['molokai', 'monokai', 'dracula', 'neodark', 'srcery', 'palenight', 'onedark', 'codedark', 'rigel', 'apprentice', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge', 'nightfox', 'material']

if has('nvim-0.6')
  call add(s:gui_color_schemes, 'kanagawa')
  call add(s:term_color_schemes, 'kanagawa')
endif

if has('nvim-0.5')
  call add(s:gui_color_schemes, 'tokyonight')
  call add(s:gui_color_schemes, 'github_dark')
  call add(s:term_color_schemes, 'tokyonight')
  call add(s:term_color_schemes, 'github_dark')
endif

set background=dark

" for material
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'

function NextColorScheme(force_redraw)
    try
        if has("gui_running")
            let idx = localtime() % len(s:gui_color_schemes)
            execute 'colorscheme ' .s:gui_color_schemes[idx]
            if force_redraw
              execute 'syntax sync fromstart'
            endif
        else
            let idx = localtime() % len(s:term_color_schemes)
            execute 'colorscheme ' .s:term_color_schemes[idx]
            if force_redraw
              execute 'syntax sync fromstart'
            endif
        endif
        catch
    endtry
endfunction

" initialize color scheme for vim start
call NextColorScheme(v:false)
