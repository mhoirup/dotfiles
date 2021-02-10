if g:colors_name == 'nord'

    hi link texFunction        Number
    hi link texSupportFunction texFunction
    hi link texItem            texFunction
    hi texEmphasis             guifg=#b48ead

    hi link texMath           Function
    hi link texMathAlign      texMath

    hi link texSection         Comment
    hi link texSubtleDelim     texSection
    hi link texFormatText      texSection
    hi link texLabel           texSection
    hi link texBeginEnd        texSection
    hi link texMathMeta        texSection
    hi link texMathDelim       texSection
    hi link texRefFun          texSection
    hi link texFootNote        texSection
    hi link texTextFormat      texSection

    hi link texHeading         SpecialChar
    hi link texNewLine         texHeading

    hi link texEnv             Character

    hi link texAlignmetChar    Type

    hi texReference            guifg=#d08770
    hi link texHyperLink       texReference
    hi link texHyperLinkText   texReference
    hi link texBold            texReference

elseif g:colors_name == 'marble'

    hi link texFunction        Statement
    hi link texSection         texFunction
    hi link texBeginEnd        texFunction
    hi link texItem            texFunction

    hi link texMath Constant
    hi link texMathDelim texMath
    hi link texMathAlign texMath

    " hi texSection         guifg=#999999
    " hi link texSubtleDelim     texSection
    " hi link texFormatText      texSection
    " hi link texLabel           texSection
    " hi link texBeginEnd        texSection
    " hi link texMathMeta        texSection
    " hi link texMathDelim       texSection
    " hi link texRefFun          texSection
    " hi link texFootNote        texSection

endif


" Syntax Specification

sy match texFunction '\\documentclass'
sy match texFunction '\\usepackage'
sy match texFunction '\\newcommand'
sy match texFunction '\\input'
sy match texFunction '\\footnote\>' nextgroup=texFootNote
sy match texFunction '\\noindent'

sy match texRefFun '\\eqref\>' nextgroup=texReference conceal
sy match texRefFun '\\ref\>' nextgroup=texReference conceal
sy match texRefFun '\\href\>' nextgroup=texHyperLink skipwhite
sy region texReference matchgroup=texSubtleDelim start='{' end='}' contained concealends
sy region texHyperLink matchgroup=texSubtleDelim start='{' end='}' 
            \ contained nextgroup=texHyperLinkText
sy region texHyperLinkText matchgroup=texSubtleDelim start='{' end='}' 
            \ contained

sy match texComment '%.*'
sy region texFootNote matchgroup=texSubtleDelim start='{' end='}'
            \ contained concealends contains=texMath

sy match texSupportFunction '\\newtheorem'
sy match texSupportFunction '\\DeclareMathOperator'
sy match texSupportFunction '\\numberwithin'

sy match texItem '\\item'

sy match texNewLine '\\\\'
sy match texAlignmetChar '&'

sy match texBeginEnd '\\begin\>' nextgroup=texEnv
sy match texBeginEnd '\\end\>' nextgroup=texEnv
sy region texEnv matchgroup=texSubtleDelim start='{' end='}' contained concealends


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
sy match texMathDelim '\\\['                 contained conceal
sy match texMathDelim '\\\]'                 contained conceal
sy match texMathDelim '\\begin{equation}'    contained conceal
sy match texMathDelim '\\end{equation}'      contained conceal
sy match texMathDelim '\\begin{align}'       contained conceal
sy match texMathDelim '\\end{align}'         contained conceal
sy match texMathDelim '\\begin{aligned}'     contained conceal
sy match texMathDelim '\\end{aligned}'       contained conceal
sy match texMathDelim '\\begin{gather}'      contained conceal
sy match texMathDelim '\\end{gather}'        contained conceal
sy match texMathDelim '\\begin{alignat}'     contained conceal
sy match texMathDelim '\\end{alignat}'       contained conceal

sy match texMathMeta '\\label{.*}' contains=texReference
sy match texMathMeta '\\nonumber'  contained

sy cluster texMathElements contains=texMathMeta,texMathText,TexMathDelim,texNewLine

syntax match texTextFormat '\\emph\>' nextgroup=texEmphasis
syntax match texTextFormat '\\underline\>' nextgroup=texUnderline
syntax match texTextFormat '\\textbf\>' nextgroup=texBold
syntax match texTextFormat '\\textbf\>' nextgroup=texBold contained
syntax region texEmphasis matchgroup=texSubtleDelim start='{' end='}' contained concealends
syntax region texBold matchgroup=texSubtleDelim start='{' end='}' contained
syntax region texUnderline matchgroup=texSubtleDelim start='{' end='}' contained

syntax match texSection '\\part\>' nextgroup=texHeading
syntax match texSection '\\section\>' nextgroup=texHeading
syntax match texSection '\\section\*' nextgroup=texHeading
syntax match texSection '\\subsection' nextgroup=texHeading
syntax match texSection '\\subsection\*' nextgroup=texHeading
syntax match texSection '\\subsubsection\>' nextgroup=texHeading
syntax match texSection '\\subsubsection\*' nextgroup=texHeading
syntax match texSection '\\paragraph\>' nextgroup=texHeading conceal
syntax region texHeading matchgroup=texSubtleDelim start='{' end='}' contained concealends

