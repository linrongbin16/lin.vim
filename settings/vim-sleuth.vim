set tabstop=4 shiftwidth=4 expandtab

" TXT
autocmd FileType txt setlocal set shiftwidth=4 noexpandtab
autocmd BufNewFile,BufRead,FileReadPre *.txt :setlocal shiftwidth=4 noexpandtab

" CPP
autocmd FileType cpp,c,cc,cxx setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead,FileReadPre *.cpp,*.c,*.cc,*.cxx :setlocal tabstop=2 shiftwidth=2 expandtab
