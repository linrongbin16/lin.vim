set tabstop=4 shiftwidth=4 expandtab

" TXT
autocmd FileType txt setlocal set shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead,FileReadPre *.txt :setlocal shiftwidth=4 noexpandtab
