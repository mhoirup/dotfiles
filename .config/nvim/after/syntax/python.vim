if g:colors_name == 'nord'
syntax match cythonDefinition 'cdef'
hi link cythonDefinition    pythonStatement

hi link pythonClass         pythonFunction
hi link pythonAttribute     pythonFunctionCall

hi link pythonStatement     Type
hi link pythonConditional   Type
hi link pythonDottedName    Type
hi link pythonDot           Type
hi link pythonOperator      Type

hi      pythonStrFormat     guifg=#ebcb8b
hi link pythonNone          pythonStrFormat
hi link pythonBoolean       pythonStrFormat
hi link pythonStrFormatting pythonStrFormat
endif

syntax match PythonArgument '\v[\(\,]\s{-}\zs\w+\ze\s{-}\=(\=)@!(\_s)@!'

