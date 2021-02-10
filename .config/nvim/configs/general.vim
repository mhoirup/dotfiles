set hidden
set cmdheight=1
set shortmess+=c
set complete-=t
set completeopt=menuone,noselect
set wildmode=longest,list,full
set wildmenu
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
colorscheme nord

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set number
set noswapfile
set noruler
set mouse=a
set clipboard=unnamed
set foldmethod=manual
set splitright
set laststatus=2
set statusline=%!MyStatus()

set noshowmode 
set noshowcmd 
set shortmess+=F
set lazyredraw

if g:colors_name == 'nord'
    hi! link healthSuccess  String
    hi! link healthWarning  Statusline
    hi! link Statement      Type
    hi! link MsgArea        Comment
    hi! link VertSplit      Comment
    hi!      EndOfBuffer    guifg=#2e3440
    hi!      CursorLine     guibg=#2e3440
    hi!      MatchParen     guifg=None    guibg=None    gui=underline
    hi!      PmenuSel       guifg=#2e3440 guibg=#88c0d0
    hi!      Search         guifg=#2e3440 guibg=#ebcb8b
    hi! link TermCursor     EndOfBuffer
    hi! link TermCursorNC   EndOfBuffer
    hi! link FloatermBorder Normal
endif
