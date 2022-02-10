" clap's colorscheme
let g:clap_theme = 'material_design_dark'

" key mappings
nmap <space> [fzf-p]
xmap <space> [fzf-p]

" 1. text kinds of search

" search text
nnoremap <silent> [fzf-p]gr :Clap grep2<CR>
" search lines on opened buffers
nnoremap <silent> [fzf-p]l :Clap lines<CR>
" search text on tags
nnoremap <silent> [fzf-p]t :Clap tags<CR>
" search symbol dummy jumps
nnoremap <silent> [fzf-p]j :Clap dumb_jump<CR>
" search symbols based on coc.nvim language server
nnoremap <silent> [fzf-p]s :Clap coc_symbols<CR>
" search diagnostics based on coc.nvim language server
nnoremap <silent> [fzf-p]d :Clap coc_diagnostics<CR>
" search symbol outlines based on coc.nvim language server
nnoremap <silent> [fzf-p]o :Clap coc_outline<CR>
" search search history
nnoremap <silent> [fzf-p]h :Clap search_history<CR>
" search yank history
nnoremap <silent> [fzf-p]y :Clap yanks<CR>

" 2. files kinds of search

" search files
nnoremap <silent> [fzf-p]f :Clap files<CR>
nnoremap <silent> <C-p> :Clap files<CR>
" search files order by most recently used
nnoremap <silent> [fzf-p]r :Clap recent_files<CR>
" search opened buffers
nnoremap <silent> [fzf-p]b :Clap buffers<CR>

" 3. git kinds of search

" search git commits
nnoremap <silent> [fzf-p]gc :Clap commits<CR>
" search git files
nnoremap <silent> [fzf-p]gf :Clap gfiles<CR>
" search git diff files (git status)
nnoremap <silent> [fzf-p]gd :Clap git_diff_files<CR>


" 4. other kinds of search

" search lvy-like file explorer
nnoremap <silent> [fzf-p]e :Clap filer<CR>
" search marks
nnoremap <silent> [fzf-p]mk :Clap marks<CR>
" search maps
nnoremap <silent> [fzf-p]mp :Clap maps<CR>
