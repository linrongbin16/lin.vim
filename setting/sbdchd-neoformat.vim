" python
let g:neoformat_python_yapf = {
            \ 'exe': 'yapf',
            \ 'args': ['--style={ based_on_style: pep8, column_limit: 120 }']
            \ }
let g:neoformat_enabled_python=['yapf']

" c/c++
let g:neoformat_enabled_c=['clangformat']
let g:neoformat_enabled_cpp=['clangformat']

" json
let g:neoformat_enabled_json=['prettier']
let g:neoformat_enabled_jsonc=['prettier']

" markdown
let g:neoformat_enabled_markdown=['prettier']
