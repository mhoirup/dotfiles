fun! MyStatus()
    hi! link GrayedOut Comment
    if g:colors_name == 'nord'
        hi StatusLine guifg=#ebcb8b guibg=#2e3440
    elseif g:colors_name == 'marble'
        hi link StatusLine Constant
    endif
    if &ft == 'fzf' || &ft == 'floaterm'
        hi! link StatusLine EndOfBuffer
        hi! link GrayedOut EndOfBuffer
    endif
    let statusline = ''
    let statusline .= '%#GrayedOut#'
    let statusline .= ''. expand('%:h') .'/'
    let statusline .= '%#StatusLine#'
    let statusline .= ''. expand('%:t')
    let statusline .= '%='
    let statusline .= '  %3p%%  %4l:%-3c'
    return statusline
endfun

fun! InteractiveConsole(command)
    execute 'term '.a:command
    set modifiable
    set laststatus=0
    hi! link LineNr EndOfBuffer
    hi! link TermCursor EndOfBuffer
    hi! link TermCursorNC EndOfBuffer
    set number
    if g:colors_name == 'nord'
        hi Normal guifg=#81a1c1 guibg=#2e3440
    endif
    stopinsert
    autocmd! FocusGained * stopinsert
    autocmd! FocusLost * startinsert
    startinsert
endfun

fun! InitInteractive(direction)
    let new_pane = str2nr(system('tmux display-message -p "#{window_panes}"')) + 1
    let command = 'tmux split-window '.a:direction.' -d nvim '
    call system(command . '"+call InteractiveConsole('.g:interactive[&ft].')"')
    let g:slime_default_config = {"socket_name": "default", "target_pane": ':.'.new_pane}
endfun

fun! SendToRepl()
    let chars = strcharpart(strpart(getline(line('.') + 1), col(0) - 1), 0, &ts)
    if chars == repeat(' ', &ts) && strlen(chars) != 0
        exe 'call feedkeys("{j", "x") | let start = line(".")'
        exe 'call feedkeys("}k", "x") | let end = line(".")'
        exe start . ',' . end . 'SlimeSend'
    else
        exe 'SlimeSend | call feedkeys("j0")'
    endif
endfun

fun! TmuxWindowName(...)
    if &ft != 'fzf'
        call system('tmux rename-window '. a:1)
    endif
endfun

fun! GetHighlight()
    let highlight = synIDattr(synID(line('.'), col('.'), 1), 'name')
    let transparency = synIDattr(synID(line('.'), col('.'), 0), 'name')
    let lowest = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    echo 'hi<'.highlight.'> trans<'.transparency.'> lo<'.lowest.'>'
endfun

fun! SourceConf()
    " Auto sourcing of tmux and zshrc
    if expand('%') == '.tmux.conf'
        silent !tmux source ~/.tmux.conf
    elseif expand('%') == '.zshrc'
        silent !. ~ .zshrc
    endif
endfun

fun! SuperTab()
    " Simlpe function initiate an UltiSnip jump, and if not executed, toggle
    " the completion menu
    let g:ulti_expand_or_jump_res = 0
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res ? "" : "\<c-n>"
endfun

fun! LinkGit()
    " Generates a link to the selected range of line numbers. Assumes that the
    " immediate folder under $HOME is the repo, i.e. if ~/dir1/dir2/file is
    " the path of the file, it's assumed that .git is located in dir1.
    " Must have git initialised.
    let fcomponents = split(expand('%'), '/')
    let url = system('cd '.fcomponents[0].' && git config --get remote.origin.url')
    let b:link = fnamemodify(url, ':r') . '/blob/master/'.join(fcomponents[1:], '/').'#L'.line("'<").'-L'.line("'>")
    exe 'redir @+ | silent! echo "'.b:link.'" | redir END'
endfun




