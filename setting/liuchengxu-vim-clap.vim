" clap's colorscheme
let g:clap_theme = 'material_design_dark'

" key mappings
nmap <space> [clap-p]
xmap <space> [clap-p]

" 1. text kinds of search

" search text
nnoremap <silent> [clap-p]gr :Clap grep2<CR>
" search lines on opened buffers
nnoremap <silent> [clap-p]l :Clap lines<CR>
" search text on tags
nnoremap <silent> [clap-p]t :Clap tags<CR>
" search search history
nnoremap <silent> [clap-p]sh :Clap search_history<CR>
" search vim command history
nnoremap <silent> [clap-p]ch :Clap command_history<CR>
" search symbol dummy jumps
nnoremap <silent> [clap-p]j :Clap dumb_jump<CR>
" search yank history
nnoremap <silent> [clap-p]y :Clap yanks<CR>

" 2. files kinds of search

" search files
nnoremap <silent> [clap-p]f :Clap files<CR>
nnoremap <silent> <C-p> :Clap files<CR>
" search files order by most recently used
nnoremap <silent> [clap-p]r :Clap recent_files<CR>
" search opened buffers
nnoremap <silent> [clap-p]b :Clap buffers<CR>
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> [clap-p]hf :Clap history<CR>

" 3. git kinds of search

" search git commits
nnoremap <silent> [clap-p]gc :Clap commits<CR>
" search git files
nnoremap <silent> [clap-p]gf :Clap gfiles<CR>
" search git diff files (git status)
nnoremap <silent> [clap-p]gs :Clap git_diff_files<CR>
nnoremap <silent> [clap-p]gd :Clap git_diff_files<CR>


" 4. other kinds of search

" search marks
nnoremap <silent> [clap-p]mk :Clap marks<CR>
" search maps
nnoremap <silent> [clap-p]mp :Clap maps<CR>
" search vim commands
nnoremap <silent> [clap-p]vc :Clap command<CR>
" search help tags
nnoremap <silent> [clap-p]ht :Clap help_tags<CR>
" search lvy-like file explorer
nnoremap <silent> [clap-p]e :Clap filer<CR>


" 5. coc.nvim kinds of search
" search symbols based on coc.nvim language server
nnoremap <silent> [clap-p]cs :Clap coc_symbols<CR>
" search diagnostics based on coc.nvim language server
nnoremap <silent> [clap-p]cd :Clap coc_diagnostics<CR>
" search symbol outlines based on coc.nvim language server
nnoremap <silent> [clap-p]co :Clap coc_outline<CR>
" search commands based on coc.nvim
nnoremap <silent> [clap-p]cc :Clap coc_commands<CR>
" search location based on coc.nvim
nnoremap <silent> [clap-p]cl :Clap coc_location<CR>
