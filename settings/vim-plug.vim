call plug#begin('~/.vim/plugged')

" Display
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'

" Common
"Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', { 'on': [] } | call plug#load('vimfiler.vim')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'

" C++ Python
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'CC', 'cxx', 'cpp', 'h', 'hpp', 'HH', 'hxx', 'hh'] }
if has("win32")
    Plug 'davidhalter/jedi-vim', { 'for': ['py'] }
    Plug 'ervandew/supertab'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cc', 'CC', 'cxx', 'cpp', 'h', 'hpp', 'H', 'hh', 'HH', 'hxx'] }
else
    Plug 'Valloric/YouCompleteMe'
endif
Plug 'hdima/python-syntax', { 'for': ['py'] }

" Java
Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java'] }
" html/css/js
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json', 'less'] }
Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json', 'less'] }
Plug 'groenewege/vim-less', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json', 'less'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'mxw/vim-jsx', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'posva/vim-vue', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'burnettk/vim-angular', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'ternjs/tern_for_vim', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
" Golang
Plug 'fatih/vim-go', { 'for': ['go'] }
" Thrift
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
" php
Plug 'StanAngeloff/php.vim', { 'for': ['php'] }
Plug 'shawncplus/phpcomplete.vim', { 'for': ['php'] }
" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['hs']}
" rust
Plug 'rust-lang/rust.vim', { 'for': ['rs'] }
Plug 'phildawes/racer', { 'for': ['rs'] }
" ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['rb', 'ruby'] }
Plug 'tpope/vim-rails', { 'for': ['rb', 'ruby'] }
" scala
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" maven
Plug 'mikelue/vim-maven-plugin', { 'for': ['xml'] }
" markdown
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown', 'MD'] }


call plug#end()
