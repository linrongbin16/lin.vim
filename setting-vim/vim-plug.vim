"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    " Make windows use ~/.vim too, I don't want to use _vimfiles
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')


" UI
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" Lint
Plug 'dense-analysis/ale'

" Auto Format
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'

" Complete Engine
Plug 'ycm-core/YouCompleteMe'

" Comment
"Plug 'scrooloose/nerdcommenter'
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
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'

" C/C++
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }

" Json
Plug 'elzr/vim-json'

call plug#end()
