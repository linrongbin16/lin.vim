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
source $HOME/.vim/setting-plugin/airline.vim
source $HOME/.vim/setting-plugin/better-whitespace.vim

" Lint
source $HOME/.vim/setting-plugin/ale.vim

" Auto Format
source $HOME/.vim/setting-plugin/vim-autoformat.vim
source $HOME/.vim/setting-plugin/vim-easy-align.vim

" Complete
if has('win32')
    source $HOME/.vim/setting-plugin/you-complete-me.vim
    source $HOME/.vim/setting-plugin/gutentags.vim
else
    source $HOME/.vim/setting-plugin/coc-nvim.vim
endif

" Search
source $HOME/.vim/setting-plugin/ag.vim
source $HOME/.vim/setting-plugin/ctrlp.vim

" Keyboard Operation
source $HOME/.vim/setting-plugin/vim-easymotion.vim
source $HOME/.vim/setting-plugin/insearch.vim

" C/C++
source $HOME/.vim/setting-plugin/vim-cpp-enhanced-highlight.vim

" HTML/XML
source $HOME/.vim/setting-plugin/closetag.vim

" user setting
if filereadable(expand('~/.vim/user.vim'))
    source $HOME/.vim/user.vim
endif
