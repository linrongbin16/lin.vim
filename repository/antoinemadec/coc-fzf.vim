""" Make coc-fzf look same as fzf.vim
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []


""" Coc search

let LIN_VIM_NVIM_TREE='NvimTree'
let LIN_VIM_FERN='fern'

if has('nvim-0.7')
    " search symbols based on coc.nvim
    nnoremap <silent> <expr> <space>cs (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList symbols<CR>"
    " search diagnostics based on coc.nvim
    nnoremap <silent> <expr> <space>cd (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList diagnostics<CR>"
    " search symbol outlines based on coc.nvim
    nnoremap <silent> <expr> <space>co (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList outline<CR>"
    " search commands based on coc.nvim
    nnoremap <silent> <expr> <space>cc (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList commands<CR>"
    " search location based on coc.nvim
    nnoremap <silent> <expr> <space>cl (&filetype == LIN_VIM_NVIM_TREE ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList location<CR>"
else
    " search symbols based on coc.nvim
    nnoremap <silent> <expr> <space>cs (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList symbols<CR>"
    " search diagnostics based on coc.nvim
    nnoremap <silent> <expr> <space>cd (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList diagnostics<CR>"
    " search symbol outlines based on coc.nvim
    nnoremap <silent> <expr> <space>co (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList outline<CR>"
    " search commands based on coc.nvim
    nnoremap <silent> <expr> <space>cc (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList commands<CR>"
    " search location based on coc.nvim
    nnoremap <silent> <expr> <space>cl (&filetype == LIN_VIM_FERN ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList location<CR>"
endif
