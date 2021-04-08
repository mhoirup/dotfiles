if !exists('g:vscode')
call plug#begin(stdpath('data') . '/plugged')

Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/AutoComplPop'
Plug 'voldikss/vim-floaterm'
Plug 'karb94/neoscroll.nvim'

call plug#end()

source ~/.config/nvim/configs/general.vim
source ~/.config/nvim/configs/functions.vim
source ~/.config/nvim/configs/plugins.vim

let mapleader = 'æ'

" nnoremap <silent> <C-h> :tabp<CR>
" nnoremap <silent> <C-l> :tabn<CR>
inoremap <S-left> <C-o>_
inoremap <S-right> <C-o>$
inoremap <expr> <C-j> pumvisible() ? '<C-n>' : '<C-j>'
inoremap <expr> <C-k> pumvisible() ? '<C-p>' : '<C-k>'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>x\<BS>"
inoremap åb+ <C-o>ciw<BS>
nmap <S-h> <C-u>
nmap <S-l> <C-d>
nnoremap & ma
nnoremap + <S-o><ESC>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-g> Gzz
nnoremap <S-j> 10j
nnoremap <S-k> 10k
nnoremap <S-tab> <<
nnoremap <TAB> >>
nnoremap <expr> <silent> q len(getbufinfo({'buflisted':1})) == 1 ? ':up<bar>q!<CR>':':up<bar>bd!<CR>'
nnoremap <leader>bb caw[<left><C-o>p]<Esc>
nnoremap <leader>f za
nnoremap <leader>m :echo 'test'<CR>
nnoremap <leader>q ciw'<left><C-o>p'<Esc>
nnoremap <silent> * *``
nnoremap <silent> <BS> :call PreviousBuffer()<CR>
nnoremap <silent> <C-p> :FloatermNew ranger ~<CR>
nnoremap <silent> <ESC> :noh<cr>
nnoremap <silent> <S-f> :Files ~<CR>
nnoremap <silent> <S-m> :call GetHighlight()<CR>
nnoremap <silent> <leader>d :exe 'FloatermNew ranger '.expand('%:h')<CR>
nnoremap <silent> <leader>r :w!<bar>:so ~/.config/nvim/init.vim<bar>e!<CR>
nnoremap <silent> <leader>t :call system('tmux splitw -l 20')<CR>
nnoremap <silent> åb+ :Buffers<CR>
nnoremap m q
tnoremap <Esc> <C-\><C-n>
vnoremap <Esc> <C-c>
vnoremap <S-Tab> <gv
vnoremap <S-j> 10j
vnoremap <S-k> 10k
vnoremap <Tab> >gv
vnoremap <leader>f zf

command! RunTime FloatermNew ranger /usr/local/Cellar/neovim/HEAD-5b5848f/share/nvim/runtime

autocmd FileType fzf set laststatus=2
" autocmd VimEnter * if @% == '' && &ft == '' | Files ~
autocmd FileType help nmap <buffer> <cr> <c-]>
autocmd BufRead * if expand('%') == '.Rprofile' | set syntax=r
autocmd BufAdd,BufReadPost,BufEnter * filetype detect
autocmd FileType tex set syntax=tex-custom
autocmd FileType markdown set syntax=pandoc
autocmd FileType floaterm tmap <buffer> <esc> q
autocmd BufLeave,BufWinLeave * if &ft == 'tex' || &ft == 'markdown' | set nospell

augroup tmux
  autocmd!
  autocmd VimEnter * call TmuxWindowName('nvim')
  autocmd BufWinEnter,BufRead,BufEnter,FocusGained,FileWritePost * call TmuxWindowName(expand('%:t'))
  autocmd VimLeave * call TmuxWindowName('zsh')
  autocmd BufWritePost,FileWritePost * if &ft == 'tmux' || &ft == 'zsh' | call SourceConf()
augroup END
else
source ~/.config/nvim/configs/vscode.vim
endif
