fun! MyStatus()
    if g:colors_name == 'marble'
        hi! link GrayedOut  Normal
        hi! link StatusLine Normal
    elseif g:colors_name == 'nord'
        hi! link GrayedOut Comment
    elseif g:colors_name == 'github'
        hi! link GrayedOut  Normal
        hi! link StatusLine Normal
    endif
    let path = expand('%:h')
    let file = expand('%:t')
    if &ft == 'fzf' || &ft == 'floaterm'
        let path = expand('#:h')
        let file = expand('#:t')
    endif
    let statusline = '%#StatusLine#'
    let statusline .= ''
    if expand('%') != ''
        let statusline .= '%#GrayedOut#'
        let statusline .= ''.path.'/'
        let statusline .= '%#StatusLine#'
        let statusline .= ''.file
        let statusline .= '%='
        if &ft == 'tex' && len(getqflist()) > 0
            let statusline .= ''.len(getqflist()).'E '
        endif
        let statusline .= '%#GrayedOut#'
        let statusline .= '%4l:%-2c '
    endif
    return statusline
endfun

function! MyTabLine()
  let tabline = ''
  for i in range(tabpagenr('$'))
    let tabnr = i + 1 " range() starts at 0
    let winnr = tabpagewinnr(tabnr)
    let buflist = tabpagebuflist(tabnr)
    let bufnr = buflist[winnr - 1]
    let bufname = fnamemodify(bufname(bufnr), ':t')
    if &ft == 'fzf' || &ft == 'floaterm'
        let bufname = expand('#:t')
    endif 
    let tabline .= '%' . tabnr . 'T'
    let tabline .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let n = tabpagewinnr(tabnr,'$')
    let tabline .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '
    " let bufmodified = getbufvar(bufnr, "&mod")
    " if bufmodified | let tabline .= '+ ' | else | let tabline .= '  ' | endif
  endfor
  let tabline .= '%#TabLineFill#'
  return tabline
endfunction

fun! PreviousBuffer()
    let prevbuf = bufnr('#')
    let tab = 0
    for i in range(1, tabpagenr('$'))
        for buf in tabpagebuflist(i)
            if buf == prevbuf
                let tab = i
            endif
        endfor
    endfor
    if tab != 0
        execute 'tabn '.tab
    else
        execute 'b#'
    endif
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
endfun

fun! InitInteractive(command, direction)
    let new_pane = str2nr(system('tmux display-message -p "#{window_panes}"')) + 1
    let command = 'tmux split-window '.a:direction.' -d nvim '
    call system(command . '"+call InteractiveConsole('.a:command.')"')
    let b:slime_default_config = {"socket_name": "default", "target_pane": ':.'.new_pane}
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
    " Simple function to initiate an UltiSnip jump, and if not executed, toggle
    " the completion menu
    let g:ulti_expand_or_jump_res = 0
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res ? "" : "\<C-n><C-n>"
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

let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        set laststatus=2
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    elseif len(getqflist()) > 0
        set laststatus=2
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
        wincmd p
    endif
endfunction

fun! IsIndent(line, indentation)
    let first_chars = strcharpart(strpart(getline(a:line + 0), col(0) - 1), 0, a:indentation)
    return first_chars == repeat(' ', a:indentation) && strlen(first_chars) != 0
endfun

fun! Surround(s1, s2) range
  exe "normal vgvmboma\<Esc>"
  normal `a
  let lineA = line(".")
  let columnA = col(".")
  normal `b
  let lineB = line(".")
  let columnB = col(".")
  " exchange marks
  if lineA > lineB || lineA <= lineB && columnA > columnB
    " save b in c
    normal mc
    " store a in b
    normal `amb
    " set a to old b
    normal `cma
  endif
  exe "normal `ba" . a:s2 . "\<Esc>`ai" . a:s1 . "\<Esc>"
endfun

