" fzf command prefix
let g:fzf_command_prefix = 'Fzf'

" make coc-fzf behavior same with fzf.vim
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" key mappings

" 1. text kinds of search

" search text
nnoremap <silent> <space>gr :<C-u>FzfRg<CR>
" search lines on opened buffers
nnoremap <silent> <space>l :<C-u>FzfLines<CR>
" search text on tags
nnoremap <silent> <space>t :<C-u>FzfTags<CR>
" search search history
nnoremap <silent> <space>sh :<C-u>FzfHistory/<CR>
" search command history
nnoremap <silent> <space>ch :<C-u>FzfHistory:<CR>
" search yank history
nnoremap <silent> <space>y :<C-u>CocFzfList yank<CR>

" 2. files kinds of search

" search files
nnoremap <silent> <space>f :<C-u>FzfFiles<CR>
nnoremap <silent> <C-p> :<C-u>FzfFiles<CR>
" search opened buffers
nnoremap <silent> <space>b :<C-u>FzfBuffers<CR>
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> <space>hf :<C-u>FzfHistory<CR>

" 3. git kinds of search

" search git commits
nnoremap <silent> <space>gc :<C-u>FzfCommits<CR>
" search git files
nnoremap <silent> <space>gf :<C-u>FzfGFile<CR>
" search git status
nnoremap <silent> <space>gs :<C-u>FzfGFiles?<CR>


" 4. other kinds of search

" search marks
nnoremap <silent> <space>mk :<C-u>FzfMarks<CR>
" search maps
nnoremap <silent> <space>mp :<C-u>FzfMaps<CR>
" search vim commands
nnoremap <silent> <space>vc :<C-u>FzfCommands<CR>
" search help tags
nnoremap <silent> <space>ht :<C-u>FzfHelptags<CR>


" 5. coc.nvim kinds of search

" search symbols based on coc.nvim
nnoremap <silent> <space>cs :<C-u>CocFzfList symbols<CR>
" search diagnostics based on coc.nvim
nnoremap <silent> <space>cd :<C-u>CocFzfList diagnostics<CR>
" search symbol outlines based on coc.nvim
nnoremap <silent> <space>co :<C-u>CocFzfList outline<CR>
" search commands based on coc.nvim
nnoremap <silent> <space>cc :<C-u>CocFzfList commands<CR>
" search location based on coc.nvim
nnoremap <silent> <space>cl :<C-u>CocFzfList location<CR>
