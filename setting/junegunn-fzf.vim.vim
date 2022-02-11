" fzf command prefix
let g:fzf_command_prefix = 'Fzf'

" make coc-fzf behavior same with fzf.vim

let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" key mappings
nmap <space> [fzf-p]
xmap <space> [fzf-p]

" 1. text kinds of search

" search text
nnoremap <silent> [fzf-p]gr :FzfRg<CR>
" search lines on opened buffers
nnoremap <silent> [fzf-p]l :FzfLines<CR>
" search text on tags
nnoremap <silent> [fzf-p]t :FzfTags<CR>
" search search history
nnoremap <silent> [fzf-p]sh :FzfHistory/<CR>
" search command history
nnoremap <silent> [fzf-p]ch :FzfHistory:<CR>
" search yank history
nnoremap <silent> [fzf-p]y :CocFzfList yank<CR>

" 2. files kinds of search

" search files
nnoremap <silent> [fzf-p]f :FzfFiles<CR>
nnoremap <silent> <C-p> :FzfFiles<CR>
" search opened buffers
nnoremap <silent> [fzf-p]b :FzfBuffers<CR>
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> [fzf-p]hf :FzfHistory<CR>

" 3. git kinds of search

" search git commits
nnoremap <silent> [fzf-p]gc :FzfCommits<CR>
" search git files
nnoremap <silent> [fzf-p]gf :FzfGFile<CR>
" search git status
nnoremap <silent> [fzf-p]gs :FzfGFiles?<CR>


" 4. other kinds of search

" search marks
nnoremap <silent> [fzf-p]mk :FzfMarks<CR>
" search maps
nnoremap <silent> [fzf-p]mp :FzfMaps<CR>
" search vim commands
nnoremap <silent> [fzf-p]vc :FzfCommands<CR>
" search help tags
nnoremap <silent> [fzf-p]ht :FzfHelptags<CR>


" 5. coc.nvim kinds of search

" search symbols based on coc.nvim
nnoremap <silent> [fzf-p]cs :CocFzfList symbols<CR>
" search diagnostics based on coc.nvim
nnoremap <silent> [fzf-p]cd :CocFzfList diagnostics<CR>
" search symbol outlines based on coc.nvim
nnoremap <silent> [fzf-p]co :CocFzfList outline<CR>
" search commands based on coc.nvim
nnoremap <silent> [fzf-p]cc :CocFzfList commands<CR>
" search location based on coc.nvim
nnoremap <silent> [fzf-p]cl :CocFzfList location<CR>
