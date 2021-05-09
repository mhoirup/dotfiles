if !exists('g:vscode')
call plug#begin(stdpath('data') . '/plugged')

" Plug 'jpalardy/vim-slime'
" Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kdav5758/TrueZen.nvim'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-signify'
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

inoremap <S-left> <C-o>_
inoremap <S-right> <C-o>$
inoremap <expr> <C-j> pumvisible() ? '<C-n>' : '<C-j>'
inoremap <expr> <C-k> pumvisible() ? '<C-p>' : '<C-k>'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>x\<BS>"
" inoremap <expr> <S-Tab> pumvisible() ? '<C-p>':'<C-d>'
" inoremap <expr> <Tab> pumvisible() ? '<C-n>':'<C-t>'
inoremap åb+ <C-w>
nnoremap & ma
nnoremap + <S-o><ESC>j
nnoremap <S-g> Gzz
nnoremap <S-j> 10j
nnoremap <S-k> 10k
nnoremap <S-tab> <<
nnoremap <TAB> >>
nnoremap <expr> <silent> q len(getbufinfo({'buflisted':1})) == 1 ? ':up<bar>q!<CR>':':up<bar>bd!<CR>'
nnoremap <leader>bb caw[<left><C-o>p]<left><BS><ESC>wa<Space><Esc>
nnoremap <leader>bc caw{<left><C-o>p}<left><BS><ESC>wa<Space><Esc>
nnoremap <leader>bp caw(<left><C-o>p)<left><BS><ESC>wa<Space><Esc>
nnoremap <leader>bq caw'<left><C-o>p'<left><BS><ESC>wa<Space><Esc>
nnoremap <leader>f za
nnoremap <leader>q ciw'<left><C-o>p'<Esc>
nnoremap <silent> * *``
nnoremap <silent> <BS> :call PreviousBuffer()<CR>
nnoremap <silent> <C-f> :Files ~<CR>
nnoremap <silent> <C-p> :FloatermNew ranger ~<CR>
nnoremap <silent> <ESC> :noh<cr>
nnoremap <silent> <S-m> :call GetHighlight()<CR>
nnoremap <silent> <leader>conf :exe 'FloatermNew ranger ~/.config/nvim'<CR>
nnoremap <silent> <leader>dir :exe 'FloatermNew ranger '.expand('%:h')<CR>
nnoremap <silent> <leader>r :w!<bar>:so ~/.config/nvim/init.vim<bar>e!<CR>
nnoremap <silent> <leader>t :call system('tmux splitw -l 20')<CR>
nnoremap <silent> åb+ :Buffers<CR>
nnoremap <silent> <leader>z :TZAtaraxis<CR>
nnoremap m q
tnoremap <Esc> <C-\><C-n>
vmap <S-Tab> <gv
vmap <Tab> >gv
vnoremap <Esc> <C-c>
vnoremap <S-j> 10j
vnoremap <S-k> 10k
vnoremap <leader>bp c(<C-o>p)<Esc>F(lxf)a<Space><Esc>
vnoremap <leader>f zf

command! RunTime FloatermNew ranger /usr/local/Cellar/neovim/HEAD-5b5848f/share/nvim/runtime

autocmd FileType fzf set laststatus=2
" autocmd VimEnter * if @% == '' && &ft == '' | Files ~
autocmd FileType help nmap <buffer> <cr> <c-]>
autocmd BufRead,BufAdd,BufEnter,BufReadPost * if expand('%') == '.Rprofile' | set syntax=r
autocmd BufAdd,BufReadPost,BufEnter,BufRead * filetype detect
" autocmd BufRead,BufEnter,BufWinEnter * exe 'set syntax='.expand('%:e')
autocmd BufRead,BufEnter,BufWinEnter *.vim set syntax=vim
autocmd BufRead,BufEnter,BufWinEnter *.md set syntax=pandoc
autocmd BufRead,BufEnter,BufWinEnter *.tex set syntax=tex-custom
autocmd BufRead,BufEnter,BufWinEnter *.yml set syntax=yaml
autocmd BufRead,BufEnter,BufWinEnter *.py set syntax=python
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
