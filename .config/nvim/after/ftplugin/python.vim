nnoremap <silent> tt :call InitInteractive('-h')<CR>
nnoremap <silent> tv :call InitInteractive('-v -p 20')<CR>
nnoremap <silent> <Space> :call SendToRepl()<CR>
vnoremap <silent> <Space> :SlimeSend<CR>``
nnoremap <silent> <leader>w yiw:SlimeSend1 <C-r>"<CR>
nnoremap <silent> <leader>h yiw:SlimeSend1 pd.DataFrame(<C-r>").head()<CR>
nnoremap <silent> <leader>s yiw:SlimeSend1 <C-r>".shape<CR>
nnoremap <silent> <leader>df yiw:SlimeSend1 pd.DataFrame(<C-r>")<CR>
nnoremap <silent> <leader>c :SlimeSend1 clear<CR>

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set syntax=python
IndentLinesEnable
silent! loadview
autocmd! BufWritePost,FileWritePost <buffer> mkview
