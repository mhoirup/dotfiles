
if g:colors_name == 'marble'
    hi! link snipSnippetTrigger Normal
    hi! link snipTabStop        Constant
    hi! link snipMirror         Constant

endif

if g:colors_name == 'nord'
    hi snipSnippetTrigger    guifg=#88c0d0
    hi snipTabStop           guifg=#ebcb8b
    hi snipSnippetOptionFlag guifg=#b48ead
    hi snipMirror            guifg=#ebcb8b
    hi snipLeadingSpaces     guifg=#2e3440 guibg=#2e3440
    hi link snipContextValue snipContextKeyword
endif
