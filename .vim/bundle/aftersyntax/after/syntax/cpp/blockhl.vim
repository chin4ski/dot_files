" blockhl.vim: highlights indentation blocks with different shades of gray, based on {} level.
"              Only good for gvim and C/C++.
"  Author: Charles E. Campbell, Jr.
"  Date:   Sep 22, 2011
"  Version: 6e	ASTRO-ONLY
"
" GetLatestVimScripts: 104 1 blockhl.vim
"if !exists("g:loaded_blockhl")
 "let g:loaded_blockhl= "v6e"
"else
 "let g:loaded_blockhl= "v6e"
"endif
let g:loaded_blockhl= 1
let g:blockhl_version= "v6d"

"if has("gui_running")

 " ---------------------------------------------------------------------
 "  Do Once: {{{1
 if g:loaded_blockhl == 1
"  call Decho("gui_running and loaded_blockhl=".g:loaded_blockhl)
  com! -bar ToggleBlockHL	call s:ToggleBlockHL()
  sil! com -bar BlockHL		call s:ToggleBlockHL()
  let s:blockhl_path = expand("<sfile>")

" DrChip Menu Support: {{{1
  if has("gui_running") && has("menu") && &go =~ 'm'
   if !exists("g:DrChipTopLvlMenu")
	let g:DrChipTopLvlMenu= "DrChip."
   endif
   exe 'menu '.g:DrChipTopLvlMenu.'Toggle\ Block\ Highlighting<tab>:ToggleBlockHL	:ToggleBlockHL<cr>'
  endif

 " ---------------------------------------------------------------------
  " s:HLTest: tests if a highlighting group has been set up {{{2
  "         This function is used by the CursorHold below, which
  "         is there primarily to support continued blockhl
  "         highlighting after the colorscheme has been changed
  fun! s:BlockHLTest(hlname)
"  	call Dfunc("s:BlockHLTest(hlname<".a:hlname.">)")
    let id_hlname= hlID(a:hlname)
    if id_hlname == 0
"  	 call Dret("s:BlockHLTest 0 : id_hlname==0")
     return 0
    endif
    let id_trans = synIDtrans(id_hlname)
    if id_trans == 0
"  	 call Dret("s:BlockHLTest 0 : id_trans==0")
     return 0
    endif
    let fg_hlname= synIDattr(id_trans,"fg")
    let bg_hlname= synIDattr(id_trans,"bg")
    if fg_hlname == "" && bg_hlname == ""
"  	 call Dret("s:BlockHLTest 0 : fg_hlname<".fg_hlname."> bg_hlname<".bg_hlname.">")
     return 0
    endif
"  	 call Dret("s:BlockHLTest 1")
    return 1
  endfun

 " ---------------------------------------------------------------------
 " s:ToggleBlockHL: calling this function toggles indentation block-highlighting {{{2
  fun! s:ToggleBlockHL()

    if !exists("b:blockhl_enabled")
     let b:blockhl_enabled= 0
"    call Dfunc("s:ToggleBlockHL() blockhl_enabled=".b:blockhl_enabled)
    endif

    if b:blockhl_enabled
     " Disable blockhl-highlighting
     augroup AU_BlockHL
      au!
     augroup END
     augroup! AU_BlockHL
     let b:blockhl_enabled= 0
     hi clear cLead1
     hi clear cLead2
     hi clear cLead3
     hi clear cLead4
     hi clear cLead5
     hi clear cLead6
     hi clear cLead7
	 setf c

    else
     " Enable blockhl-highlighting
	 " block highlighting syntax
"     call Decho("Setting up block highlighting syntax")
	 syn cluster cCurlyGroup	  contains=cConditional,cConstant,cLabel,cOperator,cRepeat,cStatement,cStorageClass,cStructure,cType,cBitField,cCharacter,cCommentError,cInclude,cNumbers,cParenError,cPreCondit,cSpaceError,cSpecialCharacter,cSpecialError,cUserCont,cBracket,cComment,cCommentL,cCppOut,cCppString,cDefine,cMulti,cParen,cPreCondit,cPreProc,cString
	 syn cluster cParenGroup	  add=cCurly1,cCurly2,cCurly3,cCurly4,cCurly5,cCurly6,cCurly7,cLead1,cLead2,cLead3,cLead4,cLead5,cLead6,cLead7
	 syn region cCurly1			  transparent	matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead1,cCurly2,@cCurlyGroup
	 syn region cCurly2 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead2,cCurly3,@cCurlyGroup
	 syn region cCurly3 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead3,cCurly4,@cCurlyGroup
	 syn region cCurly4 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead4,cCurly5,@cCurlyGroup
	 syn region cCurly5 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead5,cCurly6,@cCurlyGroup
	 syn region cCurly6 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead6,cCurly7,@cCurlyGroup
	 syn region cCurly7 contained transparent   matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=cLead7,cCurly1,@cCurlyGroup

	 syn match  cLead1  contained   "^[\t ]*[^\{\}\t ]"hs=e-2,he=e-2
	 syn match  cLead2  contained   "^[\t ]*[^\{\}\t ]"hs=e-2,he=e-2
	 syn match  cLead3  contained   "^[\t ]*[^\{\}\t ]"hs=e-2,he=e-2
	 syn match  cLead4  contained   "^[\t ]*[^\{\}\t ]"hs=e-2,he=e-2
	 syn match  cLead5  contained   "^[\t ]*[^\{\}\t ]"hs=e-2,he=e-2
	 syn match  cLead6  contained   "^[\t ]*[^\{\}\t ]"hs=e-2,he=e-2
	 syn match  cLead7  contained   "^[\t ]*[^\{\}\t ]"hs=e-2,he=e-2

	 "syn match  cLead1  contained   "\(^\s*\|^\s*$\)"hs=e-1,he=e-1
	 "syn match  cLead2  contained   "\(^\s*\|^\s*$\)"hs=e-1,he=e-1
	 "syn match  cLead3  contained   "\(^\s*\|^\s*$\)"hs=e-1,he=e-1
	 "syn match  cLead4  contained   "\(^\s*\|^\s*$\)"hs=e-1,he=e-1
	 "syn match  cLead5  contained   "\(^\s*\|^\s*$\)"hs=e-1,he=e-1
	 "syn match  cLead6  contained   "\(^\s*\|^\s*$\)"hs=e-1,he=e-1
	 "syn match  cLead7  contained   "\(^\s*\|^\s*$\)"hs=e-1,he=e-1

     " Colorscheme change handling
     let b:blockhl_enabled = 1
"     call Decho("blockhl_path<".s:blockhl_path.">")
     "if &bg == "dark"
      "hi default cLead1 ctermbg=255
      "hi default cLead2 ctermbg=254
      "hi default cLead3 ctermbg=253
      "hi default cLead4 ctermbg=252
      "hi default cLead5 ctermbg=251
      "hi default cLead6 ctermbg=250
      "hi default cLead7 ctermbg=249
     "else
      hi default cLead1 ctermbg=255
      hi default cLead2 ctermbg=253
      hi default cLead3 ctermbg=249
      hi default cLead4 ctermbg=245
      hi default cLead5 ctermbg=241
      hi default cLead6 ctermbg=237
      hi default cLead7 ctermbg=232
     "endif
     augroup AU_BlockHL
      au!
      if v:version >= 700
       exe 'au ColorScheme *.c if !<SID>BlockHLTest("cLead1")|let b:blockhl_enabled=0|ToggleBlockHL|endif'
      else
       exe 'au CursorHold *.c  if !<SID>BlockHLTest("cLead1")|let b:blockhl_enabled=0|ToggleBlockHL|endif'
    endif
     augroup END
    endif

"  call Dret("s:ToggleBlockHL : blockhl_enabled=".b:blockhl_enabled)
  endfun

  " following command responsible for first turning on BlockHL highlighting
  if exists("g:blockhl_enabled") && g:blockhl_enabled
   ToggleBlockHL
  endif
 endif

" }}}1
"endif
" ---------------------------------------------------------------------
" vim: ts=4 fdm=marker ft=vim
