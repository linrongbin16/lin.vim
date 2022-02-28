let s:my_colors=['darkblue', 'solarized8', 'base16-default-dark', 'monokai', 'dracula', 'neodark', 'srcery',
      \ 'palenight', 'onedark', 'codedark', 'rigel', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge',
      \ 'nightfox', 'material']

" colors that not working well with tabline
" molokai
" apprentice

if has('nvim-0.6')
  call add(s:my_colors, 'kanagawa')
endif

if has('nvim-0.5')
  call add(s:my_colors, 'tokyonight')
  call add(s:my_colors, 'github_dark')
endif

set background=dark

" for material
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'

function NextColorScheme()
  let idx = localtime() % len(s:my_colors)
  execute 'colorscheme ' . s:my_colors[idx]
endfunction

function NextColorSchemeAndSync()
  let idx = localtime() % len(s:my_colors)
  execute 'colorscheme ' . s:my_colors[idx]
  execute 'syntax sync fromstart'
endfunction

" initialize color scheme for vim start
call NextColorScheme()
