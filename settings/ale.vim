"" ---- ale.vim ----

set nocompatible
filetype off
let &runtimepath.=',~/.vim/plugged/ale'
filetype plugin on

let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 1
let g:ale_sign_column_always = 1
let g:ale_echo_delay = 20
let g:ale_lint_delay = 100
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
            \   'cpp': ['clang', 'cpplint', 'gcc', 'clang-format'],
            \   'python': ['flake8', 'pylint'],
            \}

" disable python useless warnings
let g:ale_python_flake8_args="--ignore=W801,E501"
let g:ale_python_pylint_options="--init-hook='import sys; sys.path.append(\".\")'; sys.path.append(\"..\")'"
let g:ale_python_pylint_args="--ignore=C0301"

" C/C++
" clang/clang++
let g:ale_c_clang_options='-std=c99 -O2 -Wall'
let g:ale_c_clangcheck_options = ''
let g:ale_cpp_clang_options='-std=c++14 -O2 -Wall'
let g:ale_cpp_clangcheck_options=''
" gcc/g++
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_cpp_cppcheck_options = ''
