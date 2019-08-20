" indent C/C++
autocmd FileType c,cpp,cc,cxx,h,hh,hpp,hxx setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab smarttab

" conceal level
autocmd FileType json setlocal conceallevel=0

" filetype mapping
autocmd BufRead,BufNewFile *.hql set filetype=sql
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.hs set filetype=haskell

