if g:colors_name == 'nord'
    hi!      pandocAtxStart           guifg=#ebcb8b
    hi! link pandocAtxHeader          pandocAtxStart
    hi! link yamlPlainScalar          pandocAtxStart
    hi!      yamlBlockMappingKey      guifg=#8fbcbb
    hi!      pandocEmphasis           guifg=#b48ead
    hi!      pandocDelimitedCodeBlock guifg=#a3be8c
    hi! link pandocPipeTableDelims    Type
    hi! link pandocNewLine            VertSplit
    hi! link texMathDelim             Comment
    hi! link texMathZone              Function
    hi! link texCmdGreek              Function
    hi!      pandocStrong             guifg=#d08770
    hi! link pandocListItemBulletId   pandocListItemBullet
    hi!      texMathZone              guifg=#88c0d0
endif

if g:colors_name == 'github'
    hi! link texMathDelimZone vimCommand
    hi! link texMathDelimMod vimCommand
    hi! link texMathSuperSub vimCommand
    hi! link texMathZoneX vimCommand
    hi! link texMathZoneXX vimCommand
    hi! link texMathSub vimCommand
    hi! link texMathOper vimCommand
    hi! link texMathSymbol vimCommand
    hi! link texMathGroup    vimCommand
    hi! link texDelim vimCommand
    hi! link texMathDelim vimCommand
    hi! link texMathCmd vimCommand
    hi! link texMathArg vimCommand
    hi! link texTabularChar vimCommand
    
    hi! link pandocDelimitedCodeBlock Constant

    hi! link pandocAtxHeader Statement
    
    hi! link pandocNewLine Normal
endif

" Relevant tex math rules have been commented out in the pandoc syntax
" file. Line 256 in ~/.local/share/nvim/plugged/vim-pandoc-syntax/syntax/pandoc.vim
syntax match texMathDelim '\$' contained
syntax match texMathDelim '\$\$' contained
syntax region texMathZone  matchgroup=texMathDelim start='\$' end='\$' concealends
syntax region texMathZone  matchgroup=texMathDelim start='\$\$' end='\$\$' concealends

