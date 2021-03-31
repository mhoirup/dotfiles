if g:colors_name == 'theta'
    hi link VimUserFunc VimFuncName
    hi link VimOper     Normal
endif

syntax match vimVar 'for'
syntax match vimNotFunc 'endif'
syntax match vimNotFunc 'endfun'
syntax match vimNotFunc 'fun '
syntax match vimNotFunc 'fun!'
syntax match vimExclamation '!'

syntax match vimPath '~/.*/'
syntax match vimEnvironment '*\:'
