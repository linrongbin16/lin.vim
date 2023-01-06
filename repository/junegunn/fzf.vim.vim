""" Use fd for fzf file finding, instead of default find
let $FZF_DEFAULT_COMMAND = 'fd --type f --type symlink --color=never --ignore-case --no-ignore-parent --hidden --exclude ".git"'

""" Fzf command prefix
let g:fzf_command_prefix = 'Fzf'

""" Text search

command! -bang -nargs=* LinVimFzfRg
            \ call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case --no-ignore-global --no-ignore-parent --hidden --glob=!.git/ -- ".shellescape(<q-args>), 1,
            \ fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=0 LinVimFzfRgCWord
            \ call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case --no-ignore-global --no-ignore-parent --hidden --glob=!.git/ ".shellescape(expand('<cword>')), 1,
            \ fzf#vim#with_preview(), <bang>0)

function! s:LinVimDefineFzfKeys(k, v) abort
    execute printf('nnoremap <silent> <expr> %s (&filetype ==# "NvimTree" <Bar><Bar> &filetype ==# "fern" ? "\<C-w>\<C-w>" : "").":\<C-u>%s\<CR>"', a:k, a:v)
endfunction

" search text

" search text
call s:LinVimDefineFzfKeys('<space>gr', 'LinVimFzfRg')
" search word under cursor
call s:LinVimDefineFzfKeys('<space>gw', 'LinVimFzfRgCWord')
" search lines on opened buffers
call s:LinVimDefineFzfKeys('<space>l', 'FzfLines')
" search text on tags
call s:LinVimDefineFzfKeys('<space>t', 'FzfTags')
" search searched history
call s:LinVimDefineFzfKeys('<space>sh', 'FzfHistory/')
" search command history
call s:LinVimDefineFzfKeys('<space>ch', 'FzfHistory:')
" search yank history
call s:LinVimDefineFzfKeys('<space>y', 'CocFzfList yank')

" search files

" search files
call s:LinVimDefineFzfKeys('<space>f', 'FzfFiles')
call s:LinVimDefineFzfKeys('<C-p>', 'FzfFiles')
" search opened buffers
call s:LinVimDefineFzfKeys('<space>b', 'FzfBuffers')
" search history files(v:oldfiles) and opened buffers
call s:LinVimDefineFzfKeys('<space>hf', 'FzfHistory')

" search git

" search git commits
call s:LinVimDefineFzfKeys('<space>gc', 'FzfCommits')
" search git files
call s:LinVimDefineFzfKeys('<space>gf', 'FzfGFile')
" search git status
call s:LinVimDefineFzfKeys('<space>gs', 'FzfGFiles?')

" other search

" search marks
call s:LinVimDefineFzfKeys('<space>mk', 'FzfMarks')
" search maps
call s:LinVimDefineFzfKeys('<space>mp', 'FzfMaps')
" search vim commands
call s:LinVimDefineFzfKeys('<space>vc', 'FzfCommands')
" search help tags
call s:LinVimDefineFzfKeys('<space>ht', 'FzfHelptags')
