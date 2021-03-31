setlocal laststatus=0
set tw=0
nmap <buffer> <silent> q :cclose<cr>
set nospell
set nonumber

augroup quickfix_autocmds
  autocmd!
  autocmd BufEnter,BufWinEnter,BufReadPost quickfix exe min([10, len(getqflist())]) . 'wincmd _'
augroup END
