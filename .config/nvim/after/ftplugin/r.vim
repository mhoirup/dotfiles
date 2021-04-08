if !exists('g:vscode')

nnoremap <silent> tt :call InitInteractive('-h')<CR>
noremap <silent> tv :call InitInteractive('-v -p 20')<CR>
noremap <silent> <Space> :call SendToRepl()<CR>
noremap <silent> <leader>c :SlimeSend1 system('clear')<CR>
noremap <silent> <leader>C :SlimeSend1 rm(list = ls())<CR>
noremap <silent> <leader>g yiw:SlimeSend1 dplyr::glimpse(<C-r>")<CR>
noremap <silent> <leader>df yiw:SlimeSend1 tibble::as_tibble(<C-r>")<CR>
noremap <silent> <leader>w yiw:SlimeSend1 <C-r>"<CR>
noremap <silent> <leader>h yiw:SlimeSend1 head(<C-r>")<CR>
noremap <silent> <leader>n yiw:SlimeSend1 names(<C-r>")<CR>
noremap <silent> <leader>s yiw:SlimeSend1 dim(<C-r>")<CR>

command! -nargs=* StartConsole call InitInteractive(<f-args>)

nnoremap <silent> tt :StartConsole 'R' '-h'<cr>
nnoremap <silent> th :StartConsole 'R' '-v'<cr>

command -nargs=1 Ip SlimeSend1 install.packages(<f-args>)
command -nargs=1 IpGitHub SlimeSend1 devtools::install_github(<f-args>)

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

else

nmap <silent> <leader>g <Cmd>call SendCustom('dplyr::glimpse('.expand('<cword>').')')<CR>
nmap <silent> <leader>h <Cmd>call SendCustom('head('.expand('<cword>').')')<CR>
nmap <silent> <leader>n <Cmd>call SendCustom('names('.expand('<cword>').')')<CR>
nmap <silent> <leader>s <Cmd>call SendCustom('summary('.expand('<cword>').')')<CR>
nmap <silent> <leader>w <Cmd>call SendCustom('look('.expand('<cword>').')')<CR>
    
endif    
