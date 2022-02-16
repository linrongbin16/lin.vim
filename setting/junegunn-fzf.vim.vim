" fzf command prefix
let g:fzf_command_prefix = 'Fzf'

" make coc-fzf behavior same with fzf.vim

let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" key mappings

" 1. text kinds of search

" search text
nnoremap <silent> <space>gr :FzfRg<CR>
" search lines on opened buffers
nnoremap <silent> <space>l :FzfLines<CR>
" search text on tags
nnoremap <silent> <space>t :FzfTags<CR>
" search search history
nnoremap <silent> <space>sh :FzfHistory/<CR>
" search command history
nnoremap <silent> <space>ch :FzfHistory:<CR>
" search yank history
nnoremap <silent> <space>y :CocFzfList yank<CR>

" 2. files kinds of search

" search files
nnoremap <silent> <space>f :FzfFiles<CR>
nnoremap <silent> <C-p> :FzfFiles<CR>
" search opened buffers
nnoremap <silent> <space>b :FzfBuffers<CR>
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> <space>hf :FzfHistory<CR>

" 3. git kinds of search

" search git commits
nnoremap <silent> <space>gc :FzfCommits<CR>
" search git files
nnoremap <silent> <space>gf :FzfGFile<CR>
" search git status
nnoremap <silent> <space>gs :FzfGFiles?<CR>


" 4. other kinds of search

" search marks
nnoremap <silent> <space>mk :FzfMarks<CR>
" search maps
nnoremap <silent> <space>mp :FzfMaps<CR>
" search vim commands
nnoremap <silent> <space>vc :FzfCommands<CR>
" search help tags
nnoremap <silent> <space>ht :FzfHelptags<CR>


" 5. coc.nvim kinds of search

" search symbols based on coc.nvim
nnoremap <silent> <space>cs :CocFzfList symbols<CR>
" search diagnostics based on coc.nvim
nnoremap <silent> <space>cd :CocFzfList diagnostics<CR>
" search symbol outlines based on coc.nvim
nnoremap <silent> <space>co :CocFzfList outline<CR>
" search commands based on coc.nvim
nnoremap <silent> <space>cc :CocFzfList commands<CR>
" search location based on coc.nvim
nnoremap <silent> <space>cl :CocFzfList location<CR>
