" EDIFACT vim syntax file
" v0.4
" Cyril Deguet <asmax@via.ecp.fr>

if exists("b:current_syntax")
    finish
endif

syn case match

syn match ediSep /\(+\|'&\?\)/
syn match ediCompSep /:/ contained
syn match ediResp /^''/ contained
syn match ediElem "+[^+'&]*" contains=ediSep,ediCompSep,ediRegex,ediVar
syn match ediComment "^'.*$"
syn match ediTag /'\{,2}[A-Z]\{3}/hs=e-2 contains=ediResp
syn region ediRegex start="{" end="}" contained contains=ediVar
syn region ediVar start="%" end="%" contained
syn match ediUNB /'\{,2}UNB/hs=e-2 contains=ediResp
syn match ediUNZ /'\{,2}UNZ/hs=e-2 contains=ediResp
syn match ediUNT /'\{,2}UNT/hs=e-2 contains=ediResp
syn match ediUNH "'\{,2}UNH+[0-9]*+[A-Z]\+:[^+]*" contains=ediResp,ediUNHtag,ediCompSep
syn match ediUNHtag "UNH" contained nextgroup=ediUNHfill
syn region ediUNHfill start="+[0-9]*+" matchgroup=ediUNHmsg end="[A-Z]\+" contained contains=ediSep,ediCompSep

hi def link ediTag Type
hi def link ediSep Statement
hi def link ediCompSep Comment
hi def link ediResp Special
hi def link ediRegex MemberVar
hi def link ediVar Macro
hi def link ediComment Comment
hi def link ediUNB Keyword
hi def link ediUNZ Keyword
hi def link ediUNT Keyword
hi def link ediUNHtag Keyword
hi def link ediUNHmsg Identifier

let b:current_syntax = "edifact"
