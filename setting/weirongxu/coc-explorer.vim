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
      nnoremap <buffer> <D-h> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [-10])<CR>
      nnoremap <buffer> <D-l> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [10])<CR>
      nnoremap <buffer> <A-h> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [-10])<CR>
      nnoremap <buffer> <A-l> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [10])<CR>
      nnoremap <buffer> <D-Left> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [-10])<CR>
      nnoremap <buffer> <D-Right> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [10])<CR>
      nnoremap <buffer> <A-Left> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [-10])<CR>
      nnoremap <buffer> <A-Right> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['adjustSize'], [10])<CR>
  endif

endfunction

augroup CocExplorerCustom
    autocmd!
    autocmd BufEnter * call <SID>coc_explorer_settings()
augroup END

autocmd User CocNvimInit :CocCommand explorer
