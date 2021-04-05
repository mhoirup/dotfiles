hi clear
if exists('syntax on')
    syntax reset
endif
let g:colors_name = 'onedark'

let s:black = '#282c34'
let s:gray = '#abb2bf'
let s:dark_gray = '#636d83'
let s:green = '#98C379'
let s:cyan = '#56B6C2'
let s:purple = '#C678DD'

execute 'hi Normal guifg='.s:gray.' guibg='.s:black
hi! link CursorLineNr Normal

execute 'hi LineNr guifg='.s:dark_gray.' guibg='.s:black

execute 'hi EndOfBuffer guifg='.s:black.' guibg='.s:black

execute 'hi CursorLine guibg='.s:black

execute 'hi Constant guifg='.s:green

execute 'hi Statement guifg='.s:cyan

execute 'hi vimCommand guifg='.s:purple
