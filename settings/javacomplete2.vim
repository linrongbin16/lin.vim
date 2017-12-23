let g:JavaComplete_Home = '~/.vim/bundle/vim-javacomplete2'
let $CLASSPATH .= '.:~/.vim/bundle/vim-javacomplete2/lib/javavi/target/classes'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
