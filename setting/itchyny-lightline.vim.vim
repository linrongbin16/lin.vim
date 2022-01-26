" use vim-buftabline for buffer
let g:lightline = {
  \ 'active': {
      \ 'left': [ ['mode', 'paste'],
  \               ['readonly', 'filename', 'git_branch', 'function_name', 'coc_status'] ],
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
  \   'function_name'     : 'LightlineFunctionName',
  \   'coc_status'        : 'LightlineCocStatus',
  \ }
  \ }

function! LightLineFileName() abort
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' [*]' : ''
  return filename . modified
endfunction

" integrate statusline with coc.nvim
function! LightlineCocStatus() abort
  let coc_status = coc#status()
  let coc_function = get(b:,'coc_current_function','')
  if empty(coc_status) && coc_function == 0
    return ''
  else
    return printf('coc %s %s', coc_status, coc_function)
  endif
endfunction

" integrate statusline with git
function! LightlineGitBranch() abort
    let branch = gitbranch#name()
    if empty(branch)
        return ''
    else
        return printf('%s', branch)
    endif
endfunction

" integrate vista nearest method/function
function! LightlineFunctionName() abort
    let function_name = get(b:, 'vista_nearest_method_or_function', '')
    if empty(function_name)
        return ''
    else
        return printf('%s', function_name)
    endif
endfunction

" update coc status when it's changed
autocmd User CocDiagnosticChange call lightline#update()
