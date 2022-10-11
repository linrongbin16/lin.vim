" lin.vim

" VIM Plugins
source $HOME/.vim/plugin.vim

" VIM Settings
source $HOME/.vim/setting/linrongbin16/standalone.vim

" Color Scheme
source $HOME/.vim/setting/linrongbin16/colorscheme.vim

" UI
if has('nvim-0.7')
    source $HOME/.vim/setting/romgrk/barbar.nvim.vim
    source $HOME/.vim/setting/kyazdani42/nvim-tree.lua.vim
else
    source $HOME/.vim/setting/bagrat/vim-buffet.vim
    source $HOME/.vim/setting/lambdalisue/fern.vim.vim
endif
if has('nvim-0.5')
    source $HOME/.vim/setting/nvim-lualine/lualine.nvim.vim
else
    source $HOME/.vim/setting/Yggdroot/indentLine.vim
    source $HOME/.vim/setting/itchyny/lightline.vim.vim
endif
source $HOME/.vim/setting/jlanzarotta/bufexplorer.vim

" Git
if has('nvim-0.5')
    source $HOME/.vim/setting/f-person/git-blame.nvim.vim
endif

" Highlight
source $HOME/.vim/setting/RRethy/vim-hexokinase.vim
source $HOME/.vim/setting/RRethy/vim-illuminate.vim

" Tags
source $HOME/.vim/setting/liuchengxu/vista.vim.vim
source $HOME/.vim/setting/ludovicchabant/vim-gutentags.vim

" Search Engine
source $HOME/.vim/setting/junegunn/fzf.vim.vim

" Language Server
source $HOME/.vim/setting/neoclide/coc.nvim.vim

" HTML Tag
source $HOME/.vim/setting/alvan/vim-closetag.vim
" C#
" source $HOME/.vim/setting/OmniSharp/omnisharp-vim.vim

" Editing Support
if has('nvim')
    source $HOME/.vim/setting/numToStr/Comment.nvim.vim
endif
if has('nvim-0.5')
    source $HOME/.vim/setting/phaazon/hop.nvim.vim
    source $HOME/.vim/setting/windwp/nvim-autopairs.vim
else
    source $HOME/.vim/setting/easymotion/vim-easymotion.vim
endif
source $HOME/.vim/setting/chaoren/vim-wordmotion.vim
source $HOME/.vim/setting/haya14busa/is.vim.vim
source $HOME/.vim/setting/haya14busa/vim-asterisk.vim

" GUI
source $HOME/.vim/setting/linrongbin16/gui.vim
" Enhanced Copy Paste
source $HOME/.vim/setting/linrongbin16/enhanced-copy-paste.vim
" FileType Mappings
source $HOME/.vim/setting/linrongbin16/filetype-map.vim

" User Settings
source $HOME/.vim/setting.vim
