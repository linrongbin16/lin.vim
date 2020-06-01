"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    " Make windows use ~/.vim too, I don't want to use _vimfiles
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')


" UI
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'

" Color Theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'KeitaNakamura/neodark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'Rigellute/rigel'


" Auto Format
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'

if has('win32')
    " use YCM in win32
    Plug 'ycm-core/YouCompleteMe'
    " Lint
    Plug 'dense-analysis/ale'
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Comment
Plug 'tpope/vim-commentary'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Searching
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-repeat'
" Plug 'liuchengxu/vim-which-key'

" C/C++
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }

" Json
Plug 'elzr/vim-json'

" CSS
Plug 'ap/vim-css-color'

" HTML, XML
Plug 'andymass/vim-matchup'
Plug 'alvan/vim-closetag'

call plug#end()
