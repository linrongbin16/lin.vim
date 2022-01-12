" use vim-buftabline for buffer
let g:lightline = {
  \ 'active': {
      \ 'left': [ ['mode', 'paste'],
  \               ['readonly', 'filename', 'coc_status'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \ },
  \ 'component_function': {
  \   'filename'          : 'LightLineFileName',
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

autocmd User CocDiagnosticChange call lightline#update()
