"" ---- ctrlp ----

set wildignore+=*/tmp/*,*.swp       " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp     " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
