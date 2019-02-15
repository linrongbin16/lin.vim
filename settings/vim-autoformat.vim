"" ---- vim-autoformat ----

let g:formatdef_clangformat = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=LLVM'"
let g:formatters_c = ['clangformat', 'astyle_c']
let g:formatters_cc = ['clangformat', 'astyle_c']
let g:formatters_cxx = ['clangformat', 'astyle_c']
let g:formatters_cpp = ['clangformat', 'astyle_c']
let g:formatters_h = ['clangformat', 'astyle_c']
let g:formatters_hpp = ['clangformat', 'astyle_c']
let g:formatters_hxx = ['clangformat', 'astyle_c']
let g:formatters_hh = ['clangformat', 'astyle_c']

" format when write file
au BufWrite *.c, *.cc, *.cxx, *.h, *.hh, *.hpp, *.hxx, *.py, *.lua, *.vim, *.vimrc, *.sh, *.bat, *.cmd, *.json, *.js, *.html, *.xml, *.css, *.ts, *.rs, *.go, *.pl, *.perl, *.sql :Autoformat
