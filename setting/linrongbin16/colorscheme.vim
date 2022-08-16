let s:mycolors=['darkblue', 'solarized8', 'base16-default-dark', 'monokai', 'dracula', 'neodark', 'srcery',
      \ 'palenight', 'onedark', 'rigel', 'jellybeans', 'sonokai', 'everforest', 'gruvbox-material', 'edge',
      \ 'material']

" colors that not working well with tabline
" molokai
" apprentice

if has('nvim-0.6')
  call add(s:mycolors, 'kanagawa')
endif

if has('nvim-0.5')
  call add(s:mycolors, 'nightfox')
  call add(s:mycolors, 'tokyonight')
  call add(s:mycolors, 'github_dark')
endif

set background=dark

" for material
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'

function NextColorScheme()
  let idx = localtime() % len(s:mycolors)
  execute 'colorscheme ' . s:mycolors[idx]
endfunction

function NextColorSchemeAndSync()
  let idx = localtime() % len(s:mycolors)
  execute 'colorscheme ' . s:mycolors[idx]
  execute 'syntax sync fromstart'
endfunction

" initialize color scheme for vim start
call NextColorScheme()
