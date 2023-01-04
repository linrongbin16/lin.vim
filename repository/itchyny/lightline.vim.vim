" Only enable statusline, disable tabline

let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['LinVimLightLineFileName' ],
  \             ['LinVimLightLineGitStatus', 'LinVimLightLineCocStatus', 'LinVimLightLineGutentagsStatus'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'LinVimLightLineFileName'         : 'LinVimLightLineFileName',
  \   'LinVimLightLineGitStatus'        : 'LinVimLightLineGitStatus',
  \   'LinVimLightLineCocStatus'        : 'LinVimLightLineCocStatus',
  \   'LinVimLightLineGutentagsStatus'  : 'LinVimLightLineGutentagsStatus',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 0
  \   }
  \ }


function! LinVimLightLineFileName() abort
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    if &modified
        let filename = filename . '[+]'
    endif
    if &readonly
        let filename = filename . '[-]'
    endif
    return filename
endfunction

" function! LinVimLightLineCurrentFunction() abort
"     let function_name = get(b:, 'coc_current_function', '')
"     if empty(function_name)
"         return ''
"     endif
"     return printf(' %s', function_name)
" endfunction

function! LinVimLightLineCocStatus() abort
    if !exists("*coc#status")
        return ''
    endif

    let coc_status = coc#status()
    if empty(coc_status)
        return ''
    else
        return coc_status
    endif
endfunction

if has('nvim-0.7')
function! LinVimLightLineGitStatus() abort
    """ gitsigns.nvim
    let branch = get(b:,'gitsigns_head','')
    if empty(branch)
        return ''
    endif
    let changes = get(b:,'gitsigns_status','')
    if empty(changes)
        return printf(' %s', branch)
    else
        return printf(' %s %s', branch, changes)
    endif
endfunction
else
function! LinVimLightLineGitStatus() abort
    """ vim-gitbranch + vim-gitgutter
    if !exists("*gitbranch#name")
        return ''
    endif
    let branch = gitbranch#name()
    if empty(branch)
        return ''
    endif
    if !exists("*GitGutterGetHunkSummary")
        return printf(' %s', branch)
    endif
    let [a,m,r] = GitGutterGetHunkSummary()
    let changes = []
    if a > 0
        call add(changes, printf('+%d', a))
    endif
    if m > 0
        call add(changes, printf('~%d', m))
    endif
    if r > 0
        call add(changes, printf('-%d', r))
    endif
    if empty(changes)
        return printf(' %s', branch)
    else
        return printf(' %s %s', branch, join(changes, ' '))
    endif
endfunction
endif

function! LinVimLightLineGutentagsStatus() abort
    if !exists("*gutentags#statusline")
        return ''
    endif
    let tags_status = gutentags#statusline()
    if empty(tags_status)
        return ''
    endif
    return tags_status
endfunction

" update lightline
augroup lin_vim_lightline_group
    autocmd!
    autocmd User GitSignsUpdate call lightline#update()
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
    autocmd User CocStatusChange call lightline#update()
    autocmd User CocDiagnosticChange call lightline#update()
    autocmd User CocGitStatusChange call lightline#update()
augroup END
