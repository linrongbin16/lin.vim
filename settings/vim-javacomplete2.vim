let g:JavaComplete_UseFQN = 1
let g:JavaComplete_Home = '$HOME/.vim/plugged/vim-javacomplete2'
let $CLASSPATH .= '.:$HOME/.vim/plugged/vim-javacomplete2/libs/javavi/target/classes'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
