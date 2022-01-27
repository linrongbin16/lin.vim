" use vim-buftabline for buffer
let g:lightline = {
  \ 'active': {
      \ 'left': [ ['mode', 'paste'],
  \               ['readonly', 'filename', 'git_branch', 'current_function', 'coc_status'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \ },
  \ 'component_function': {
  \   'filename'          : 'LightLineFileName',
  \   'git_branch'        : 'LightlineGitBranch',
  \   'current_function'  : 'LightlineFunctionName',
  \   'coc_status'        : 'LightlineCocStatus',
  \ }
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
function! LightlineGitBranch() abort
    let git_status = get(g:, 'coc_git_status', '')
    if empty(git_status)
        return ''
    else
        return printf('%s', git_status)
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
autocmd User CocDiagnosticChange call lightline#update()
