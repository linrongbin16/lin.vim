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
      nnoremap <silent> <buffer> <D-,> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['-10x-10']}])<CR>
      nnoremap <silent> <buffer> <D-.> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['10x10']}])<CR>
      nnoremap <silent> <buffer> <A-,> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['-10x-10']}])<CR>
      nnoremap <silent> <buffer> <A-.> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['10x10']}])<CR>
      nnoremap <silent> <buffer> <D-Left> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['-10x-10']}])<CR>
      nnoremap <silent> <buffer> <D-Right> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['10x10']}])<CR>
      nnoremap <silent> <buffer> <A-Left> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['-10x-10']}])<CR>
      nnoremap <silent> <buffer> <A-Right> :call CocActionAsync('runCommand', 'explorer.doAction', 'closest', [{'name': 'adjustSize', 'args': ['10x10']}])<CR>
  endif

endfunction

augroup CocExplorerCustom
    autocmd!
    autocmd BufEnter * call <SID>coc_explorer_settings()
augroup END

autocmd User CocNvimInit :CocCommand explorer
