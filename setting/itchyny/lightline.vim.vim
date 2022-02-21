" only enable statusline, disable tabline
let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['LightLineFileName'],
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
  \   'LightLineFileName'   : 'LightLineFileName',
  \   'LightLineGitStatus'  : 'LightLineGitStatus',
  \   'LightLineCocStatus'  : 'LightLineCocStatus',
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
  let git_branch = gitbranch#name()
  if empty(git_branch)
    return ''
  endif
  let [a,m,r] = GitGutterGetHunkSummary()
  if a == 0 && m == 0 && r == 0
    return printf(' %s', git_branch)
  endif
  let msgs = []
  if a != 0
    call add(msgs, printf('+%d', a))
  endif
  if m != 0
    call add(msgs, printf('~%d', m))
  endif
  if r != 0
    call add(msgs, printf('-%d', r))
  endif
  return printf(' %s %s', git_branch, join(msgs, ' '))
endfunction

" update lightline when gitgutter and coc's status are changed
autocmd User GitGutter,GitGutterStage,CocStatusChange,CocDiagnosticChange call lightline#update()
