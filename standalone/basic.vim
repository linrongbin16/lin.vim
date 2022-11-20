""" ---- Basic settings ----

set rtp+=$HOME/.vim

""" VI compatible
set nocp

""" bell
set noeb vb t_vb=

""" file
set ar aw nobk noswf nowb ma hid
au FocusGained,BufEnter * checktime

""" editing
set bs=indent,eol,start
set ww+=b,s,<,>,[,]
set cb^=unnamed,unnamedplus

""" language
language messages en_US.UTF-8

""" encoding
" set fileformat=unix
" set fileformats=unix,dos,mac
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp936,gb18030,gbk,big5,euc-jp,euc-kr,default,latin1
set enc=utf-8
set tenc=utf-8

" mouse
set mouse=a
set sel=exclusive
set slm=mouse,key

" indent
set cin si ai
set et sta ts=4 sts=4 sw=4

" plugin
filetype on
filetype plugin on
filetype indent on

" syntax
syn on

" complete
set cot=menu,menuone,preview

" folding
set fen fdm=indent fdn=100 fdl=100
nnoremap zz @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" search
set magic noic hls
if has('patch-8.0.1238')
    set is
endif

""" whitespace
set lcs=tab:>·,trail:~,extends:>,precedes:<,space:·
" set lcs=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

""" color
set bg=dark
if has("termguicolors")
    set termguicolors
endif
set nocuc cul
" set cc=120

""" ui
set nu nornu ru sc sm smd wrap
set signcolumn=yes

""" scroll
set so=1

""" notification
set shm+=c ch=2 ls=2

""" update
set ut=300

" render
set lz tf rdt=1000 mmp=102400
" set re=1

""" tags
set tags+=./tags,tags

" disable macvim GUI key mappings
let macvim_skip_cmd_opt_movement=1

" disable syntax highlighting sync on big file for better lantency
" autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syn sync clear | endif
