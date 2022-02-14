" use vim-buftabline or vim-buffet for tabline
" only enable statusline
let g:lightline = {
  \ 'active': {
      \ 'left': [ ['mode', 'paste'],
  \               ['readonly', 'filename', 'git_status', 'current_function', 'coc_status'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \   'lineinfo': ' %4l:%-3v',
  \ },
  \ 'component_function': {
  \   'filename'          : 'LightLineFileName',
  \   'git_status'        : 'LightlineGitStatus',
  \   'current_function'  : 'LightlineFunctionName',
  \   'coc_status'        : 'LightlineCocStatus',
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
  let modified = &modified ? '*' : ''
  return filename . modified
endfunction

" integrate statusline with coc.nvim
function! LightlineCocStatus() abort
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
function! LightlineGitStatus() abort
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
function! LightlineFunctionName() abort
    let function_name = get(b:,'coc_current_function','')
    if empty(function_name)
        return ''
    else
        return printf('%s', function_name)
    endif
endfunction

" update coc status when it's changed
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
