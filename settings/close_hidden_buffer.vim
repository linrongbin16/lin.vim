" ------------------- close_hidden_buffer.vim -------------------"

function DelHidBufs()
    let open_buffers = []
    for i in range(tabpagenr('$'))
        call extend(open_buffers, tabpagebuflist(i + 1))
    endfor

    for num in range(1, bufnr("$") + 1)
        if buflisted(num) && index(open_buffers, num) == -1
            exec "bdelete ".num
        endif
    endfor
endfunction

autocmd BufNewFile,BufReadPre,FileReadPre,BufRead * :call DelHidBufs()
command BufDel call DelHidBufs()
command BufNum echo len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
