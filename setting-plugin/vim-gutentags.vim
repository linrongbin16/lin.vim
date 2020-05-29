let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", ".svn", ".hg", "node_modules", "*.vim/plugged/*"]

" ctags config
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q', '--output-format=e-ctags']
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" create ~/.cache/tags if not exist
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

set tags=./.tags;,.tags
set statusline+=%{gutentags#statusline()}
