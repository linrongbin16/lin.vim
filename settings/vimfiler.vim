" ---- vimfiler ----
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '^\.svn$', '^\.pyc$']
let g:vimfiler_safe_mode_by_default= 0
let g:vimfiler_tree_indentation = 2
call vimfiler#custom#profile('default', 'context', {
            \  'split': 1,
            \  'explorer': 1,
            \  'columns': 50,
            \  'explorer-columns': 50,
            \  'direction': 'topleft',
            \  'auto_expand': 1,
            \  'no_quit': 1,
            \  'force_hide': 0,
            \  'toggle': 1,
            \  'parent': 1,
            \ })

let g:vimfiler_opened_flag = 0
function AdjustVimFilerWidth()
    let tagbar_opened_flag = bufwinnr('__Tagbar__') != -1
    if g:vimfiler_opened_flag == 0
        let g:vimfiler_opened_flag=1
        " columns with vimfiler can be 130/160
        "if has("gui_running")
            "set columns=160
        "endif
    else
        let g:vimfiler_opened_flag=0
        " columns with vimfiler can be 90/120
        "if has("gui_running")
            "set columns=120
        "endif
    endif
endfunction

nmap <F8> :VimFilerExplorer<cr>:call AdjustVimFilerWidth()<cr>
nmap <Leader>vf :VimFilerExplorer<cr>:call AdjustVimFilerWidth()<cr>
