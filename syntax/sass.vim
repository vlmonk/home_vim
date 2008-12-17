syn case ignore
syn keyword cssTagName body ul li a table

" colors
syn keyword cssColor white
syn match cssColor "\<transparent\>"
syn match cssColor contained "#[0-9A-Za-z]\{3}\>"
syn match cssColor contained "#[0-9A-Za-z]\{6}\>"




syn match cssId contained "#[a-zA-Z0-9-_]*\>"
syn match cssAttr contained "\_^\s*:[a-zA-Z-]*\>" 

syn region cssProp start='^\s*:' end='$' keepend contains=cssAttr,cssColor

" bad spaces
syn match sassSpaceError "^\(\s\s\)*\s\S"he=e-1

hi def link cssAttr Special
hi def link cssId Type
hi cssProp guifg=darkgreen
hi cssColor guifg=red
hi sassSpaceError guibg=red
