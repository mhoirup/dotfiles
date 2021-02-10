syn keyword pythonBoolean	False None True
hi! link pythonBoolean Constant

syn match   pythonNumber '\<0[oO]\=\o\+[Ll]\=\>'
syn match   pythonNumber '\<0[xX]\x\+[Ll]\=\>'
syn match   pythonNumber '\<0[bB][01]\+[Ll]\=\>'
syn match   pythonNumber '\<\%([1-9]\d*\|0\)[Ll]\=\>'
syn match   pythonNumber '\<\d\+[jJ]\>'
syn match   pythonNumber '\<\d\+[eE][+-]\=\d\+[jJ]\=\>'
syn match   pythonNumber '\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@='
syn match   pythonNumber '\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>'

" syn match pythonNumber '\d\+'
" syn match pythonNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

syn region pythonString start='"' end='"'
syn region pythonString start='\'' end='\''

syn keyword pythonStatement	as assert break continue del exec global
syn keyword pythonStatement	lambda nonlocal pass print return with yield
syn keyword pythonStatement	class def nextgroup=pythonFunction skipwhite
syn keyword pythonConditional	elif else if
syn keyword pythonRepeat	for while
syn keyword pythonOperator	and in is not or
syn keyword pythonException	except finally raise try
syn keyword pythonInclude	from import
syn keyword pythonAsync		async await

syn match   pythonComment	"#.*$" contains=pythonTodo,@Spell
hi! link pythonComment		Comment

hi! pythonOperator gui=bold



