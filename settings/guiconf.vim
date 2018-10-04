"" ---- guiconf ----

if has("gui_running")
    set lines=500
    set columns=500
    if has("win32")
        au GUIEnter * simalt ~x
    endif
    "gvim工具栏
    set guioptions-=T
    "gvim菜单栏
    set guioptions-=m
endif

" ---- guifonts ----
if has("win32") || has("mac")
    "set guifont=Monaco:h10
    "set guifont=Hack:h10
    "set guifont=Fira\ Code:h10
    "set guifont=DejaVu\ Sans\ Mono:h10
    set guifont=Fantasque\ Sans\ Mono:h11
    "set guifont=Inconsolata-g:h10
    "set guifont=Monofur:h11
    "set guifont=Anonymous\ Pro:h11
else
    "set guifont=Monaco\ 10
    "set guifont=Hack\ 10
    "set guifont=Fira\ Code\ 10
    "set guifont=DejaVu\ Sans\ Mono\ 10
    set guifont=Fantasque\ Sans\ Mono\ 11
    "set guifont=Inconsolata-g\ 11
    "set guifont=Monofur\ 12
    "set guifont=Anonymous\ Pro\ 11
endif


" statusline
set laststatus=2
function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction

set statusline=
set statusline+=%7*\[%n]\                                   "buffer number
set statusline+=%1*\ %<%F\                                  "filepath
set statusline+=%5*\ %{''.(&fenc!=''?&fenc:&enc).''}        "encoding
set statusline+=%5*\ %{(&bomb?\",BOM\":\"\")}               "encoding2
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\    "language & Highlight on?
set statusline+=%5*\ %y\                                    "filetype
set statusline+=%5*\ %{&ff}\                                "fileformat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\               "row/total (%)
set statusline+=%9*\ col:%03c\                              "column
set statusline+=%2*\ char:0x%04B\ %*                        "character under cursor
set statusline+=%0*\ \ %m%r%w\ %P\ \                        "Modified? Readonly? Top/bot.
