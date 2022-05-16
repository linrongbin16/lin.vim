" fzf command prefix
let g:fzf_command_prefix = 'Fzf'

" make coc-fzf behavior same with fzf.vim
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" key mappings

let VIM_EXPLORER='coc-explorer'

" 1. text kinds of search

" search text
nnoremap <silent> <expr> <space>gr (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfRg<CR>"
" search lines on opened buffers
nnoremap <silent> <expr> <space>l (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfLines<CR>"
" search text on tags
nnoremap <silent> <expr> <space>t (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfTags<CR>"
" search search history
nnoremap <silent> <expr> <space>sh (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHistory/<CR>"
" search command history
nnoremap <silent> <expr> <space>ch (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHistory:<CR>"
" search yank history
nnoremap <silent> <expr> <space>y (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList yank<CR>"

" 2. files kinds of search

" search files
nnoremap <silent> <expr> <space>f (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfFiles<CR>"
nnoremap <silent> <expr> <C-p> (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfFiles<CR>"
" search opened buffers
nnoremap <silent> <expr> <space>b (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfBuffers<CR>"
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> <expr> <space>hf (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHistory<CR>"

" 3. git kinds of search

" search git commits
nnoremap <silent> <expr> <space>gc (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfCommits<CR>"
" search git files
nnoremap <silent> <expr> <space>gf (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfGFile<CR>"
" search git status
nnoremap <silent> <expr> <space>gs (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfGFiles?<CR>"


" 4. other kinds of search

" search marks
nnoremap <silent> <expr> <space>mk (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfMarks<CR>"
" search maps
nnoremap <silent> <expr> <space>mp (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfMaps<CR>"
" search vim commands
nnoremap <silent> <expr> <space>vc (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfCommands<CR>"
" search help tags
nnoremap <silent> <expr> <space>ht (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHelptags<CR>"


" 5. coc.nvim kinds of search

" search symbols based on coc.nvim
nnoremap <silent> <expr> <space>cs (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList symbols<CR>"
" search diagnostics based on coc.nvim
nnoremap <silent> <expr> <space>cd (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList diagnostics<CR>"
" search symbol outlines based on coc.nvim
nnoremap <silent> <expr> <space>co (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList outline<CR>"
" search commands based on coc.nvim
nnoremap <silent> <expr> <space>cc (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList commands<CR>"
" search location based on coc.nvim
nnoremap <silent> <expr> <space>cl (&filetype == VIM_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList location<CR>"
