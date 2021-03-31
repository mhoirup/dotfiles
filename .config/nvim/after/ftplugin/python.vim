if !exists('g:vscode')
    nnoremap <silent> <Space> :call SendToRepl()<CR>
    vnoremap <silent> <Space> :SlimeSend<CR>``
    nnoremap <silent> <leader>w yiw:SlimeSend1 <C-r>"<CR>
    nnoremap <silent> <leader>h yiw:SlimeSend1 pd.DataFrame(<C-r>").head()<CR>
    nnoremap <silent> <leader>s yiw:SlimeSend1 <C-r>".shape<CR>
    nnoremap <silent> <leader>df yiw:SlimeSend1 pd.DataFrame(<C-r>")<CR>
    nnoremap <silent> <leader>c :SlimeSend1 clear<CR>

    command! -nargs=* StartConsole call InitInteractive(<f-args>)
    nnoremap <silent> tt :StartConsole 'ipython' '-h'<cr>
    nnoremap <silent> th :StartConsole 'ipython' '-v'<cr>

    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set autoindent

    set syntax=python
    IndentLinesEnable
    silent! loadview
    autocmd! BufWritePost,FileWritePost <buffer> mkview
else
    nmap <silent> <leader>h <Cmd>call SendCustom(expand('<cword>').'.head()')<CR>
    nmap <silent> <leader>w <Cmd>call SendCustom(expand('<cword>'))<CR>
    nmap <silent> <leader>s <Cmd>call SendCustom(expand('<cword>').'.shape')<CR>
    nmap <silent> <leader>df <Cmd>call SendCustom('pd.DataFrame('.expand('<cword>').')')<CR>
endif
