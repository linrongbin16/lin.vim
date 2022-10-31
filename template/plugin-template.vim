"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" UI
if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
else
    Plug 'ryanoasis/vim-devicons'
endif
if has('nvim-0.7')
    Plug 'romgrk/barbar.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
else
    Plug 'bagrat/vim-buffet'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/glyph-palette.vim'
    Plug 'lambdalisue/fern-git-status.vim'
endif
if has('nvim-0.5')
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-lualine/lualine.nvim'
else
    Plug 'Yggdroot/indentLine'
    Plug 'itchyny/lightline.vim'
endif
Plug 'jlanzarotta/bufexplorer'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
if has('nvim-0.5')
    Plug 'f-person/git-blame.nvim'
endif

" Tags
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'

" Search Engine
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'

" Programming Language Support
" Flex, Bison
Plug 'justinmk/vim-syntax-extra', {'for': ['lex', 'flex', 'yacc', 'bison']}
" LLVM
Plug 'rhysd/vim-llvm'
" Protobuf
Plug 'uarun/vim-protobuf'
" Hive
Plug 'zebradil/hive.vim'
" Haskell
Plug 'neovimhaskell/haskell-vim'
" HTML Tag
Plug 'andymass/vim-matchup'
Plug 'alvan/vim-closetag'
" C#
" Plug 'OmniSharp/omnisharp-vim'

" Editing Support
if has('nvim')
    Plug 'numToStr/Comment.nvim'
else
    Plug 'tomtom/tcomment_vim'
endif
if has('nvim-0.5')
    Plug 'phaazon/hop.nvim'
    Plug 'windwp/nvim-autopairs'
else
    Plug 'easymotion/vim-easymotion'
    Plug 'jiangmiao/auto-pairs'
endif
Plug 'justinmk/vim-sneak'
Plug 'chaoren/vim-wordmotion'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
Plug 'haya14busa/is.vim'

call plug#end()
