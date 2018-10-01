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

" enable for certain file types
au BufWrite *.c,*.cpp,*.cxx,*.cc,*.h,*.hh,*.hpp,*.hxx,*.java,*.py,*.html,*.json,*.css,*.xml,*.vim,*.go,*.scala,*.kt,*.perl,*.php,*.ruby,*.rb,*.rs,*.sh,*.cmd,*.bat,*.sql,*.go :Autoformat
