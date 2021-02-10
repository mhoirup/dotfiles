hi clear
if exists('syntax on')
    syntax reset
endif
let g:colors_name = 'duotone'

fun! s:Hi(group, ...)
    let highlight = 'hi '. a:group
    if strlen(a:1)
        let highlight .= ' guifg=' . a:1
    endif
    if strlen(a:2)
        let highlight .= ' guibg=' . a:2
    endif
    execute highlight
endfun

let s:foreground = '#b6aaee'
let s:backgroud = '#2a2833'
let s:accent = '#8870ff'


call s:Hi('Normal', s:foreground, s:backgroud)

