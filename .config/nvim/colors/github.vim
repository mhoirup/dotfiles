hi clear
if exists('syntax on')
    syntax reset
endif
let g:colors_name = 'github'

let s:black       = '#24292e'
let s:blue        = '#005cc5'
let s:dark_blue   = '#032f62'
let s:dark_gray   = '#6a737d'
let s:light_blue  = '#dbedff'
let s:light_gray  = '#d1d5da'
let s:light_green = '#bef5cb'
let s:light_red   = '#f5cfd3'
let s:off_white   = '#fafbfc'
let s:orange      = '#e36209'
let s:purple      = '#6f42c1'
let s:red         = '#d73a49'
let s:white       = '#ffffff'
let s:yellow      = '#fff5b1'

execute 'hi Normal guifg='.s:black.' guibg='.s:white
hi! link CursorLineNr        Normal
hi! link ModeMsg             Normal
hi! link MoreMsg             Normal
hi! link Question            Normal
hi! link Special             Normal
hi! link StatusLine          Normal
hi! link TabLine             Normal
hi! link TabLineFill         Normal
hi! link Title               Normal
hi! link Type                Normal
hi! link VertSplit           Normal
hi! link pythonClassVar      Normal
hi! link qfFileName          Normal
hi! link qfLineNr            Normal
hi! link texEnvironment      Normal
hi! link vimLet              Normal
hi! link vimVar              Normal

execute 'hi TabLineSel guifg='.s:black.' guibg='.s:white. ' gui=bold'

execute 'hi Pmenu guifg='.s:black.' guibg='.s:off_white

execute 'hi Statement guifg='.s:red.' guibg='.s:white. ' gui=None'
hi! link pythonConditional   Statement
hi! link pythonImport        Statement
hi! link pythonOperator      Statement
hi! link pythonStatement     Statement
hi! link texFunction         Statement
hi! link texTextFormat       Statement
hi! link vimFuncOper         Statement
hi! link rDollar             Statement

execute 'hi Preproc guifg='.s:purple.' guibg='.s:white
hi! link pythonClass         Preproc
hi! link pythonFunction      Preproc
hi! link pythonFunctionCall  Preproc
hi! link rFunction           Preproc
hi! link texHeading          Preproc
hi! link texHyperLink        Preproc
hi! link texHyperLinkText    Preproc
hi! link vimFuncName         Preproc
hi! link vimUserFunc         Preproc

execute 'hi Constant guifg='.s:dark_blue.' guibg='.s:white
hi! link texNote             Constant

execute 'hi Identifier guifg='.s:orange.' guibg='.s:white
hi! link PythonArgument      Identifier
hi! link pythonStrFormat     Identifier
hi! link rArgument           Identifier

execute 'hi vimOper guifg='.s:red.' guibg='.s:white
hi! link pythonInclude       vimOper

execute 'hi EndOfBuffer guifg='.s:white.' guibg='.s:white

execute 'hi LineNr guifg='.s:light_gray.' guibg='.s:white
hi! link PmenuSbar           LineNr

execute 'hi vimCommand guifg='.s:blue.' guibg='.s:white
hi! link pythonBoolean       vimCommand
hi! link pythonBuiltin       vimCommand
hi! link pythonBuiltinFunc   vimCommand
hi! link pythonNone          vimCommand
hi! link rPreProc            vimCommand
hi! link rType               vimCommand
hi! link texInlineMath       vimCommand
hi! link texMath             vimCommand
hi! link texRefFun           vimCommand
hi! link vimIsCommand        vimCommand
hi! link vimNotFunc          vimCommand
hi! link yamlBlockMappingKey vimCommand
hi! link rNumber             vimCommand

execute 'hi Comment guifg='.s:dark_gray.' guibg='.s:white
hi! link texMathDelim        Comment

execute 'hi Search guibg='.s:yellow
hi! link SpellCap            Search

execute 'hi Visual guibg='.s:light_blue
hi! link PmenuSel            VisualNOS
hi! link VisualNOS           Visual

execute 'hi CursorLine guibg='.s:white

execute 'hi MatchParen guibg='.s:light_green

execute 'hi ErrorMsg guifg='.s:black.' guibg='s:light_red
hi! link Error               ErrorMsg
hi! link NvimInternalError   ErrorMsg
hi! link SpellBad            ErrorMsg

execute 'hi helpNote guifg='.s:white.' guibg='s:blue

