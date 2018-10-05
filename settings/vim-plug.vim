"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    " Make windows use ~/.vim too, I don't want to use _vimfiles
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" UI Manager
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree'

" Color Theme
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'
Plug 'crusoexia/vim-monokai'
Plug 'raphamorim/lucario'
Plug 'kadekillary/subtle_solo'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'w0ng/vim-hybrid'
Plug 'jnurmine/Zenburn'
Plug 'sjl/badwolf'

" Lint
Plug 'w0rp/ale', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh', 'py', 'go', 'rb', 'ruby', 'hs', 'rs', 'java', 'php', 'cs', 'sql', 'lisp', 'kt', 'sh', 'el', 'erl', 'scala', 'html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
" Auto Format
Plug 'Chiel92/vim-autoformat'

" Complete Engine
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" File Search
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'js', 'jsx', 'xml', 'xhtml', 'json', 'less'] }

" Comment
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DoxygenToolkit.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Json
Plug 'elzr/vim-json'
" C/C++
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }
" Python
Plug 'hdima/python-syntax', { 'for': ['py'] }
" Css
Plug 'ap/vim-css-color', { 'for': ['html', 'xhtml', 'xml', 'css', 'js', 'jsx'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'xhtml', 'xml', 'css', 'js', 'jsx'] }
" Scss
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
" Less
Plug 'groenewege/vim-less', { 'for': ['less'] }
" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
Plug 'mxw/vim-jsx', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
Plug 'maksimr/vim-jsbeautify', { 'for': ['html', 'xhtml', 'xml', 'json', 'js', 'jsx', 'css', 'less'] }
" Html
Plug 'othree/html5.vim', { 'for': ['html', 'xhtml', 'xml'] }
" TypeScript
Plug 'leafgarland/typescript-vim', { 'for': ['ts', 'typescript'] }
" CoffeeScript
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
" Vue
Plug 'posva/vim-vue', { 'for': ['vue'] }
" Php
Plug 'StanAngeloff/php.vim', { 'for': ['php'] }
" Fsharp
Plug 'fsharp/vim-fsharp', { 'for': ['fs', 'fsi', 'fsx', 'fsharp'] }
" Perl
Plug 'vim-perl/vim-perl', { 'for': ['perl'] }
Plug 'vim-perl/vim-perl6', { 'for': ['pl6', 'pm6', 'p6'] }
" Golang
Plug 'fatih/vim-go', { 'for': ['go'] }
" Thrift
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['hs'] }
" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rs'] }
Plug 'phildawes/racer', { 'for': ['rs'] }
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['rb', 'ruby'] }
Plug 'tpope/vim-rails', { 'for': ['rb', 'ruby'] }
" Scala
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }


call plug#end()
