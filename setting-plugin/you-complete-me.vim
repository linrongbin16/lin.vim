set encoding=utf-8

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<TAB>' ]
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>', '<S-TAB>' ]

let g:ycm_global_ycm_extra_conf = '~/.vim/settings/plug/ycm_global_conf.py'

" python3
let g:ycm_server_python_interpreter = 'python3'

" rust
if has("win32")
    let g:ycm_rust_src_path = '%USERPROFILE%\.rustup\toolchains\stable-x86_64-pc-windows-msvc\lib\rustlib\src\rust\src'
elseif has("mac")
    let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
else
    let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
endif

" disable ycm checker
let g:ycm_show_diagnostics_ui = 0
let g:ycm_open_loclist_on_ycm_diags = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

" hotkey
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
