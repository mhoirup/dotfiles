inoremap <leader>? <c-g>u<esc>[s1z=`]a<c-g>u
nnoremap <expr> <silent> <leader>g b:zen == 1 ? ':Goyo!<bar>let b:zen = 0<cr>':':Goyo 100<bar>let b:zen = 1<cr>'

let b:zen = 0
autocmd! User GoyoEnter nested set nonumber
autocmd! User GoyoLeave nested so ~/.config/nvim/init.vim | edit!

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

fun! UpDate()
    let date = strftime('%Y-%m-%d')
    if expand('%:p:h') == '/Users/marc/mhoirup.github.io/_posts' && date != strcharpart(expand('%:t'), 0, 10)
        exe 'saveas '. expand('%:p:h').'/'.date.'-'.strcharpart(expand('%:t'), 11)
        call delete(expand('#'))
        exe 'bprevious | bdelete' 
    endif
endfun


fun! ChangeDate()
    if expand('%:p:h') == '/Users/marc/mhoirup.github.io/_posts'
        let current_date = strftime('%Y-%m-%d')
        if current_date != strcharpart(expand('%:t'), 0, 10)
            exe 'saveas '. expand('%:p:h').'/'.current_date.'-'.strcharpart(expand('%:t'), 11)
            call delete(expand('#'))
            exe 'bprevious | bdelete' 
        endif
    endif
endfun

