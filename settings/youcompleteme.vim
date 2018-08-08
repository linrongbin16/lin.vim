"" ---- youcompleteme.vim ----

" disable ycm in some file type
let g:ycm_filetype_blacklist = {
\  'tagbar' : 1,
\  'nerdtree' : 1,
\}
let g:ycm_path_to_python_interpreter='python'
let g:ycm_python_binary_path='python'
let g:ycm_global_ycm_extra_conf = '~/.vim/settings/.ycm_global_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
" key mappings
nnoremap<F10> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion=['<c-n>', '<Down>', '<TAB>' ]
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>' ]
" diagnose
let g:ycm_show_diagnostics_ui=0
let g:ycm_register_as_syntastic_checker=0
