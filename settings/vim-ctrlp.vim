"" ---- ctrlp ----

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

let g:ctrlp_show_hidden = 1

" ignore file pattern
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*
set wildignore+=*\\tmp\\*,*.so,*.swp,*.zip,*\\.tmp\\*,*\\.sass-cache\\*,*\\node_modules\\*,*.keep,*.DS_Store,*\\.git\\*
