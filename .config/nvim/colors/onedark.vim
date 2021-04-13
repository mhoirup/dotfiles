hi clear
if exists('syntax on')
    syntax reset
endif
let g:colors_name = 'onedark'

let s:black = '#282c34'
let s:white = '#d8dee9'
let s:gray = '#abb2bf'
let s:dark_gray = '#636d83'
let s:green = '#98C373'
let s:cyan = '#56B6C2'
let s:purple = '#C678DD'
let s:red = '#E06C75'
let s:blue = '#61AFEF'

execute 'hi Normal guifg='.s:white.' guibg='.s:black
hi! link CursorLineNr Normal
hi! link vimOper      Normal
hi! link vimParenSep  Normal

execute 'hi LineNr guifg='.s:dark_gray.' guibg='.s:black

execute 'hi EndOfBuffer guifg='.s:black.' guibg='.s:black

execute 'hi CursorLine guibg='.s:black

execute 'hi Constant guifg='.s:green

execute 'hi vimFuncName guifg='.s:cyan

execute 'hi vimNotFunc guifg='.s:purple

execute 'hi vimVar guifg='.s:red

execute 'hi vimLet guifg='.s:blue
hi! link vimCommand   vimLet
