"" ---- vimfiler.vim ----

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
    else
        let g:vimfiler_opened_flag=0
    endif
endfunction

nmap <F8> :VimFilerExplorer<cr>:call AdjustVimFilerWidth()<cr>
nmap <Leader>vf :VimFilerExplorer<cr>:call AdjustVimFilerWidth()<cr>


augroup syntax_autocmd
  autocmd!
  "toggle quickfix window
  autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>|map <buffer> <c-p> <up>|map <buffer> <c-n> <down>
  autocmd FileType unite call s:unite_settings()
  " obliterate unite buffers (marks especially).
  autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif
  " Jump to the last position when reopening a file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
