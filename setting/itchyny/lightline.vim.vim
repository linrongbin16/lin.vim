" only enable statusline, disable tabline
let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['LightLineFileName' ],
  \             ['LightLineGitStatus', 'LightLineCocStatus', 'LightLineGutentagsStatus'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'LightLineFileName'         : 'LightLineFileName',
  \   'LightLineGitStatus'       : 'LightLineGitStatus',
  \   'LightLineCocStatus'       : 'LightLineCocStatus',
  \   'LightLineGutentagsStatus' : 'LightLineGutentagsStatus',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 0
  \   }
  \ }


function! LightLineFileName() abort
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    if &modified
        let filename = filename . '[+]'
    endif
    if &readonly
        let filename = filename . '[-]'
    endif
    return filename
endfunction

function! LightLineCurrentFunction() abort
    let function_name = get(b:, 'coc_current_function', '')
    if empty(function_name)
        return ''
    endif
    return printf(' %s', function_name)
endfunction

function! LightLineCocStatus() abort
    let coc_status = coc#status()
    if empty(coc_status)
        return ''
    else
        return coc_status
    endif
endfunction

function! LightLineGitStatus() abort
    let branch = gitbranch#name()
    if empty(branch)
        return ''
    endif
    let [a,m,r] = GitGutterGetHunkSummary()
    let changes = []
    if a > 0
        call add(changes, printf('+%d', a))
    endif
    if m > 0
      call add(changes, printf('~%d', m))
    endif
    if r > 0
      call add(changes, printf('-%d', r))
    endif
    if empty(changes)
        return printf(' %s', branch)
    else
        return printf(' %s %s', branch, join(changes))
    endif
endfunction

function! LightLineGutentagsStatus() abort
    let tags_status = gutentags#statusline()
    if empty(tags_status)
        return ''
    endif
    return tags_status
endfunction

" update lightline
augroup lightline_refresh_group
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
    autocmd User CocStatusChange call lightline#update()
    autocmd User CocDiagnosticChange call lightline#update()
    autocmd User CocGitStatusChange call lightline#update()
augroup END
