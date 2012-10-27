" davide

if &term =~ "xterm"
  set t_Co=256
  if has("terminfo")
    let &t_Sf=nr2char(27).'[3%p1%dm'
    let &t_Sb=nr2char(27).'[4%p1%dm'
  else
    let &t_Sf=nr2char(27).'[3%dm'
    let &t_Sb=nr2char(27).'[4%dm'
  endif
endif

    " Devine tout seul la couleur du fond (clair sur foncé ou le contraire)
"set background=light
"set background=dark
set background&

hi clear Normal
"set bg&

" Remove all existing highlighting and set the defaults.
hi clear

hi MatchParen ctermbg=165 ctermfg=255 cterm=underline
hi Search     ctermfg=236 ctermbg=14    cterm=NONE
hi IncSearch  ctermfg=236  ctermbg=118  cterm=NONE
hi Todo       ctermfg=255   ctermbg=124
hi Pmenu      ctermfg=232 ctermbg=7
hi PmenuSel   ctermfg=white ctermbg=red
hi Type       ctermfg=227 "green
hi Comment    ctermfg=117 "blue
hi Identifier ctermfg=219 "light purple
hi Constant   ctermfg=210 "red
hi Statement  ctermfg=10 "green
hi Preproc    ctermfg=219 "light purple
hi Function   ctermfg=213   cterm=underline " purple
hi NamespaceUsed  ctermfg=214  "brown
hi EdiMsg  ctermfg=172 cterm=underline
hi Folded   ctermbg=240 ctermfg=252   
hi Directory   ctermfg=117
hi SpecialKey   ctermfg=100
hi WarningMsg   ctermfg=210
"hi ErrorMsg   ctermfg=210
"hi CppMinMax  ctermfg=darkred
"    hi CppClassDef   ctermfg=32 cterm=underline

hi Visual    ctermbg=239

"hi Error ctermbg=lightred ctermfg=lightyellow cterm=none
hi CursorLine ctermbg=239 cterm=NONE

"hi StatusLine  cterm=bold ctermfg=255 ctermbg=26
hi StatusLine  cterm=bold ctermfg=236 ctermbg=252
hi StatusLineNC  cterm=bold ctermfg=253 ctermbg=242 
hi VertSplit  cterm=bold ctermfg=11 ctermbg=242 

highlight DiffAdd ctermfg=black ctermbg=lightgreen 
highlight DiffChange ctermfg=black ctermbg=lightcyan
highlight DiffText ctermfg=black ctermbg=lightred
highlight DiffDelete ctermfg=black ctermbg=red

" Tabbar
hi Tb_Normal cterm=bold ctermbg=144 ctermfg=232 
hi Tb_Changed cterm=bold ctermbg=144 ctermfg=124 
hi Tb_VisibleNormal cterm=bold ctermbg=185 ctermfg=232 
hi Tb_VisibleChanged cterm=bold ctermbg=185 ctermfg=124


" Load the syntax highlighting defaults, if it's enabled.
"if exists("syntax_on")
"  syntax reset
"endif

let colors_name = "davide"

" vim: sw=2
