" lin.vim

" config for vim
source $HOME/.vim/setting-vim/vim-plug.vim
source $HOME/.vim/setting-vim/win32.vim
source $HOME/.vim/setting-vim/basic.vim
source $HOME/.vim/setting-vim/color.vim
source $HOME/.vim/setting-vim/filetype.vim
source $HOME/.vim/setting-vim/hotkey.vim

" config for plugin

" UI
source $HOME/.vim/setting-plugin/indentline.vim
source $HOME/.vim/setting-plugin/nerdtree.vim
source $HOME/.vim/setting-plugin/statusline.vim

" Auto Complete
source $HOME/.vim/setting-plugin/coc-nvim.vim
source $HOME/.vim/setting-plugin/gutentags.vim

" Search
source $HOME/.vim/setting-plugin/ripgrep.vim
source $HOME/.vim/setting-plugin/leaderf.vim

" Keyboard Operation
source $HOME/.vim/setting-plugin/vim-easymotion.vim
source $HOME/.vim/setting-plugin/insearch.vim
source $HOME/.vim/setting-plugin/vim-easy-align.vim

" HTML/XML
source $HOME/.vim/setting-plugin/closetag.vim

" Markdown
source $HOME/.vim/setting-plugin/markdown.vim

" user setting
if filereadable(expand('~/.vim/user.vim'))
    source $HOME/.vim/user.vim
endif
