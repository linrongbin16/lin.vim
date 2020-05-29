set nocompatible
filetype off
let &runtimepath.=',~/.vim/plugged/ale'
filetype plugin on

let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 1
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 500

let g:ale_linters = {
            \   'c': ['cpplint', 'clangd'],
            \   'cpp': ['cpplint', 'clangd'],
            \   'python': ['flake8', 'pylint'],
            \}

" C/C++
let g:ale_c_clang_options='-std=c11 -Wall'
let g:ale_cpp_clang_options='-std=c++14 -O2 -Wall'
