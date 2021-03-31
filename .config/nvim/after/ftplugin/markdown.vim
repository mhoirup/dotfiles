inoremap <leader>? <c-g>u<esc>[s1z=`]a<c-g>u

setlocal spelllang=da,en_gb
set linebreak
setlocal nonumber
set tw=90
set conceallevel=0

fun! ChangeDate()
    if expand('%:p:h') == '/Users/marc/mhoirup.github.io/_posts'
        exe '%s/^date: \d*-\d*-\d*/date: '.strftime('%Y-%m-%d')
    endif
endfun

