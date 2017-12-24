call plug#begin('~/.vim/plugged')

" Common Tools
"Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
"Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', { 'on': [] } | call plug#load('vimfiler.vim')

" Color Theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" Language
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'CC', 'cxx', 'cpp', 'h', 'hpp', 'HH', 'hxx', 'hh'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
" c++/python
if has("win32")
    Plug 'davidhalter/jedi-vim'
    Plug 'ervandew/supertab'
else
    Plug 'Valloric/YouCompleteMe'
endif
" java
Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java', 'Java'] }
" html/css
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'groenewege/vim-less', { 'for': ['less'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
" javascript
Plug 'pangloss/vim-javascript', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'mxw/vim-jsx', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'posva/vim-vue', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'burnettk/vim-angular', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
" python
Plug 'hdima/python-syntax', { 'for': ['py'] }
" golang
Plug 'fatih/vim-go', { 'for': ['go'] }
" thrift
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
" php
Plug 'StanAngeloff/php.vim', { 'for': ['php'] }
Plug 'shawncplus/phpcomplete.vim', { 'for': ['php'] }
" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['hs']}
" rust
Plug 'rust-lang/rust.vim'
Plug 'phildawes/racer'
" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" scala
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" maven
Plug 'mikelue/vim-maven-plugin'
" markdown
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown', 'MD'] }


call plug#end()
