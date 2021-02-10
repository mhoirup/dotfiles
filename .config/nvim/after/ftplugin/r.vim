nnoremap <silent> tt :call InitInteractive('-h')<CR>
nnoremap <silent> tv :call InitInteractive('-v -p 20')<CR>
noremap <silent> <Space> :call SendToRepl()<CR>
noremap <silent> å57æ :call SendAboveToRepl()<CR>
noremap <silent> <leader>c :SlimeSend1 system('clear')<CR>
noremap <silent> <leader>g yiw:SlimeSend1 dplyr::glimpse(<C-r>")<CR>
noremap <silent> <leader>df yiw:SlimeSend1 tibble::as_tibble(<C-r>")<CR>
noremap <silent> <leader>w yiw:SlimeSend1 <C-r>"<CR>
noremap <silent> <leader>h yiw:SlimeSend1 head(<C-r>")<CR>
noremap <silent> <leader>n yiw:SlimeSend1 names(<C-r>")<CR>
noremap <silent> <leader>s yiw:SlimeSend1 dim(<C-r>")<CR>

command -nargs=1 Ip SlimeSend1 install.packages(<f-args>)

fun! SaveWorkSpace()
    let name = fnamemodify(expand('%:t'), ':r')
    exe 'SlimeSend1 save.image(".RWorkspaces/'.name.'.RData")'
endfun
command! SaveWorkSpace call SaveWorkSpace()

fun! LoadWorkSpace(name)
    let path = '.RWorkspaces/'.a:name
    exe 'SlimeSend1 load("'.path.'")'
endfun
command! -nargs=1 LoadWorkSpace :call LoadWorkSpace(<f-args>)
command! WorkSpaces call fzf#vim#files('~/.RWorkspaces/', {'sink': 'LoadWorkSpace'})

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

IndentLinesEnable
set syntax=r
silent! loadview
autocmd! BufWritePost,FileWritePost <buffer> mkview
