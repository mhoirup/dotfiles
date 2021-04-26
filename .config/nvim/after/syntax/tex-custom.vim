if g:colors_name == 'nord'
    " << PURPLE >>
    hi link texFunction        Number
    hi link texSupportFunction texFunction
    hi link texItem            texFunction
    hi texEmphasis             guifg=#b48ead
    " << LIGHT BLUE >>
    hi link texMath            Function
    hi link texMathAlign       texMath
    " << SUBTLE >>
    hi link texSection         Comment
    hi link texSubtleDelim     texSection
    hi link texFormatText      texSection
    hi link texLabel           texSection
    hi link texBeginEnd        texSection
    hi link texMathMeta        texSection
    hi link texMathDelim       texSection
    hi link texRefFun          texSection
    hi link texNote            texSection
    hi link texTextFormat      texSection
    " << YELLOW >>
    hi link texHeading         SpecialChar
    hi link texNewLine         texHeading
    hi link texNewParagraph    texHeading
    " << GREEN >>
    hi link texEnv             Character
    hi link texMonospace       Character
    " << DARK BLUE >>
    hi link texAlignmetChar    Type
    " << ORANGE >>
    hi texReference            guifg=#d08770
    hi link texHyperLink       texReference
    hi link texHyperLinkText   texReference
    hi link texBold            texReference
    hi link texHighlight       texReference
    " << DARK TURQUOISE >>
    hi texSCaps                guifg=#8fbcbb
endif

" if g:colors_name == 'github'
"     hi! link 
"     hi! link texEnvironment PreProc
"     hi! texHeading gui=bold
"     hi! texHeading gui=bold
    
" endif

" Syntax Specification

" syntax match texFunction '\v\\\zs\w+\ze(\\)@![\{\[]' nextgroup=texArgument
" syntax match texFunction '\v\\\zs\w+\ze(\\)@![\{\[]'
" syntax match texFunction '\v\\\zsmarginnote\ze[\{]' nextgroup=texNote
" syntax match texArgument '\[.*\]' nextgroup=texFuncInput
" syntax match texTextFormat '\v\\\zsemph|text[a-z]{2}\ze[\{]'
" syntax region texNote matchgroup=texDelimiter start='{' end='}'
" syntax match texLineBreak '\\\\'
" syntax match texHyperLink '\v\\href\zs[\{]\w+\ze[\}]'
" syntax match texEnvironmentDelimit '\v\\\zsbegin|end\ze[\{]' nextgroup=texEnvironment
" syntax region texEnvironment matchgroup=texDelimiter start='{' end='}' contained concealends
" syntax match texComment '%.*'
" syntax cluster texFunctions contains=texGenericFunction,texTextFormat
" syntax match texSection '\v\\\zs.*section.*\ze[\{]' nextgroup=texHeading
" syntax region texHeading matchgroup=texDelimiter start='{' end='}' contained concealends
" syntax match texDelimiter '{|}|\[|\]' contained
" syntax region texInlineMath start='\\(' end='\\)'
" syntax region texInlineMath start='\$' end='\$'





syntax region texHeading start='{' end='}' contained concealends

syntax region texHeading matchgroup=texSubtleDelim start='{' end='}' contained concealends


syntax match texSection '\\section\>' nextgroup=texHeading



syntax match texFunction '\\documentclass'
syntax match texFunction '\\usepackage'
syntax match texFunction '\\newcommand'
syntax match texFunction '\\input'
syntax match texFunction '\\footnote\>' nextgroup=texNote 
syntax match texFunction '\\marginnote\>' nextgroup=texNote
syntax match texFunction '\\marginnote\[.*\]\>' nextgroup=texNote
syntax match texFunction '\\noindent'
syntax match texFunction '\\definecolor'

syntax match texRefFun '\\eqref\>' nextgroup=texReference conceal
syntax match texRefFun '\\ref\>' nextgroup=texReference conceal
syntax match texRefFun '\\href\>' nextgroup=texHyperLink skipwhite
syntax region texReference matchgroup=texSubtleDelim start='{' end='}' contained concealends
syntax region texHyperLink matchgroup=texSubtleDelim start='{' end='}' contained nextgroup=texHyperLinkText
syntax region texHyperLinkText matchgroup=texSubtleDelim start='{' end='}' contained

sy match texComment '%.*'
sy region texNote matchgroup=texSubtleDelim start='{' end='}' contained concealends contains=texMath,texEmphasis

sy match texSupportFunction '\\newtheorem'
sy match texSupportFunction '\\newtheoremstyle'
sy match texSupportFunction '\\DeclareMathOperator'
sy match texSupportFunction '\\numberwithin'

sy match texItem '\\item'

sy match texNewLine '\\\\'
sy match texNewParagraph '\\par'
sy match texAlignmetChar '&'

sy match texBeginEnd '\\begin\>' nextgroup=texEnv
sy match texBeginEnd '\\end\>' nextgroup=texEnv
sy region texEnv matchgroup=texSubtleDelim start='{' end='}' contained concealends nextgroup=texEnvArgs


sy match texDelimiter '{' contained
sy match texDelimiter '{' contained
sy match texDelimiter '\[' contained
sy match texDelimiter '\]' contained

sy match texSubtleDelim '\\{' contained
sy match texSubtleDelim '\\{' contained
sy match texSubtleDelim '\['
sy match texSubtleDelim '\]'

" MATH REGIONS:
sy region texMath      start='\$'                end='\$'              contains=@texMathElements keepend
sy region texMath      start='\\('               end='\\)'             contains=@texMathElements keepend
sy region texMath      start='\\\['              end='\\\]'            contains=@texMathElements keepend
sy region texMath      start='\\begin{equation}' end='\\end{equation}' contains=@texMathElements keepend
sy region texMathAlign start='\\begin{align}'    end='\\end{align}'    contains=@texMathElements keepend
sy region texMath      start='\\begin{aligned}'  end='\\end{aligned}'  contains=@texMathElements keepend
sy region texMath      start='\\begin{gather}'   end='\\end{gather}'   contains=@texMathElements keepend
sy region texMath      start='\\begin{alignat}'  end='\\end{alignat}'  contains=@texMathElements keepend


" Math Delimiters
sy match texMathDelim '\$'                   contained
sy match texMathDelim '\\('                  contained
sy match texMathDelim '\\)'                  contained
sy match texMathDelim '\\\['                 contained
sy match texMathDelim '\\\]'                 contained
sy match texMathDelim '\\begin{equation}'    contained
sy match texMathDelim '\\end{equation}'      contained
sy match texMathDelim '\\begin{align}'       contained
sy match texMathDelim '\\end{align}'         contained
sy match texMathDelim '\\begin{aligned}'     contained
sy match texMathDelim '\\end{aligned}'       contained
sy match texMathDelim '\\begin{gather}'      contained
sy match texMathDelim '\\end{gather}'        contained
sy match texMathDelim '\\begin{alignat}'     contained
sy match texMathDelim '\\end{alignat}'       contained

sy match texMathMeta '\\label{.*}' contains=texReference
sy match texMathMeta '\\nonumber'  contained

sy cluster texMathElements contains=texMathMeta,texMathText,TexMathDelim,texNewLine

syntax match texTextFormat '\\emph\>' nextgroup=texEmphasis
syntax match texTextFormat '\\emph\>' nextgroup=texEmphasis contained
syntax match texTextFormat '\\highlight\>' nextgroup=texHighlight
syntax match texTextFormat '\\highlight\>' nextgroup=texHighlight contained
syntax match texTextFormat '\\textsc\>' nextgroup=texSCaps
syntax match texTextFormat '\\texttt\>' nextgroup=texMonospace
syntax match texTextFormat '\\underline\>' nextgroup=texUnderline
syntax match texTextFormat '\\textbf\>' nextgroup=texBold
syntax match texTextFormat '\\textbf\>' nextgroup=texBold contained
syntax region texEmphasis matchgroup=texSubtleDelim start='{' end='}' contained concealends
syntax region texBold matchgroup=texSubtleDelim start='{' end='}' contained
syntax region texUnderline matchgroup=texSubtleDelim start='{' end='}' contained
syntax region texSCaps matchgroup=texSubtleDelim start='{' end='}' contained concealends
syntax region texMonospace matchgroup=texSubtleDelim start='{' end='}' contained
syntax region texHighlight matchgroup=texSubtleDelim start='{' end='}' contained concealends

syntax cluster texFormats contains=texTextFormat

syntax match texSection '\\part\>' nextgroup=texHeading
syntax match texSection '\\section\>' nextgroup=texHeading
syntax match texSection '\\section\*' nextgroup=texHeading
syntax match texSection '\\subsection' nextgroup=texHeading
syntax match texSection '\\subsection\*' nextgroup=texHeading
syntax match texSection '\\subsubsection\>' nextgroup=texHeading
syntax match texSection '\\subsubsection\*' nextgroup=texHeading
syntax match texSection '\\paragraph\>' nextgroup=texHeading conceal
syntax region texHeading matchgroup=texSubtleDelim start='{' end='}' contained concealends

