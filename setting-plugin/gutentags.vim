set tags=./tags,tags;
let g:gutentags_project_root = ['.svn', '.git', '.hg']

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
