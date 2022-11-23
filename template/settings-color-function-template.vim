function! s:randnum(n) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:n
endfunction

function NextRandomColorScheme()
    if len(s:lin_vim_colorschemes) > 0
        let idx = s:randnum(len(s:lin_vim_colorschemes))
        execute 'colorscheme ' . s:lin_vim_colorschemes[idx]
    endif
endfunction

function NextRandomColorSchemeSync()
    if len(s:lin_vim_colorschemes) > 0
        let idx = s:randnum(len(s:lin_vim_colorschemes))
        execute 'colorscheme ' . s:lin_vim_colorschemes[idx]
        execute 'syntax sync fromstart'
    endif
endfunction

