set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" TXT
autocmd FileType txt setlocal set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab nosmarttab
autocmd BufNewFile,BufRead,FileReadPre *.txt :setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab nosmarttab
