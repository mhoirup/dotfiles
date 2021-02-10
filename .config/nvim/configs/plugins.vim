let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:tex_flavor="latex"
let g:vimtex_compiler_latexmk = {'continuous' : 0}

let indentLine_showFirstIndentLevel = 1
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_enabled = 0

if g:colors_name == 'nord'
    let g:indentLine_color_gui = '#434c5e'
elseif g:colors_name == 'marble'
    let g:indentLine_color_gui = '#cccccc'
endif

let g:slime_target = 'tmux'
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
let g:slime_python_ipython = 1
let g:slime_dont_ask_default = 1
let g:slime_preserve_curpos = 1

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:fzf_preview_window = ''
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'border':'sharp'}}

if g:colors_name == 'nord'
    let g:fzf_colors = 
        \ { 'fg':      ['fg', 'Normal'   ],
        \   'bg':      ['bg', 'Normal'   ],
        \   'hl':      ['fg', 'SpellCap' ],
        \   'fg+':     ['fg', 'Normal'   ],
        \   'bg+':     ['bg', 'Normal'   ],
        \   'hl+':     ['fg', 'SpellCap' ],
        \   'info':    ['fg', 'Comment'  ],
        \   'border':  ['fg', 'Comment'  ],
        \   'prompt':  ['fg', 'Boolean'  ],
        \   'pointer': ['fg', 'Boolean'  ],
        \   'marker':  ['fg', 'Boolean'  ],
        \   'spinner': ['fg', 'Label'    ],
        \   'header':  ['fg', 'Comment'  ],
        \   'gutter':  ['bg', 'Normal'   ]
        \ }
elseif g:colors_name == 'marble'
    let g:fzf_colors = 
        \ { 'fg':      ['fg', 'Normal'   ],
        \   'bg':      ['bg', 'Normal'   ],
        \   'hl':      ['fg', 'Constant' ],
        \   'fg+':     ['fg', 'Normal'   ],
        \   'bg+':     ['bg', 'Normal'   ],
        \   'hl+':     ['fg', 'Constant' ],
        \   'info':    ['fg', 'Comment'  ],
        \   'border':  ['fg', 'Normal'   ],
        \   'prompt':  ['fg', 'Boolean'  ],
        \   'pointer': ['fg', 'Boolean'  ],
        \   'marker':  ['fg', 'Boolean'  ],
        \   'spinner': ['fg', 'Label'    ],
        \   'header':  ['fg', 'Comment'  ],
        \   'gutter':  ['bg', 'Normal'   ]
        \ }
endif

let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0
