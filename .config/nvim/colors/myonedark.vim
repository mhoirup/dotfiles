hi clear
if exists('syntax on')
    syntax reset
endif
set background=dark
let g:colors_name = 'onedark'


let s:mono1 = '#abb2bf' "default text
let s:mono2 = '#7C8492'
let s:mono3 = '#5C6370'

let s:hue1 = '#56B6C2'
let s:blue = '#61AFEF'
let s:purple = '#C678DD'
let s:purple = '#bd64d8'

let s:green = '#98C379'

let s:hue5a = '#E06C75' "red1
let s:hue5b = '#BE5046' "red2

let s:orange_dark = '#D19A66' "orange1
let s:orange_light = '#E5C07B' "orange2

let s:background = '#282C34'
let s:gutter = '#768196'
let s:guide = '#e5e9f0'
let s:accent = '#528BFF'

let s:text = s:mono1
let s:cursor = s:accent
let s:selection = '#3a404c'

fun! s:Hi(group, ...)
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
endfun

call s:Hi('Normal', s:text, s:background, '')
hi! link Special Normal
hi! link PreProc Normal

call s:Hi('Statement', s:purple, s:background, '')

call s:Hi('Identifier', s:orange_light, s:background, '')
hi! link Type Identifier

call s:Hi('Character', s:green, s:background, '')

call s:Hi('Function', s:blue, s:background, '')

call s:Hi('EndOfBuffer', s:background, s:background, '')

call s:Hi('LineNr', s:selection, s:background, '')
 
call s:Hi('Visual', '', s:selection, '')

call s:Hi('Comment', s:mono3, s:background, '')
