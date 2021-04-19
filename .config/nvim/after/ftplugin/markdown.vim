inoremap <leader>? <c-g>u<esc>[s1z=`]a<c-g>u
nnoremap <buffer> <silent> <leader>s :call ToggleSpelling()<cr>

set linebreak
set tw=75
set nowrap

set syntax=pandoc-custom

setlocal spelllang=da,en_gb
setlocal nonumber
set conceallevel=0

fun! ToggleSpelling()
    if exists('b:spcheck')
        exe 'setlocal nospell | unlet b:spcheck'
    else
        exe 'setlocal spell | let b:spcheck = 1'
    endif
endfun

fun! UpdateDate()
    exe '%s/\v^date:\s{-}\zs\S.*$\ze/'.strftime('%Y-%m-%d')
endfun

" fun! ChangeDate()
"     if expand('%:p:h') == '/Users/marc/mhoirup.github.io/_posts'
"         exe '%s/^date: \d*-\d*-\d*/date: '.strftime('%Y-%m-%d')
"     endif
" endfun

