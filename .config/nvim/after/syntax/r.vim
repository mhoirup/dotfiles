if g:colors_name == 'nord'
    hi rConstant guifg=#ebcb8b
    hi rBoolean  guifg=#ebcb8b
    hi rNumber   guifg=#b48ead
    hi rDollar   guifg=#81a1c1
    hi rPreProc  guifg=#81a1c1
    hi link rNameWSpace rDollar
endif
if g:colors_name == 'marble'
    hi! link rNumber   Constant
    hi! link rConstant Constant
    hi! link rBoolean  Constant
    hi! link rType     Statement
endif

