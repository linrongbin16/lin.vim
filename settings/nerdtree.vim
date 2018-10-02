let g:NERDTreeDirArrowExpandable = '|'
let g:NERDTreeDirArrowCollapsible = '+'
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <F8> :NERDTreeToggle<CR>
