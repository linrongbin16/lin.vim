" python
" let g:neoformat_python_yapf = {
"             \ 'exe': 'yapf',
"             \ 'args': ['--style={ based_on_style: pep8, column_limit: 120 }']
"             \ }
let g:neoformat_enabled_python=['yapf']

" c/c++
let g:neoformat_enabled_c=['clangformat']
let g:neoformat_enabled_cpp=['clangformat']

" cmake
let g:neoformat_enabled_cmake=['cmakeformat']

" rust
let g:neoformat_enabled_rust=['rustfmt']

" html,xml,xhtml
let g:neoformat_enabled_html=['prettier']
let g:neoformat_enabled_xml=['prettier']
let g:neoformat_enabled_xhtml=['prettier']

" json,jsonc
let g:neoformat_enabled_json=['prettier']
let g:neoformat_enabled_jsonc=['prettier']

" markdown
let g:neoformat_enabled_markdown=['prettier']
