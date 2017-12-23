call plug#begin('~/.vim/plugged')

"Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
"Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
"Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim', { 'on': [] } | call plug#load('vimfiler.vim')
"Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-markdown', { 'for': ['md', 'markdown', 'MD'] }

" 2. Color Theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" 3 Programming Tools
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'CC', 'cxx', 'cpp', 'h', 'hpp', 'HH', 'hxx', 'hh'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'


" 4 Programming Languages
" 4     bash shell
"Plug 'Shougo/vimshell.vim'
" 4     c++/python
Plug 'Valloric/YouCompleteMe'
" 4     java
Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java', 'Java'] }
" 4     html/css
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'groenewege/vim-less', { 'for': ['less'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
" 4     javascript
Plug 'pangloss/vim-javascript', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'css', 'js', 'xml', 'xhtml', 'json'] }
Plug 'mxw/vim-jsx', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'posva/vim-vue', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
Plug 'burnettk/vim-angular', { 'for': ['js', 'html', 'xml', 'css', 'xhtml', 'json'] }
" 4     python
Plug 'hdima/python-syntax', { 'for': ['py'] }
" 4     golang
Plug 'fatih/vim-go', { 'for': ['go'] }
" 4     thrift
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
" 4     php
Plug 'StanAngeloff/php.vim', { 'for': ['php'] }
Plug 'shawncplus/phpcomplete.vim', { 'for': ['php'] }
" 4     haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['hs']}
" 4     rust
"Plug 'rust-lang/rust.vim'
"Plug 'phildawes/racer'
" 4     ruby
"Plug 'vim-ruby/vim-ruby'
"Plug 'tpope/vim-rails'
" 4     scala
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" 4     maven
Plug 'mikelue/vim-maven-plugin'
" 4     gradle

call plug#end()
