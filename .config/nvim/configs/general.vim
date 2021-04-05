set hidden
set cmdheight=1
set shortmess+=Otc
set complete-=t
set completeopt=menuone,noselect
" set wildmode=longest,list,full
" set wildmenu
set formatoptions-=r
let g:python3_host_prog = '/usr/local/bin/python3'

" Dictionary with used repls
let g:interactive = {
    \ 'python': '\"ipython\"',
    \ 'cython': '\"ipython\"',
    \ 'r'     : '\"R --silent\"'
    \ }

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme github

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
" set nowrap
set cursorline

set number
set noswapfile
set noruler
set mouse=a
set clipboard=unnamed
set foldmethod=manual
set splitright
set laststatus=2
set statusline=%!MyStatus()
set tabline=%!MyTabLine()

set noshowmode 
set noshowcmd 
set shortmess+=F
set lazyredraw

if g:colors_name == 'nord'
    hi!      EndOfBuffer    guifg=#2e3440
    hi!      MatchParen     guifg=None    guibg=None    gui=underline
    hi!      PmenuSel       guifg=#2e3440 guibg=#88c0d0
    hi!      Search         guifg=#2e3440 guibg=#ebcb8b
    hi!      VertSplit      guifg=#4c566a
    hi! link FloatermBorder Normal
    hi! link MsgArea        Comment
    hi! link Statement      Type
    hi! link StatusLineNC   Comment
    hi! link TermCursorNC   EndOfBuffer
    hi! link healthSuccess  String
    hi! link healthWarning  Statusline
    hi! link qfError        Normal 
    hi! link qfFileName     Comment
    hi! link qfLineNr       Normal
    hi! link TabLineFill    Normal
    hi! link TabLineSel     StatusLine
    hi! link TabLine        GrayedOut
    hi!      StatusLine     guifg=#ebcb8b guibg=#2e3440
    hi!      Comment        guifg=#616e88 gui=italic
elseif g:colors_name == 'blossom'
    hi! link StatusLine     Identifier
    hi!      EndOfBuffer    guifg=#ede6e3
elseif g:colors_name == 'marble'
    hi! link TabLineFill    Normal
    hi!      TabLineSel     gui=underline
    hi! link TabLine        Normal
endif

