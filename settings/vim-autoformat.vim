"" ---- vim-autoformat ----

" C/C++
let g:formatdef_clang_format = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=LLVM'"
let g:formatters_c = ['clang_format', 'astyle_c']
let g:formatters_cc = ['clang_format', 'astyle_c']
let g:formatters_cxx = ['clang_format', 'astyle_c']
let g:formatters_cpp = ['clang_format', 'astyle_c']
let g:formatters_h = ['clang_format', 'astyle_c']
let g:formatters_hpp = ['clang_format', 'astyle_c']
let g:formatters_hxx = ['clang_format', 'astyle_c']
let g:formatters_hh = ['clang_format', 'astyle_c']

" Python
let g:formatdef_autopep8 = "'autopep8 --ignore=E402,E501'"
let g:formatters_python = ['autopep8', 'yapf', 'black']

" Sql
let g:formatters_sql = ['sqlformat']
let g:formatters_hql = ['sqlformat']

" format when write file
au BufWrite *.c :Autoformat
au BufWrite *.cc :Autoformat
au BufWrite *.cpp :Autoformat
au BufWrite *.cxx :Autoformat
au BufWrite *.h :Autoformat
au BufWrite *.hpp :Autoformat
au BufWrite *.hxx :Autoformat
au BufWrite *.py :Autoformat
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
au BufWrite *.sql :Autoformat
au BufWrite *.hql :Autoformat
