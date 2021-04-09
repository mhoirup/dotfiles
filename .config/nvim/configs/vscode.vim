set clipboard=unnamedplus

fun! IsIndent(line, indent)
    let first_chars = strcharpart(strpart(getline(a:line + 0), col(0) - 1), 0, a:indent)
    return first_chars == repeat(' ', a:indent) && strlen(first_chars) != 0
endfun

fun! SendText(command)
    let indent = 4
    let chars = strcharpart(strpart(getline(line('.') + 1), col(0) - 1), 0, indent)
    if chars == repeat(' ', indent) && strlen(chars) != 0
        exe 'call feedkeys("{j", "x") | let start = line(".")'
        exe 'call feedkeys("}", "x") | let end = line(".")'
        call VSCodeNotifyRange(a:command, start, end, 1)
    else
        call VSCodeNotify(a:command)
        if a:command == 'python.execSelectionInTerminal'
            call feedkeys("j", "x")
        endif
    endif
endfun

fun! SaveAndExitBuffer()
    call VSCodeNotify('workbench.action.files.save')
    call VSCodeNotify('workbench.action.closeActiveEditor')
endfun

fun! ClearTerminal()
    call VSCodeNotify('workbench.action.terminal.clear')
    call VSCodeNotify('workbench.action.focusPreviousGroup')
endfun

fun! NewTerminal()
    call VSCodeNotify('workbench.action.terminal.new')
    call VSCodeNotify('workbench.action.focusPreviousGroup')
endfun

fun! SendCustom(command)
    call VSCodeNotify('workbench.action.terminal.sendSequence', { 'text': a:command . "\u000D"})
endfun


let mapleader = 'æ'
nmap <silent> <leader>c :call ClearTerminal()<CR>
nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nmap + <S-o><ESC>j
nmap <silent> * *``
nnoremap <S-g> Gzz
nmap <S-tab> <<
nmap <TAB> >>
nmap <silent> <ESC> :noh<cr>
nmap <silent> q :call SaveAndExitBuffer()<CR>
nmap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
omap gc  <Plug>VSCodeCommentary
vmap <S-Tab> <gv
vmap <S-j> 5j
vmap <S-k> 5k
vmap <Tab> >gv
xmap gc  <Plug>VSCodeCommentary
vmap x d
