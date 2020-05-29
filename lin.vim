" lin-vim

" config for vim
source $HOME/.vim/setting-vim/vim-plug.vim
source $HOME/.vim/setting-vim/basic.vim
source $HOME/.vim/setting-vim/color.vim
source $HOME/.vim/setting-vim/filetype.vim
source $HOME/.vim/setting-vim/hotkey.vim

" config for plugin

" UI
source $HOME/.vim/setting-plugin/indentline.vim
source $HOME/.vim/setting-plugin/nerdtree.vim

" Lint
source $HOME/.vim/setting-plugin/ale.vim

" Auto Format
source $HOME/.vim/setting-plugin/vim-autoformat.vim
source $HOME/.vim/setting-plugin/vim-easy-align.vim

" Complete
source $HOME/.vim/setting-plugin/you-complete-me.vim

" Search
source $HOME/.vim/setting-plugin/ag.vim
source $HOME/.vim/setting-plugin/ctrlp.vim

" Move
source $HOME/.vim/setting-plugin/vim-easymotion.vim

" C/C++
source $HOME/.vim/setting-plugin/vim-cpp-enhanced-highlight.vim

" Rust
source $HOME/.vim/setting-plugin/vim-rust.vim

" Go
source $HOME/.vim/setting-plugin/vim-go.vim

" Haskell
source $HOME/.vim/setting-plugin/haskell.vim

" user custom
if filereadable(expand('~/.vim/custom.vim'))
    source $HOME/.vim/custom.vim
endif
