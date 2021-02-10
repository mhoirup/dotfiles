if g:colors_name == 'onedark'
    hi link vimOper Normal
    hi link vimGroup VimOper
    hi link vimHiGroup VimOper
    hi link vimHiClear VimOper

    hi link vimString Character

    hi link vimFunction Function
    hi link vimUserFunc vimFunction
endif





hi! link vimIsCommand Statement
hi! link vimAutoEvent Normal

syntax match vimVar 'for'
syntax match vimExclamation '!'

syntax match vimPath '~/.*/'
