" Middleware tracer vim syntax file
" v0.1
" Olivier Teuliere <ipkiss@via.ecp.fr>

if exists("b:current_syntax")
    finish
endif

syn case match

":runtime! syntax/edifact.vim
":unlet b:current_syntax


" LOG LEVEL:
" TODO: extend the patterns across EOF, until the next start of message
syn match trcSpecial /\c\<exception\>/ contained
syn match trcSegFaultStack /^\(\#[0-9].*\)/ contains=trcSpecial
syn match trcStat /^\(.* STAT .*\)/ contains=trcSpecial
syn match trcDbg /^\(.* DBG .*\)/ contains=trcSpecial
syn match trcTst /^\(.* TST .*\)/ contains=trcSpecial
syn match trcInfo /^\(.* INFO .*\)/ contains=trcSpecial
syn match trcNot /^\(.* NOT .*\)/ contains=trcSpecial
syn match trcWarn /^\(.* WARN .*\)/ contains=trcSpecial
syn match trcError /^\(.* ERROR .*\)/ contains=trcSpecial
syn match trcCrit /^\(.* CRIT .*\)/ contains=trcSpecial
syn match trcFatal /^\(.* FATAL .*\)/ contains=trcSpecial
syn match trcSender " SENDER: " contains=trcSender
syn match trcReceiver " RECEIVER: " contains=trcReceiver

" Bright colorcheme:
"hi trcSpecial guifg=darkblue guibg=white ctermfg=darkred
"hi trcStat  guifg=grey ctermfg=darkgrey
"hi trcDbg   guifg=grey ctermfg=black
"hi trcTst   guifg=grey ctermfg=black
"hi trcInfo  guifg=cyan ctermfg=21
"hi trcNot   guifg=green ctermfg=21
"hi trcWarn  guifg=yellow ctermfg=brown
"hi trcError guifg=red ctermfg=darkred
"hi trcCrit  guifg=black guibg=red ctermfg=white ctermbg=red
"hi trcFatal guifg=black guibg=purple ctermfg=green ctermbg=white
"hi trcSender guifg=black guibg=purple ctermfg=darkmagenta ctermbg=white
"hi trcReceiver guifg=black guibg=purple ctermfg=darkmagenta ctermbg=white

" Dark colorcheme:
hi trcSpecial ctermfg=9
hi trcStat  ctermfg=252
hi trcDbg   ctermfg=254
hi trcTst   ctermfg=254
hi trcInfo  ctermfg=123
hi trcNot   ctermfg=252
hi trcWarn  ctermfg=214
hi trcError ctermfg=9
hi trcSegFaultStack ctermfg=9
hi trcCrit  ctermfg=255 ctermbg=1
hi trcFatal  ctermfg=255 ctermbg=1
hi trcSender ctermfg=255 ctermbg=33
hi trcReceiver ctermfg=255 ctermbg=28

" EDIFACT:
syn match ediSep /\(+\|'&\?\)/
syn match ediCompSep /:/ contained
syn match ediElem "+[^+'&]*" contains=ediSep,ediCompSep,ediCONTRL
syn match ediTag /'\{1,2}[A-Z]\{3}/
syn match ediCONTRL "\<CONTRL\>"
syn match ediUNB /'\{,2}UNB/
syn match ediUNZ /'\{,2}UNZ/
syn match ediUNT /'\{,2}UNT/
syn match ediUNH "'\{,2}UNH+[0-9]*+[A-Z]\+:[^+]*" contains=ediUNHtag,ediCompSep,ediCONTRL
syn match ediUNHtag "UNH" contained nextgroup=ediUNHfill
syn region ediUNHfill start="+[0-9]*+" matchgroup=ediUNHmsg end="[A-Z]\+" contained contains=ediSep,ediCompSep,ediCONTRL

hi ediTag ctermfg=14
hi ediSep ctermfg=12
hi ediCompSep ctermfg=82
hi ediUNB ctermfg=182
hi ediUNZ ctermfg=182
hi ediUNT ctermfg=182
hi ediUNHtag ctermfg=182
hi ediUNHmsg ctermfg=82
hi ediCONTRL ctermfg=255 ctermbg=1

let b:current_syntax = "tracer"
