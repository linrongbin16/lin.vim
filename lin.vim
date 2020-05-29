" lin-vim

" config for vim
source $HOME/.vim/setting-vim/vim-plug.vim
source $HOME/.vim/setting-vim/basic.vim
source $HOME/.vim/setting-vim/color.vim
source $HOME/.vim/setting-vim/filetype.vim
source $HOME/.vim/setting-vim/hotkey.vim

" config for plugin 
source $HOME/.vim/setting-plugin/ag.vim
source $HOME/.vim/setting-plugin/indentline.vim
source $HOME/.vim/setting-plugin/nerdtree.vim
source $HOME/.vim/setting-plugin/ale.vim
source $HOME/.vim/setting-plugin/ctrlp.vim
source $HOME/.vim/setting-plugin/vim-autoformat.vim
source $HOME/.vim/setting-plugin/vim-gutentags.vim
source $HOME/.vim/setting-plugin/you-complete-me.vim
source $HOME/.vim/setting-plugin/ultisnips.vim
source $HOME/.vim/setting-plugin/vim-easymotion.vim
source $HOME/.vim/setting-plugin/vim-cpp-enhanced-highlight.vim
source $HOME/.vim/setting-plugin/emmet.vim
source $HOME/.vim/setting-plugin/python-syntax.vim
source $HOME/.vim/setting-plugin/haskell.vim
source $HOME/.vim/setting-plugin/vim-rust.vim
source $HOME/.vim/setting-plugin/vim-go.vim
source $HOME/.vim/setting-plugin/vim-easy-align.vim

" user custom
if filereadable(expand('~/.vim/custom.vim'))
    source $HOME/.vim/custom.vim
endif
