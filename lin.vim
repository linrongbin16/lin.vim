" lin.vim

" 1) vim plugins
source $HOME/.vim/plugin.vim

" 2) standalone settings
source $HOME/.vim/setting/linrongbin16/standalone.vim
source $HOME/.vim/setting/linrongbin16/colorscheme.vim

" 3) vim plugin settings

" UI
source $HOME/.vim/setting/lambdalisue/fern.vim.vim
source $HOME/.vim/setting/jlanzarotta/bufexplorer.vim
if has('nvim-0.5')
    source $HOME/.vim/setting/romgrk/barbar.nvim.vim
    source $HOME/.vim/setting/nvim-lualine/lualine.nvim.vim
else
    source $HOME/.vim/setting/bagrat/vim-buffet.vim
    source $HOME/.vim/setting/itchyny/lightline.vim.vim
    source $HOME/.vim/setting/Yggdroot/indentLine.vim
endif

" Highlight
source $HOME/.vim/setting/inkarkat/vim-mark.vim
source $HOME/.vim/setting/RRethy/vim-hexokinase.vim
source $HOME/.vim/setting/RRethy/vim-illuminate.vim

" Tags
source $HOME/.vim/setting/liuchengxu/vista.vim.vim
source $HOME/.vim/setting/ludovicchabant/vim-gutentags.vim

" Language Server and Search Engine
source $HOME/.vim/setting/neoclide/coc.nvim.vim
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
source $HOME/.vim/setting/haya14busa/incsearch.vim.vim
source $HOME/.vim/setting/junegunn/vim-easy-align.vim

" 4) user setting
if filereadable(expand('~/.vim/user-settings.vim'))
    source $HOME/.vim/user-settings.vim
endif
