"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" UI
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/vista.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'jlanzarotta/bufexplorer'
" this plugin need golang
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}

" Color Theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'KeitaNakamura/neodark.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'Rigellute/rigel'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'

" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'
if has('nvim-0.5.0')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

" Comment
" Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'

" Searching
Plug 'jremmen/vim-ripgrep'
Plug 'rking/ag.vim'
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'

" HTML, XML tag
Plug 'andymass/vim-matchup'
Plug 'alvan/vim-closetag'

" Markdown
" Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Flex, Bison
Plug 'justinmk/vim-syntax-extra'

" LLVM
Plug 'rhysd/vim-llvm'

" PowerShell
Plug 'pprovost/vim-ps1'

" Lisp
Plug 'vlime/vlime'


call plug#end()
