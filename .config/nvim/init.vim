call plug#begin(stdpath('data') . '/plugged')

Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/AutoComplPop'
Plug 'voldikss/vim-floaterm'

call plug#end()

source ~/.config/nvim/configs/general.vim
source ~/.config/nvim/configs/functions.vim
source ~/.config/nvim/configs/plugins.vim

let mapleader = 'æ'

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>x\<bs>"
inoremap <s-left> <c-o>_
inoremap <s-right> <c-o>$
inoremap <silent> <tab> <c-r>=SuperTab()<cr>
inoremap åb+ <c-o>ciw<bs>
nnoremap + <s-o><esc>j
nnoremap <expr> <silent> q len(getbufinfo({'buflisted':1})) == 1 ? ':up<bar>q!<cr>':':up<bar>bd!<cr>'
nnoremap <leader>f za
nnoremap <s-tab> <<
nnoremap <silent> * *``
nnoremap <silent> <bs> :b#<cr>
nnoremap <silent> <s-p> :FloatermNew ranger ~<cr>
nnoremap <silent> <esc> :noh<cr>
nnoremap <silent> <leader>r :w!<bar>:so ~/.config/nvim/init.vim<bar>e!<bar>e!<cr>
nnoremap <silent> F :Files ~<cr>
nnoremap <silent> L ;
nnoremap <silent> M :call GetHighlight()<cr>
nnoremap <silent> mc :FloatermNew ranger ~/.config/nvim<cr>
nnoremap <silent> md :exe 'FloatermNew ranger '.expand('%:h')<cr>
nnoremap <silent> mr :FloatermNew ranger /usr/local/Cellar/neovim/HEAD-5b5848f/share/nvim/runtime<cr>
nnoremap <silent> åb+ :Buffers<cr>
nnoremap <tab> >>
nnoremap J 10j
nnoremap K 10k
tnoremap <esc> <c-\><c-n>
vnoremap <esc> <c-c>
vnoremap <leader>f zf
vnoremap <s-tab> <gv
vnoremap <silent> <leader>s :sort<cr>
vnoremap <tab> >gv
vnoremap J 10j
vnoremap K 10k

autocmd VimEnter * if @% == '' && &ft == '' | Files ~
autocmd BufEnter * if &ft == 'fzf' || &ft == 'floaterm' | set laststatus=0
autocmd FileType tex set syntax=tex-custom
autocmd FileType help nmap <buffer> <cr> <c-]>
autocmd FileType markdown set syntax=pandoc
autocmd BufRead * if expand('%') == '.Rprofile' | set syntax=r
autocmd FileType pyrex set ft=python

augroup tmux
    autocmd!
    autocmd VimEnter * call TmuxWindowName('nvim')
    autocmd BufWinEnter,BufRead,BufEnter,FocusGained * call TmuxWindowName(expand('%:t:r'))
    autocmd VimLeave * call TmuxWindowName('zsh')
    autocmd BufWritePost,FileWritePost * if &ft == 'tmux' || &ft == 'zsh' | call SourceConf()
augroup END
