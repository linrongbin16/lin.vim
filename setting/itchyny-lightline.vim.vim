" use vim-buftabline for buffer
let g:lightline = {
  \ 'active': {
      \ 'left': [ ['mode', 'paste'], 
  \               ['readonly', 'filename', 'modified', 'coc_status'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \ },
  \ 'component_function': {
  \   'coc_status'        : 'LightlineCocStatus',
  \ }
  \ }

" integrate statusline with coc.nvim
function! LightlineCocStatus() abort
  return printf('coc.nvim: %s %s', coc#status(), get(b:,'coc_current_function',''))
endfunction

autocmd User CocDiagnosticChange call lightline#update()
