" lin.vim

" VIM Plugins
source $HOME/.vim/plugin.vim

" VIM Settings
source $HOME/.vim/setting/linrongbin16/standalone.vim

" Color Scheme
source $HOME/.vim/setting/linrongbin16/colorscheme.vim

" UI
if has('nvim-0.5')
    source $HOME/.vim/setting/romgrk/barbar.nvim.vim
    source $HOME/.vim/setting/nvim-lualine/lualine.nvim.vim
    source $HOME/.vim/setting/lewis6991/gitsigns.nvim.vim
else
    source $HOME/.vim/setting/bagrat/vim-buffet.vim
    source $HOME/.vim/setting/itchyny/lightline.vim.vim
    source $HOME/.vim/setting/Yggdroot/indentLine.vim
    source $HOME/.vim/setting/airblade/vim-gitgutter.vim
endif
if has('nvim-0.6')
    source $HOME/.vim/setting/kyazdani42/nvim-tree.lua.vim
else
    source $HOME/.vim/setting/lambdalisue/fern.vim.vim
    " source $HOME/.vim/setting/weirongxu/coc-explorer.vim
endif
source $HOME/.vim/setting/jlanzarotta/bufexplorer.vim

" Highlight
source $HOME/.vim/setting/RRethy/vim-hexokinase.vim
source $HOME/.vim/setting/RRethy/vim-illuminate.vim

" Tags
source $HOME/.vim/setting/liuchengxu/vista.vim.vim
source $HOME/.vim/setting/ludovicchabant/vim-gutentags.vim

" Language Server and Search Engine
source $HOME/.vim/setting/neoclide/coc.nvim.vim
" source $HOME/.vim/setting/hrsh7th/nvim-cmp.vim
" by default key mappings are provided only for fzf.vim
" if you want to disable key mappings for fzf.vim, please comment below line
source $HOME/.vim/setting/junegunn/fzf.vim.vim
" if you want to enable key mappings for vim-clap, please uncomment below line
" source $HOME/.vim/setting/liuchengxu/vim-clap.vim

" Other Language Support
" HTML Tag
source $HOME/.vim/setting/alvan/vim-closetag.vim

" Editing Support
if has('nvim-0.5')
    source $HOME/.vim/setting/phaazon/hop.nvim.vim
    source $HOME/.vim/setting/windwp/nvim-autopairs.vim
else
    source $HOME/.vim/setting/easymotion/vim-easymotion.vim
endif
source $HOME/.vim/setting/chaoren/vim-wordmotion.vim
source $HOME/.vim/setting/haya14busa/incsearch.vim.vim

" GUI
source $HOME/.vim/setting/linrongbin16/gui.vim
" Enhanced Copy Paste
source $HOME/.vim/setting/linrongbin16/enhanced-copy-paste.vim
" FileType Mappings
source $HOME/.vim/setting/linrongbin16/filetype-map.vim

" Other User Settings
if filereadable(expand('~/.vim/setting.vim'))
    source $HOME/.vim/setting.vim
endif
