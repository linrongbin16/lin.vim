" clap's colorscheme
let g:clap_theme = 'material_design_dark'

" key mappings

" 1. text kinds of search

" search text
nnoremap <silent> <space>gr :<C-u>Clap grep2<CR>
" search lines on opened buffers
nnoremap <silent> <space>l :<C-u>Clap lines<CR>
" search text on tags
nnoremap <silent> <space>t :<C-u>Clap tags<CR>
" search search history
nnoremap <silent> <space>sh :<C-u>Clap search_history<CR>
" search vim command history
nnoremap <silent> <space>ch :<C-u>Clap command_history<CR>
" search symbol dummy jumps
nnoremap <silent> <space>j :<C-u>Clap dumb_jump<CR>
" search yank history
nnoremap <silent> <space>y :<C-u>Clap yanks<CR>

" 2. files kinds of search

" search files
nnoremap <silent> <space>f :<C-u>Clap files<CR>
nnoremap <silent> <C-p> :<C-u>Clap files<CR>
" search files order by most recently used
nnoremap <silent> <space>r :<C-u>Clap recent_files<CR>
" search opened buffers
nnoremap <silent> <space>b :<C-u>Clap buffers<CR>
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> <space>hf :<C-u>Clap history<CR>

" 3. git kinds of search

" search git commits
nnoremap <silent> <space>gc :<C-u>Clap commits<CR>
" search git files
nnoremap <silent> <space>gf :<C-u>Clap gfiles<CR>
" search git diff files (git status)
nnoremap <silent> <space>gs :<C-u>Clap git_diff_files<CR>
nnoremap <silent> <space>gd :<C-u>Clap git_diff_files<CR>


" 4. other kinds of search

" search marks
nnoremap <silent> <space>mk :<C-u>Clap marks<CR>
" search maps
nnoremap <silent> <space>mp :<C-u>Clap maps<CR>
" search vim commands
nnoremap <silent> <space>vc :<C-u>Clap command<CR>
" search help tags
nnoremap <silent> <space>ht :<C-u>Clap help_tags<CR>
" search lvy-like file explorer
nnoremap <silent> <space>e :<C-u>Clap filer<CR>


" 5. coc.nvim kinds of search
" search symbols based on coc.nvim language server
nnoremap <silent> <space>cs :<C-u>Clap coc_symbols<CR>
" search diagnostics based on coc.nvim language server
nnoremap <silent> <space>cd :<C-u>Clap coc_diagnostics<CR>
" search symbol outlines based on coc.nvim language server
nnoremap <silent> <space>co :<C-u>Clap coc_outline<CR>
" search commands based on coc.nvim
nnoremap <silent> <space>cc :<C-u>Clap coc_commands<CR>
" search location based on coc.nvim
nnoremap <silent> <space>cl :<C-u>Clap coc_location<CR>
