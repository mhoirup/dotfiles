let s:black = '#292323'
let s:white = '#d5d7d5'
let s:red = '#6a4e48'
let s:orange = '#6a5948'
let s:green = '#646b4a'
let s:blue = '#485b6a'
let s:purple = '#59486a'
let s:cyan = '#486a6a'
let s:darkgray = '#657074'
let s:lightgray = '#b8c3c7'

function! s:Hi(group, ...)
    let highlight = 'hi '. a:group
    if strlen(a:1)
        let highlight .= ' guifg=' . a:1
    endif
    if strlen(a:2)
        let highlight .= ' guibg=' . a:2
    endif
    if strlen(a:3)
        let highlight .= ' gui='   . a:3
    endif
    execute highlight
endfunction

call s:Hi('Normal', s:black, s:white, '')
hi! link Delimiter Normal
hi! link Identifier Normal

call s:Hi('String', s:green, s:white, '')

call s:Hi('Type', s:purple, s:white, '')

call s:Hi('Function', s:blue, s:white, '')
