" use better character
let g:indentLine_char='│'

" fix quotes error for json,markdown files
let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal conceallevel=0
autocmd Filetype json let g:indentLine_enabled = 0
autocmd FileType markdown setlocal conceallevel=0
autocmd Filetype markdown let g:indentLine_enabled = 0

" disable indentline for coc-explorer
let g:indentLine_fileTypeExclude = ['coc-explorer', 'json', 'markdown']
