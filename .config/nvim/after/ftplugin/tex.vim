nnoremap <silent> <s-b> :write<bar>VimtexCompile<CR>
nnoremap <buffer> j gj
nnoremap <buffer> k gk
nnoremap <buffer> $ g$
nnoremap <buffer> 0 g0
nnoremap <buffer> <s-i> ^i
inoremap <s-left> <c-o><s-left>
inoremap <s-right> <esc>g$i
inoremap <leader>? <c-g>u<esc>[s1z=`]a<c-g>u
inoremap <bs> <esc>xi
nnoremap <expr> <silent> <leader>f b:zen == 1 ? ':Goyo!<bar>let b:zen = 0<cr>':':Goyo 100<bar>let b:zen = 1<cr>'
let b:zen = 0


autocmd! User GoyoEnter nested set nonumber
autocmd! User GoyoLeave nested so ~/.config/nvim/init.vim | edit | set nonumber

setlocal spell
set spelllang=da,en_gb
set linebreak
setlocal nonumber
set tw=90
set syntax=tex-custom
set conceallevel=1

fun! SelectWord(word)
  exe 'normal! "_ciw'.a:word
endfun

fun! WordSuggestions()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("SelectWord"), 'down': 10 })
endfun

nnoremap <silent> <leader>s :call WordSuggestions()<CR>

if has('nvim') || has('gui_running')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2
endif
