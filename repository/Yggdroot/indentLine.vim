" Better icon
let g:indentLine_char='│'
" let g:indentLine_char_list = ['│', '|', '¦', '┆', '┊']

let g:indentLine_showFirstIndentLevel=1

" Fix quotes error for json,markdown files
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" Disable indentline for some filetypes
let g:indentLine_fileTypeExclude = ['markdown', 'fern', 'NvimTree']
