function MakeCtags()
    :!ctags -R --c-kinds=+px --fields=+niazS --extras=+q -f .tags * 1>/dev/null 2>&1 &
endfunction

function MakeCpptags()
    :!ctags -R --c++-kinds=+px --fields=+niazS --extras=+q -f .tags * 1>/dev/null 2>&1 &
endfunction

function MakePytags()
    :!ctags -R --python-kinds=+px --fields=+niazS --extras=+q -f .tags *.py 1>/dev/null 2>&1 &
endfunction

:command Ctags call MakeCtags()
:command Cpptags call MakeCpptags()
:command Pytags call MakePytags()
