"" ---- indentline.vim ----

" disable indentline with json since conceal option will make json string ugly
"autocmd FileType json let g:indentLine_setConceal = 0

let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal conceallevel=0
