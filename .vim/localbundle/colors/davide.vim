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

    " Devine tout seul la couleur du fond (clair sur fonc� ou le contraire)
"set background=light
"set background=dark
set background&

hi clear Normal
"set bg&

" Remove all existing highlighting and set the defaults.
hi clear

hi MatchParen ctermbg=darkmagenta ctermfg=white cterm=underline
hi Search     ctermfg=White ctermbg=blue    cterm=NONE
hi IncSearch  ctermfg=blue  ctermbg=yellow  cterm=NONE
hi Todo       ctermfg=white   ctermbg=magenta
hi Pmenu      ctermfg=white ctermbg=blue
hi PmenuSel   ctermfg=white ctermbg=red
hi Type       ctermfg=28 "green
hi Comment    ctermfg=21 "blue
hi Identifier ctermfg=32 "lightblue
"hi Constant   ctermfg=1     ctermbg=white
hi Constant   ctermfg=darkred "21 "4 "12 "14
"hi Statement  ctermfg=1     ctermbg=15      term=NONE   cterm=NONE
hi Statement ctermfg=darkred
"hi Preproc    ctermfg=130  "57 "25 "57
hi Preproc    ctermfg=brown
hi Function   ctermfg=127   cterm=underline
hi NamespaceUsed  ctermfg=brown
hi EdiMsg  ctermfg=darkred cterm=underline
hi Folded   ctermfg=232   ctermbg=254
"hi CppMinMax  ctermfg=darkred
"    hi CppClassDef   ctermfg=32 cterm=underline

hi Visual    ctermbg=253

"hi Error ctermbg=lightred ctermfg=lightyellow cterm=none
hi CursorLine ctermbg=lightyellow cterm=NONE

hi StatusLine  cterm=NONE ctermfg=white ctermbg=black guibg=black guifg=white
"    hi StatusLineNC gui=NONE guibg=#56A0EE guifg=#E9E9F4
hi! link VertSplit StatusLineNC

highlight DiffAdd ctermfg=black ctermbg=lightgreen
highlight DiffChange ctermfg=black ctermbg=lightcyan
highlight DiffText ctermfg=black ctermbg=lightred
highlight DiffDelete ctermfg=black ctermbg=red


" Load the syntax highlighting defaults, if it's enabled.
"if exists("syntax_on")
"  syntax reset
"endif

let colors_name = "davide"

" vim: sw=2
