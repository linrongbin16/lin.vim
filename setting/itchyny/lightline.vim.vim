" only enable statusline, disable tabline
let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['LightLineFileName' ],
  \             ['LightLineGitStatus', 'LightLineCocStatus'] ],
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
  \   'LightLineGitStatus'        : 'LightLineGitStatus',
  \   'LightLineCocStatus'        : 'LightLineCocStatus',
  \   'LightLineGutentagsStatus'  : 'LightLineGutentagsStatus',
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
  let git_branch = gitbranch#name()
  if empty(git_branch)
    return ''
  endif
  let [added,modified,removed] = GitGutterGetHunkSummary()
  let git_status = []
  if added > 0
      call add(git_status, printf('+%d', added))
  endif
  if modified > 0
      call add(git_status, printf('~%d', modified))
  endif
  if removed > 0
      call add(git_status, printf('-%d', removed))
  endif
  if empty(git_status)
      return printf(' %s', git_branch)
  else
      return printf(' %s %s', git_branch, join(git_status))
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
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
  autocmd User CocStatusChange call lightline#update()
  autocmd User CocDiagnosticChange call lightline#update()
augroup END

