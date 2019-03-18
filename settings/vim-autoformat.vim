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
au BufWrite *.c :Autoformat
au BufWrite *.cc :Autoformat
au BufWrite *.cpp :Autoformat
au BufWrite *.cxx :Autoformat
au BufWrite *.h :Autoformat
au BufWrite *.hpp :Autoformat
au BufWrite *.hxx :Autoformat
"au BufWrite *.py :Autoformat
au BufWrite *.js :Autoformat
au BufWrite *.ts :Autoformat
au BufWrite *.go :Autoformat
au BufWrite *.rs :Autoformat
au BufWrite *.json :Autoformat
au BufWrite *.html :Autoformat
au BufWrite *.xml :Autoformat
au BufWrite *.css :Autoformat
au BufWrite *.less :Autoformat
au BufWrite *.sass :Autoformat
au BufWrite *.scss :Autoformat
au BufWrite *.hs :Autoformat
au BufWrite *.rb :Autoformat
au BufWrite *.pl :Autoformat
au BufWrite *.pl6 :Autoformat
au BufWrite *.perl :Autoformat
