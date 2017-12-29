set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" C++
autocmd FileType cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType c++ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType c setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType cxx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType h setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType hpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType hh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType cc setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.cpp :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.c++ :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.c :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.cxx :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.h :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.hpp :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.hh :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufNewFile,BufRead,FileReadPre *.cc :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" TXT
autocmd FileType txt setlocal set tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead,FileReadPre *.txt :setlocal tabstop=4 softtabstop=4 shiftwidth=4
