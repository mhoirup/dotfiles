hi clear
if exists('syntax on')
    syntax reset
endif
let g:colors_name = 'theta'

let s:black = '#282c34'
let s:gray0       = '#abb2bf'
let s:gray1 = '#5c6370'
let s:green = '#abe085'
let s:purple0 = '#C678DD'
let s:purple1 = '#bd64d8'
let s:blue = '#61AFEF'

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

execute 'hi Normal guifg='.s:gray0.' guibg='.s:black

" call s:Hi('Normal', s:gray0, s:black, '')


call s:Hi('LineNr', s:gray1, s:black, '')

call s:Hi('EndOfBuffer', s:black, s:black, '')


call s:Hi('Constant', s:green, s:black, '')


call s:Hi('Statement', s:purple0, s:black, '')


call s:Hi('Identifier', s:blue, s:black, '')
