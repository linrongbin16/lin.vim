" clap's colorscheme
let g:clap_theme = 'material_design_dark'

" key mappings

" 1. text kinds of search

" search text
nnoremap <silent> <space>gr :Clap grep2<CR>
" search lines on opened buffers
nnoremap <silent> <space>l :Clap lines<CR>
" search text on tags
nnoremap <silent> <space>t :Clap tags<CR>
" search search history
nnoremap <silent> <space>sh :Clap search_history<CR>
" search vim command history
nnoremap <silent> <space>ch :Clap command_history<CR>
" search symbol dummy jumps
nnoremap <silent> <space>j :Clap dumb_jump<CR>
" search yank history
nnoremap <silent> <space>y :Clap yanks<CR>

" 2. files kinds of search

" search files
nnoremap <silent> <space>f :Clap files<CR>
nnoremap <silent> <C-p> :Clap files<CR>
" search files order by most recently used
nnoremap <silent> <space>r :Clap recent_files<CR>
" search opened buffers
nnoremap <silent> <space>b :Clap buffers<CR>
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> <space>hf :Clap history<CR>

" 3. git kinds of search

" search git commits
nnoremap <silent> <space>gc :Clap commits<CR>
" search git files
nnoremap <silent> <space>gf :Clap gfiles<CR>
" search git diff files (git status)
nnoremap <silent> <space>gs :Clap git_diff_files<CR>
nnoremap <silent> <space>gd :Clap git_diff_files<CR>


" 4. other kinds of search

" search marks
nnoremap <silent> <space>mk :Clap marks<CR>
" search maps
nnoremap <silent> <space>mp :Clap maps<CR>
" search vim commands
nnoremap <silent> <space>vc :Clap command<CR>
" search help tags
nnoremap <silent> <space>ht :Clap help_tags<CR>
" search lvy-like file explorer
nnoremap <silent> <space>e :Clap filer<CR>


" 5. coc.nvim kinds of search
" search symbols based on coc.nvim language server
nnoremap <silent> <space>cs :Clap coc_symbols<CR>
" search diagnostics based on coc.nvim language server
nnoremap <silent> <space>cd :Clap coc_diagnostics<CR>
" search symbol outlines based on coc.nvim language server
nnoremap <silent> <space>co :Clap coc_outline<CR>
" search commands based on coc.nvim
nnoremap <silent> <space>cc :Clap coc_commands<CR>
" search location based on coc.nvim
nnoremap <silent> <space>cl :Clap coc_location<CR>
