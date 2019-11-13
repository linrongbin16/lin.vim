" lin-vim

" conf
source $HOME/.vim/settings/conf/vim-plug.vim
source $HOME/.vim/settings/conf/basic.vim
source $HOME/.vim/settings/conf/color.vim
source $HOME/.vim/settings/conf/copy-paste.vim
source $HOME/.vim/settings/conf/file.vim
source $HOME/.vim/settings/conf/key.vim

" plug
source $HOME/.vim/settings/plug/indentline.vim
source $HOME/.vim/settings/plug/nerdtree.vim
source $HOME/.vim/settings/plug/ale.vim
source $HOME/.vim/settings/plug/vim-autoformat.vim
source $HOME/.vim/settings/plug/vim-gutentags.vim
source $HOME/.vim/settings/plug/you-complete-me.vim
source $HOME/.vim/settings/plug/ultisnips.vim
source $HOME/.vim/settings/plug/ag.vim
source $HOME/.vim/settings/plug/vim-easymotion.vim
source $HOME/.vim/settings/plug/vim-cpp-enhanced-highlight.vim
source $HOME/.vim/settings/plug/emmet.vim
source $HOME/.vim/settings/plug/python-syntax.vim
source $HOME/.vim/settings/plug/haskell.vim
source $HOME/.vim/settings/plug/vim-rust.vim
source $HOME/.vim/settings/plug/vim-go.vim

" user
" please use ~/.vim/settings/conf/user-template.vim
if filereadable(expand('~/.vim/user.vim'))
    source $HOME/.vim/user.vim
endif
