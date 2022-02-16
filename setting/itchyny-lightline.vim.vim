" only enable statusline, disable tabline
let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['readonly', 'filename', 'modified'],
  \             ['LightLineGitStatus', 'LightLineCurrentFunction', 'LightLineCocStatus'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'LightLineGitStatus'          : 'LightLineGitStatus',
  \   'LightLineCurrentFunction'    : 'LightLineCurrentFunction',
  \   'LightLineCocStatus'          : 'LightLineCocStatus',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 0
  \   }
  \ }

" integrate statusline with coc.nvim
function! LightLineCocStatus() abort
  let coc_status = coc#status()
  if empty(coc_status)
    return ''
  else
    return coc_status
  endif
endfunction

" integrate statusline with git
function! LightLineGitStatus() abort
    let git_branch = get(g:, 'coc_git_status', '')
    if empty(git_branch)
      return ''
    endif
    let git_current_buffer_changes = get(b:, 'coc_git_status', '')
    if empty(git_current_buffer_changes)
      return git_branch
    else
      return git_branch . git_current_buffer_changes
    endif
endfunction

" integrate vista nearest method/function
function! LightLineCurrentFunction() abort
    let function_name = get(b:,'coc_current_function','')
    if empty(function_name)
        return ''
    else
        return function_name
    endif
endfunction

" update coc status when it's changed
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
