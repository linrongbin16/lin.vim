" only enable statusline, disable tabline
let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['ll_filename' ],
  \             ['ll_git_status', 'll_coc_status', 'll_gutentags_status'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'll_filename'         : 'll_filename',
  \   'll_git_status'       : 'll_git_status',
  \   'll_coc_status'       : 'll_coc_status',
  \   'll_gutentags_status' : 'll_gutentags_status',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 0
  \   }
  \ }


function! ll_filename() abort
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  if &modified
    let filename = filename . '[+]'
  endif
  if &readonly
    let filename = filename . '[-]'
  endif
  return filename
endfunction

function! ll_current_function_name() abort
  let function_name = get(b:, 'coc_current_function', '')
  if empty(function_name)
    return ''
  endif
  return printf(' %s', function_name)
endfunction

function! ll_coc_status() abort
  let coc_status = coc#status()
  if empty(coc_status)
    return ''
  else
    return coc_status
  endif
endfunction

function! ll_git_status() abort
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

function! ll_gutentags_status() abort
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
augroup END
