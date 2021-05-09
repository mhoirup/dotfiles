" set wildmenu
" set wildmode=longest,list,full
colorscheme nord
set autoindent
set clipboard=unnamed
set cmdheight=1
set complete-=t
set completeopt=menuone,noselect
set cursorline
set expandtab
set foldmethod=manual
set formatoptions-=r
set hidden
set ignorecase
set laststatus=2
set lazyredraw
set mouse=a
set noruler
set noshowcmd 
set noshowmode
set noswapfile
set nowrap
set nowrap
set number
set shiftwidth=4
set shortmess+=F
set shortmess+=Otc
set showtabline=0
set signcolumn=yes
set softtabstop=4
set splitright
set statusline=%!MyStatus()
set tabline=%!MyTabLine()
set tabstop=4

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

if g:colors_name == 'nord'
    hi!      Comment        guifg=#616e88 gui=italic
    hi!      CursorLine                   guibg=#2e3440
    hi!      EndOfBuffer    guifg=#2e3440
    hi!      MatchParen                   guibg=None
    hi!      PmenuSel       guifg=#2e3440 guibg=#88c0d0
    hi!      Search         guifg=#2e3440 guibg=#ebcb8b
    hi!      StatusLine     guifg=#ebcb8b guibg=#2e3440
    hi!      VertSplit      guifg=#4c566a
    hi! link FloatermBorder Normal
    hi! link MsgArea        Comment
    hi! link Statement      Type
    hi! link StatusLineNC   Comment
    hi! link TabLine        GrayedOut
    hi! link TabLineFill    Normal
    hi! link TabLineSel     StatusLine
    hi! link TermCursorNC   EndOfBuffer
    hi! link healthSuccess  String
    hi! link healthWarning  Statusline
    hi! link qfError        Normal 
    hi! link qfFileName     Comment
    hi! link qfLineNr       Normal
    hi! link vimHiBang      vimHighlight
    hi! link vimIsCommand   vimCommand
elseif g:colors_name == 'blossom'
    hi! link StatusLine     Identifier
    hi!      EndOfBuffer    guifg=#ede6e3
elseif g:colors_name == 'marble'
    hi! link TabLineFill    Normal
    hi!      TabLineSel     gui=underline
    hi! link TabLine        Normal
endif

