"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" UI
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'yuki-yano/fern-preview.vim'
Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/vista.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'jlanzarotta/bufexplorer'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'RRethy/vim-illuminate'
" this plugin need golang
if has('make')
    Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}
else
    Plug 'RRethy/vim-hexokinase', {'do': 'git submodule init && git submodule update && cd hexokinase/ && go build'}
endif

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
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'

" Language Server
Plug 'ludovicchabant/vim-gutentags'
" fzf and coc.nvim
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
" vim-clap
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'vn-ki/coc-clap'

" Syntax highlighting supplementary for programming languages
" Flex, Bison
Plug 'justinmk/vim-syntax-extra', {'for': ['lex', 'flex', 'yacc', 'bison']}
" Followings are from vim-polyglot, but don't use it directly since it's
" contains too much plugins and cannot integrate well with this
" LLVM
Plug 'rhysd/vim-llvm'
" PowerShell
Plug 'PProvost/vim-ps1'
" Protobuf
Plug 'uarun/vim-protobuf'
" Hive
Plug 'zebradil/hive.vim'
" Haskell
Plug 'neovimhaskell/haskell-vim'

" Comment
" Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'chaoren/vim-wordmotion'
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


call plug#end()
