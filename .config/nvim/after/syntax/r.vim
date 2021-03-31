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

" syntax match rArgument '\v[\(\,]\s{-}\zs\w+\ze\s{-}\=(\=)@!(\_s)@!'
" syntax match rArgument '\v[\(\,]\s{-}\zs\w+\ze\s{-}\=(\=)@!'


" syntax match rArgument '\v[\(\,]\s{-}\zs\w+\ze\s{-}\=(\=)@!'

" syntax match rOperator '::' nextgroup=rFunction

" syntax clear rRegion
" syntax clear rError

" syntax match rStorageType '\vc\ze[\(]'
" syntax match rStorageType '\vlist\ze[\(]'
" syntax match rStorageType '\vdata.frame\ze[\(]'

" syntax match rFunction '\v\zs\w+\ze\s{-}\<\-\s{-}function'
" syntax match rFunction '\v[::]\zs\w+\ze\s'
" syntax match rFunction '\v[::]\zs\w+\ze[\)]'
