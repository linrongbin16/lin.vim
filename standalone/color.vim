""" ---- Color schemes ----

let lin_vim_colorschemes=[
            \ 'darkblue',
            \ 'solarized8',
            \ 'monokai', 
            \ 'dracula', 
            \ 'neodark', 
            \ 'srcery', 
            \ 'palenight', 
            \ 'onedark', 
            \ 'rigel', 
            \ 'base16-default-dark',
            \ 'edge', 
            \ 'gruvbox-material', 
            \ 'everforest', 
            \ 'sonokai', 
            \ 'material'
            \ ]

if has('nvim-0.5')
    call add(lin_vim_colorschemes, 'nightfox')
    call add(lin_vim_colorschemes, 'tokyonight')
    call add(lin_vim_colorschemes, 'github_dark')
endif

if has('nvim-0.6')
    call add(lin_vim_colorschemes, 'kanagawa')
endif

function NextRandomColorScheme()
    let idx = localtime() % len(lin_vim_colorschemes)
    execute 'colorscheme ' . lin_vim_colorschemes[idx]
endfunction

function NextRandomColorSchemeSync()
    let idx = localtime() % len(lin_vim_colorschemes)
    execute 'colorscheme ' . lin_vim_colorschemes[idx]
    execute 'syntax sync fromstart'
endfunction
