set nocompatible
filetype off
let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'


let g:ale_linters = {
\   'cpp': ['clang', 'clangcheck', 'cppcheck', 'cpplint', 'gcc', 'clang-format'],
\}

" disable python useless warnings
let g:ale_python_flake8_args="--ignore=W801,E501"
let g:ale_python_pylint_options="--init-hook='import sys; sys.path.append(\".\")'"
let g:ale_python_pylint_args="--ignore=C0301"

" set c++11 standard
let g:ale_cpp_clang_options='-std=c++11 -Wall'
let g:ale_cpp_clangcheck_options='-std=c++11 -Wall'
