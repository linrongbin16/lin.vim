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
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

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

" Comment
" Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'

" Git
Plug 'mhinz/vim-signify'

" Searching
Plug 'jremmen/vim-ripgrep'
Plug 'rking/ag.vim'
Plug 'Yggdroot/LeaderF'

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'

" HTML, XML tag
Plug 'andymass/vim-matchup'
Plug 'alvan/vim-closetag'

" Markdown
Plug 'plasticboy/vim-markdown'

" Flex, Bison
Plug 'justinmk/vim-syntax-extra'

" LLVM
Plug 'rhysd/vim-llvm'

" lisp
Plug 'vlime/vlime', {'rtp': 'vim/'}

" PowerShell ps1
Plug 'pprovost/vim-ps1'

call plug#end()
