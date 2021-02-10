hi clear
if exists('syntax on')
    syntax reset
endif
let g:colors_name = 'marble'
set background=light

if &background == 'light'
    let s:background  = '#f1f1f1'
    let s:comment     = '#999999'
    let s:text        = '#424242'
    let s:constant    = '#008ec4'
endif
if &background == 'dark'
    let s:background  = '#282828'
    let s:text        = '#e5e5e5'
    let s:constant    = '#b6d6fd'
    let s:statement   = '#fdddb6'
endif

let s:comment     = '#999999'
let s:cursorline  = '#e4e4e4'
let s:dimmed_text = '#303030'
let s:error       = '#ffcccb'
let s:ghighlight  = '#dbe7d5'
let s:linenr      = '#cccccc'
let s:selection   = '#e5e9f0'
let s:subtle_text = '#767676'
let s:yhighlight  = '#ffffba'

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

call s:Hi('Normal', s:text, s:background, '')
hi! link Debug            Normal
hi! link Define           Normal
hi! link Delimiter        Normal
hi! link Function         Normal
hi! link Identifier       Normal
hi! link Macro            Normal
hi! link MoreMsg          Normal
hi! link PreCondit        Normal
hi! link PreProc          Normal
hi! link Question         Normal
hi! link Special          Normal
hi! link SpecialChar      Normal
hi! link SpecialComment   Normal
hi! link SpellLocal       Normal
hi! link SpellRare        Normal
hi! link StatusLine       Normal
hi! link StorageClass     Normal
hi! link Structure        Normal
hi! link Tag              Normal
hi! link Type             Normal
hi! link Typedef          Normal

call s:Hi('Noise', s:dimmed_text, '', '')
hi! link CursorLineNr     LineNr
hi! link Operator         Noise
hi! link SignColumn       LineNr

call s:Hi('MatchParen', s:text, s:background, 'underline')

call s:Hi('EndOfBuffer', s:background, s:background, '')

call s:Hi('VertSplit', s:background, s:background, '')
hi! link CursorNC         VertSplit
hi! link StatusLineNC     VertSplit
hi! link StatusLineTerm   VertSplit
hi! link StatusLineTermNC VertSplit

call s:Hi('Comment', s:comment, '', 'italic')
hi! link Folded           Comment

call s:Hi('LineNr', s:linenr, s:background, '')
hi! link FoldColumn       LineNr

call s:Hi('Constant', s:constant, '', '')
hi! link Boolean          Constant
hi! link Character        Constant
hi! link Directory        Constant
hi! link Float            Constant
hi! link Number           Constant
hi! link String           Constant
hi! link Title            Constant

call s:Hi('Statement', s:text, '', 'bold')
hi! link Conditonal       Statement
hi! link Exception        Statement
hi! link Include          Statement
hi! link Keyword          Statement
hi! link Label            Statement
hi! link Repeat           Statement


call s:Hi('ErrorMsg', s:text, s:error, '')
hi! link Error            ErrorMsg
hi! link WarningMsg       ErrorMsg

call s:Hi('NonText', s:dimmed_text, '', '')
hi! link qfLineNr         NonText
hi! link ModeMsg          NonText

call s:Hi('Search', s:text, s:yhighlight, '')

call s:Hi('Visual', '', s:selection, '')
hi! link VisualNOS        Visual

call s:Hi('DiffAdd', s:text, s:ghighlight, '')
call s:Hi('DiffDelete', s:text, s:error, '')
call s:Hi("DiffChange", s:text, s:yhighlight, '')
call s:Hi('DiffText', s:text, s:yhighlight, 'underline')

call s:Hi('SpellBad', s:text, s:error, 'NONE')
call s:Hi('SpellCap', s:text, s:yhighlight, 'NONE')

call s:Hi('HelpNote', s:text, s:background, 'underline')

call s:Hi('CursorLine', s:text, s:cursorline, '')
hi! link Pmenu            CursorLine
hi! link PmenuSbar        Pmenu
hi! link PmenuThumb       Pmenu

call s:Hi('PmenuSel', s:background, s:constant, '')

