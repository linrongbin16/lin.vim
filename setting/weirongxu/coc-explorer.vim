" function! s:explorer_cur_dir()
"   let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
"   return fnamemodify(node_info['fullpath'], ':h')
" endfunction
"
" function! s:exec_cur_dir(cmd)
"   let dir = s:explorer_cur_dir()
"   execute 'cd ' . dir
"   execute a:cmd
" endfunction

function! s:coc_explorer_settings()
  if &filetype == 'coc-explorer'
      " statusline
      setl statusline=coc-explorer

      " resize explorer width
      " nnoremap <buffer> <D-,> :CocCommand explorer<CR> :CocCommand explorer --width=40<CR>
      " nnoremap <buffer> <D-.> :CocCommand explorer<CR> :CocCommand explorer --width=80<CR>
      " nnoremap <buffer> <A-,> :CocCommand explorer<CR> :CocCommand explorer --width=40<CR>
      " nnoremap <buffer> <A-.> :CocCommand explorer<CR> CocCommand explorer --width=80<CR>
      " nnoremap <buffer> <D-Left> :CocCommand explorer<CR> :CocCommand explorer --width=40<CR>
      " nnoremap <buffer> <D-Right> :CocCommand explorer<CR> :CocCommand explorer --width=80<CR>
      " nnoremap <buffer> <A-Left> :CocCommand explorer<CR> :CocCommand explorer --width=40<CR>
      " nnoremap <buffer> <A-Right> :CocCommand explorer<CR> :CocCommand explorer --width=80<CR>
  endif

endfunction

augroup CocExplorerCustom
    autocmd!
    autocmd BufEnter * call <SID>coc_explorer_settings()
augroup END

autocmd User CocNvimInit :CocCommand explorer
