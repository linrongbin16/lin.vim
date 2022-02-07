" open fern file explorer on vim start

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * ++nested Fern -stay -keep -toggle -drawer %:h | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" show hidden files
let g:fern#default_hidden=1
