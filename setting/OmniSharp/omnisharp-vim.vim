let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'

" see: https://github.com/OmniSharp/omnisharp-vim/issues/532
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    " autocmd CursorHold *.cs :OmniSharpDocumentation

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> gi :OmniSharpFindImplementations<CR>
    " autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    " autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    " autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
    " autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> K :OmniSharpDocumentation<CR>
    " autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    " autocmd FileType cs nnoremap <buffer> <leader>ck :OmniSharpNavigateUp<CR>
    " autocmd FileType cs nnoremap <buffer> <leader>cj :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    " autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <Leader>ca :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <Leader>ca :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <Leader>rs :OmniSharpRename<CR>
    " autocmd FileType cs nnoremap <F2> :OmniSharpRename<CR>
    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    " autocmd FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    autocmd FileType cs nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    " nnoremap <Leader>ss :OmniSharpStartServer<CR>
    " nnoremap <Leader>sp :OmniSharpStopServer<CR>

    autocmd BufWritePre *.cs :OmniSharpCodeFormat
augroup END
