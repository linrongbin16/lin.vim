"" ---- vim-clang-format.vim ----

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}


" c/c++
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cc ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType cxx ClangFormatAutoEnable
autocmd FileType h ClangFormatAutoEnable
autocmd FileType hpp ClangFormatAutoEnable
autocmd FileType hh ClangFormatAutoEnable
autocmd FileType hxx ClangFormatAutoEnable

" java
autocmd FileType java ClangFormatAutoEnable

" js
autocmd FileType js ClangFormatAutoEnable
autocmd FileType javascript ClangFormatAutoEnable

" obj-c
autocmd FileType objc ClangFormatAutoEnable
