" use vim-buftabline or vim-buffet for tabline
" only enable statusline
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
  let coc_info = get(b:, 'coc_diagnostic_info', {})
  if empty(coc_status) && empty(coc_info)
    return ''
  endif

  let msgs = []
  call add(msgs, coc_status)
  if get(coc_info, 'error', 0)
    call add(msgs, 'E' . coc_info['error'])
  endif
  if get(coc_info, 'warning', 0)
    call add(msgs, 'W' . coc_info['warning'])
  endif
  if empty(msgs)
      return ''
  else
      return join(msgs, ' ')
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
      return printf('%s', git_branch)
    else
      return printf('%s%s', git_branch, git_current_buffer_changes)
    endif
endfunction

" integrate vista nearest method/function
function! LightLineCurrentFunction() abort
    let function_name = get(b:,'coc_current_function','')
    if empty(function_name)
        return ''
    else
        return printf('%s', function_name)
    endif
endfunction

" update coc status when it's changed
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
