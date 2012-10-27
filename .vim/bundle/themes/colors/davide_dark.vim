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
hi Search     ctermfg=255 ctermbg=27
hi IncSearch  ctermfg=236  ctermbg=118
hi Todo       ctermfg=255   ctermbg=124
hi Pmenu      ctermfg=232 ctermbg=7
hi PmenuSel   ctermfg=white ctermbg=red
hi Type       ctermfg=227 "yellow
hi Comment    ctermfg=117 "blue
hi Identifier ctermfg=219 "light purple
hi Constant   ctermfg=210
hi Statement  ctermfg=10 "green
hi Preproc    ctermfg=219 "light purple
"hi Function   ctermfg=213   cterm=underline " purple
hi NamespaceUsed  ctermfg=147
hi EdiMsg  ctermfg=172 cterm=underline
hi Folded   ctermbg=240 ctermfg=227   
hi Directory   ctermfg=117
hi SpecialKey   ctermfg=154
hi WarningMsg   ctermfg=210
"hi ErrorMsg   ctermfg=210
"hi CppMinMax  ctermfg=darkred
"    hi CppClassDef   ctermfg=32 cterm=underline
hi MemberVar  ctermfg=213 " purple
hi StorageClass  ctermfg=227 " purple
hi reference	ctermfg=10
hi pointer	ctermfg=9
hi assignedVar	ctermfg=49

hi Visual    ctermbg=239

"hi Error ctermbg=lightred ctermfg=lightyellow cterm=none
hi CursorLine ctermbg=239 cterm=NONE

"hi StatusLine  cterm=bold ctermfg=255 ctermbg=26
hi StatusLine  cterm=bold ctermfg=232 ctermbg=254 
hi StatusLineNC  cterm=bold ctermfg=254 ctermbg=242 
hi VertSplit  cterm=bold ctermfg=11 ctermbg=242 

highlight DiffAdd ctermfg=black ctermbg=lightgreen 
highlight DiffChange ctermfg=black ctermbg=lightcyan
highlight DiffText ctermfg=black ctermbg=lightred
highlight DiffDelete ctermfg=black ctermbg=red

" Tabbar
hi Tb_Normal cterm=bold ctermbg=240 ctermfg=253 
hi Tb_Changed cterm=bold ctermbg=240 ctermfg=216
hi Tb_VisibleNormal cterm=bold ctermbg=254 ctermfg=232 
hi Tb_VisibleChanged cterm=bold ctermbg=254 ctermfg=160


" Load the syntax highlighting defaults, if it's enabled.
"if exists("syntax_on")
"  syntax reset
"endif

let colors_name = "davide"

" vim: sw=2
