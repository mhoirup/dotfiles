if !exists('g:vscode')
    inoremap <bs> <esc>xi
    inoremap <leader>? <c-g>u<esc>[s1z=`]a<c-g>u
    inoremap <s-left> <c-o><s-left>
    inoremap <s-right> <esc>g$i
    nnoremap <silent> <leader>e :call QuickfixToggle()<cr>
    nnoremap <silent> <s-b> :write<bar>VimtexCompile<cr><cr>
    nnoremap <silent> <leader>c :VimtexClean<cr><cr>
    nnoremap <buffer> <silent> <leader>s :call ToggleSpelling()<cr>

    fun! ToggleSpelling()
        if exists('b:spcheck')
            exe 'setlocal nospell | unlet b:spcheck'
        else
            exe 'setlocal spell | let b:spcheck = 1'
        endif
    endfun

    setlocal spelllang=da,en_gb
    set linebreak
    set tw=75
    set nowrap
    set syntax=tex-custom
    set conceallevel=1

    fun! AsImage(name)
        let path = expand('%:p:r')
        exe '! pdfcrop '.path.'.pdf'
        exe '! convert -density 300 '.path.'-crop.pdf -quality 90 ~/mhoirup.github.io/images/'.a:name.'-equations.png'
    endfun
    command! -nargs=1 AsImage call AsImage(<f-args>)
endif

