if g:colors_name == 'github'
    hi! link pandocMath vimCommand
endif

syntax region pandocMath start='\$' end='\$' concealends


syntax region pandocCodeBlock start='```' end='```'


sy match pandocMathDelim '\$' contained


