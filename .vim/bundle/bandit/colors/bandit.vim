" vim: tw=0 ts=4 sw=4 noet ft=colours_bandit foldmethod=diff

" vIM COLOUr file
" Maintainer:	A. S. Budden

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "bandit"

let ColourAssignment = {}

" Unspecified colours default to None, EXCEPT cterm(.*) which default to matching gui(.*)
" ctermfg will default to 'Blue' and ctermbg to 'None' if gui(.*) are RGB
"
" In most cases, only GUIFG is therefore important unless support for Black and White
" terminals is essential

" By default, assume the background colour is dark (changes for light backgrounds are handled later)
let ColourAssignment['Normal']          = {"CTERMFG": '255', "CTERMBG": '236'}

let ColourAssignment['Comment']         = {"CTERMFG": '145',     "TERM":   'Bold'}

" let ColourAssignment['Search']         = {"CTERMFG": '255',    "CTERMBG": '27'}
let ColourAssignment['Search']         = {"CTERMFG": '235',    "CTERMBG": '220', "TERM": 'None'}
let ColourAssignment['IncSearch']         = {"CTERMFG": '255',    "CTERMBG": '63'}

" Diff
let ColourAssignment['DiffAdd']         = {"CTERMFG": '255',    "CTERMBG": '28'}
let ColourAssignment['DiffChange']         = {"CTERMFG": '255',    "CTERMBG": '26'}
let ColourAssignment['DiffText']         = {"CTERMFG": '255',    "CTERMBG": '130'}
let ColourAssignment['DiffDelete']         = {"CTERMFG": '255',    "CTERMBG": '124'}
"let ColourAssignment['DiffAdd']         = {"CTERMFG": '232',    "CTERMBG": '119'}
"let ColourAssignment['DiffChange']         = {"CTERMFG": '232',    "CTERMBG": '117'}
"let ColourAssignment['DiffText']         = {"CTERMFG": '232',    "CTERMBG": '227'}
"let ColourAssignment['DiffDelete']         = {"CTERMFG": '232',    "CTERMBG": '209'}

" Tabbar
let ColourAssignment['Tb_Normal']         = {"CTERMFG": '253',    "CTERMBG": '241'}
let ColourAssignment['Tb_Changed']         = {"CTERMFG": '216',    "CTERMBG": '241'}
let ColourAssignment['Tb_VisibleNormal']         = {"CTERMFG": '232',    "CTERMBG": '250'}
let ColourAssignment['Tb_VisibleChanged']         = {"CTERMFG": '124',    "CTERMBG": '250'}
let ColourAssignment['VisualNOS']         = {"CTERMFG": '232',    "CTERMBG": '255', "TERM": 'None'}
let ColourAssignment['CursorIM']         = {"CTERMFG": '124',    "CTERMBG": '255', "TERM": 'None'}

" Warning
let ColourAssignment['ErrorMsg']         = {"CTERMFG": '255',    "CTERMBG": '1'}
let ColourAssignment['WarningMsg']         = {"CTERMFG": '255',    "CTERMBG": '167'}

" visual selection
let ColourAssignment['Visual']         = {"CTERMBG": '240', "TERM": 'None'}

" directory
let ColourAssignment['Directory']         = {"CTERMFG": '117'}

let ColourAssignment['WildMenu']         = {"CTERMBG": '27', "CTERMFG": '255'}


" spelling
let ColourAssignment['SpellBad']         = {"ctermfg": '255',    "CTERMBG": '124',     "CTERM":  'Underline'}
let ColourAssignment['SpellCap']         = {"CTERMBG": '167', "CTERMFG": '255',     "CTERM":  'Underline'}
let ColourAssignment['SpellLocal']         = {"CTERMBG": '94', "CTERMFG": '255',     "CTERM":  'Underline'}
let ColourAssignment['SpellRare']         = {"CTERMBG": '24', "CTERMFG": '255',     "CTERM":  'Underline'}

" StlShowFunc plugin
"let ColourAssignment['User1']         = {"CTERMBG": '23', "CTERMFG": '255'}
"let ColourAssignment['User2']         = {"GUIFG": '232',       "GUIBG": '254'}
"let ColourAssignment['User3']         = {"CTERMBG": '53', "GUI":    'Underline'}

" These are considered to be a different sort of comment, so they get a different shade
" of green: this also allows the doxygen todo error highlighter to be able to spot
" erroneous @todo flags in non-doxygen comments (requires Doxygen Comment Matcher)
let ColourAssignment['DoxygenComment']  = {"GUIFG": '#008800',     "CTERMFG": '117',     "TERM":  'Bold'}
let ColourAssignment['DoxygenKeyword']  = {"GUIFG": '#88ffdd',     "CTERMFG": '117'}
let ColourAssignment['DoxygenLink']     = {"GUIFG": '#8888ff',     "CTERMFG": '117'}
let ColourAssignment['DoxygenTable']    = {"GUIFG": '#00bb00',     "CTERMFG": '117',     "TERM":  'Bold'}
let ColourAssignment['DoxygenTableLines']  = {"GUIFG": '#88ffdd',     "CTERMFG": '117'}

" These are PC-Lint related comments
let ColourAssignment['LintComment']     = {"GUIFG": '#00ff88',     "CTERMFG": '117'}

" Constants are shades of yellow or brown
let ColourAssignment['Constant']        = {"CTERMFG": '217',    "TERM":  'Underline'}
let ColourAssignment['String']          = {"GUIFG": '228'}
let ColourAssignment['Character']       = {"GUIFG": '148'}

" Preprocessor directives are bold shades of blue
let ColourAssignment['PreProc']         = {"GUIFG": '114',        "GUI":     'Bold',      "TERM":  'Underline'}
let ColourAssignment['Include']         = {"GUIFG": '114',        "GUI":     'Bold'} " preprocessor #include
let ColourAssignment['Define']          = {"GUIFG": '114',     "GUI":     'Bold'} " preprocessor #define
let ColourAssignment['Macro']           = {"GUIFG": '114',     "GUI":     'Bold'} " same as Define
let ColourAssignment['PreCondit']       = {"GUIFG": '114',     "GUI":     'Bold'} " preprocessor #if, #else, #endif, etc.


let ColourAssignment['Conditional']     = {"GUIFG": '203', "GUI":  'Bold'} " if, then, else, endif, switch, etc.
let ColourAssignment['Repeat']          = {"GUIFG": '203', "GUI":  'Bold'} " for, do, while, etc.
let ColourAssignment['Label']           = {"GUIFG": '203', "GUI":  'Bold'} " case, default, etc.
let ColourAssignment['OtherKeywords']   = {"GUIFG": '203', "GUI":  'Bold'} " break, return
let ColourAssignment['Exception']       = {"GUIFG": '201', "GUI":  'Bold'} " try, catch, throw

" Operators (+, =, -, % etc): not defined by default C syntax
let ColourAssignment['Operator']        = {"GUIFG": '226'}
let ColourAssignment['MyOperators'] = {"GUIFG": '226'}
let ColourAssignment['RoundSquareBracket'] = {"GUIFG": '46'}
let ColourAssignment['CurlyBracket'] = {"GUIFG": '46'}

let ColourAssignment['Identifier']      = {"CTERMFG": 'Yellow', "TERM": 'Underline'}
let ColourAssignment['Function']        = {"CTERMFG": '147'}

let ColourAssignment['Method']          = {"CTERMFG": '148'}
let ColourAssignment['cCustomFunc']     = {"CTERMFG": '203', "GUI":    'Underline'}

" Special additions created by mktypes.py are shades of Purple or Grey
" let ColourAssignment['Statement']       = {"GUIFG": '178',        "GUI":    'Bold'}
" let ColourAssignment['Class']           = {"GUIFG": '172'}
" let ColourAssignment['EnumerationValue']= {"GUIFG": '209'}
" let ColourAssignment['EnumerationName'] = {"GUIFG": '209',     "TERM":  'Underline'}
" let ColourAssignment['Member']          = {"GUIFG": '209',    "TERM":    'Underline'}
" let ColourAssignment['Union']           = {"GUIFG": '209',        "TERM":    'Underline'}

let ColourAssignment['Statement']       = {"GUIFG": '158',        "GUI":    'Bold'}
let ColourAssignment['Class']           = {"GUIFG": '116'}
let ColourAssignment['EnumerationValue']= {"GUIFG": '79'}
let ColourAssignment['EnumerationName'] = {"GUIFG": '80',     "TERM":  'Underline'}
let ColourAssignment['Member']          = {"GUIFG": '225'}
let ColourAssignment['Union']           = {"GUIFG": '80',        "TERM":    'Underline'}

let ColourAssignment['DefinedName']     = {"GUIFG": '214',     "GUI":    'BOLD'}
" let ColourAssignment['DefinedName']     = {"GUIFG": '114',     "GUI":    'BOLD'}
let ColourAssignment['GlobalVariable']  = {"CTERMFG": '226',      "TERM":  'Underline'}
let ColourAssignment['LocalVariable']   = {"CTERMFG": '224'}
let ColourAssignment['GlobalConstant']  = {"CTERMFG": '226',      "TERM":  'Underline'}

" Types/storage classes etc are shades of orangey-red
let ColourAssignment['Type']            = {"GUIFG": '156',     "GUI":    'Bold'}
let ColourAssignment['StorageClass']    = {"GUIFG": '225', "GUI":  'Bold'} " static, register, volatile, etc.
let ColourAssignment['Structure']       = {"GUIFG": '225', "GUI":  'Bold'} " struct, union, enum, etc.

" Special Stuff
let ColourAssignment['Special']         = {"GUIFG": '151',         "TERM":    'None'}
let ColourAssignment['SpecialChar']     = {"GUIFG": '151'}     " special character in a constant
let ColourAssignment['SpecialKey']      = {"GUIFG": '244'}     " special highlighting for 'listchars' etc
let ColourAssignment['NonText']         = {"GUIFG": '250'}     " special highlighting for 'listchars' etc
let ColourAssignment['MatchParen']      = {"GUI":   'Underline',   "GUIFG": '255', "GUIBG": '9'}   " Highlighting of matching parentheses

" Errors
let ColourAssignment['Error']           = {"GUIFG": 'White',       "GUIBG":   '160'}
let ColourAssignment['NonIndentTabError']={"GUIFG": '255',        "GUIBG":   '166', "GUI":   'undercurl',    "TERM":  'Standout'}

" Stuff needing doing
let ColourAssignment['Todo']            = {"GUIFG": '255',        "GUIBG":   '1',    "CTERM":  'Underline'}

" Folding
let ColourAssignment['FoldColumn']      = {"GUIFG": '227',    "GUIBG":   '244'}
let ColourAssignment['Folded']      = {"GUIFG": '228',    "GUIBG":   '59'}

" Popup Menu
let ColourAssignment['Pmenu']           = {"GUIFG": '255',     "GUIBG": '27'}
let ColourAssignment['PmenuSel']           = {"GUIFG": '235',     "GUIBG": '185'}

" Number of lines
let ColourAssignment['LineNr']          = {"GUIFG": '243'}

" Status Lines
let ColourAssignment['StatusLine']      = {"GUIFG": '232',       "GUIBG": '254'}
let ColourAssignment['StatusLineNC']    = {"GUIFG": '254',       "GUIBG": '242'}

" Vertical Splits
let ColourAssignment['VertSplit']       = {"GUIFG": '11',       "GUIBG": '244'}

" Signs Column
let ColourAssignment['SignColumn']      = {"GUIFG": '118', "GUIBG": '238'}

" Text Titles
let ColourAssignment['Title']           = {"GUIFG": '147',        "GUI": "None"}
let ColourAssignment['htmlH1']          = {"GUIFG": '147'}
let ColourAssignment['htmlH2']          = {"GUIFG": '147'}
let ColourAssignment['htmlH3']          = {"GUIFG": '147'}
let ColourAssignment['htmlH4']          = {"GUIFG": '147'}
let ColourAssignment['htmlH5']          = {"GUIFG": '147'}
let ColourAssignment['htmlH6']          = {"GUIFG": '147'}


" Delimiters
let ColourAssignment['Delimiter']       = {"GUIFG": 'DarkCyan'}
" Rainbow highlighting of nested brackets
" TODO: Find the closest ctermfg match to the various guifg colours
" let ColourAssignment['hlLevel0']        = {"GUIFG": 'DarkCyan',    "CTERMFG": '196'}
" let ColourAssignment['hlLevel1']        = {"GUIFG": '#bfbf00',     "CTERMFG": '202'}
" let ColourAssignment['hlLevel2']        = {"GUIFG": '#990033',     "CTERMFG": '208'}
" let ColourAssignment['hlLevel3']        = {"GUIFG": '#334488',     "CTERMFG": '214'}
" let ColourAssignment['hlLevel4']        = {"GUIFG": '#996622',     "CTERMFG": '220'}
" let ColourAssignment['hlLevel5']        = {"GUIFG": '#ff2222',     "CTERMFG": '226'}
" let ColourAssignment['hlLevel6']        = {"GUIFG": '#4444ff',     "CTERMFG": 'DarkCyan'}
" let ColourAssignment['hlLevel7']        = {"GUIFG": '#ffff44',     "CTERMFG": 'DarkCyan'}
" let ColourAssignment['hlLevel8']        = {"GUIFG": '#96cdcd',     "CTERMFG": 'DarkCyan'}
" let ColourAssignment['hlLevel9']        = {"GUIFG": '#698b22',     "CTERMFG": 'DarkCyan'}
" " Stop rainbow.vim from overwriting these colours (requires modifications to rainbow.vim v2a
" let g:rainbow_delimiter_colours_defined = 1

" Marks plugin
let ColourAssignment['MarkWord1']          = {"CTERMFG": '232', "CTERMBG": '117'}
let ColourAssignment['MarkWord2']          = {"CTERMFG": '232', "CTERMBG": '119'}
let ColourAssignment['MarkWord3']          = {"CTERMFG": '232', "CTERMBG": '227'}
let ColourAssignment['MarkWord4']          = {"CTERMFG": '232', "CTERMBG": '209'}
let ColourAssignment['MarkWord5']          = {"CTERMFG": '232', "CTERMBG": '219'}
let ColourAssignment['MarkWord6']          = {"CTERMFG": '254', "CTERMBG": '27'}
let ColourAssignment['MarkWord7']          = {"CTERMFG": '254', "CTERMBG": '28'}
let ColourAssignment['MarkWord8']          = {"CTERMFG": '232', "CTERMBG": '214'}
let ColourAssignment['MarkWord9']          = {"CTERMFG": '254', "CTERMBG": '124'}
let ColourAssignment['MarkWord10']          = {"CTERMFG": '254', "CTERMBG": '128'}

let ColourAssignment['CursorLine']         = {"CTERMBG": '238'}
"let ColourAssignment['CursorLine']         = {"CTERM":  'Reverse'}
let ColourAssignment['CursorColumn']         = {"CTERMBG": '237'}

" ========================================================================
" Other available highlighting groups are listed at the bottom of the file
" Light Background stuff is below the MakeDarker function
" ========================================================================

function! s:MakeDarker(rgb)
	let rgbSplitter = '^#\(\x\{2}\)\(\x\{2}\)\(\x\{2}\)$'
	let matches = matchlist(a:rgb, rgbSplitter)
	if empty(matches)
		return a:rgb
	endif
	let Red = matches[1]
	let Green = matches[2]
	let Blue = matches[3]
	let percentage = 70
	let darken_above_here = 0x7f*3

	let Red = str2nr(Red, 16)
	let Green = str2nr(Green, 16)
	let Blue = str2nr(Blue, 16)
	if (Red+Green+Blue) < darken_above_here
		return a:rgb
	endif

	let Red = Red*percentage/100
	let Green = Green*percentage/100
	let Blue = Blue*percentage/100

	let result = printf("#%02x%02x%02x", Red, Green, Blue)

	return result
	
endfunction


" " Now change those that are different for the light background
" if &background == 'light'
" 	" Automatically change any LightXxxxx Colours to DarkXxxxx
" 	for s:group in keys(ColourAssignment)
" 		for s:Component in keys(ColourAssignment[s:group])
" 			if match(ColourAssignment[s:group][s:Component], 'Light') == 0
" 				let ColourAssignment[s:group][s:Component] = 'Dark'.ColourAssignment[s:group][s:Component][5:]
" 			elseif match(ColourAssignment[s:group][s:Component], '^#\x\{6}$') != -1
" 				let ColourAssignment[s:group][s:Component] = s:MakeDarker(ColourAssignment[s:group][s:Component])
" 			endif
" 		endfor
" 	endfor
" 
" 	" Now add manual alterations
" 	let ColourAssignment['Normal']              = {"GUIFG": 'Black',     "GUIBG": 'White'}
" 	let ColourAssignment['Comment']["GUIFG"]    = '117'
" 	let ColourAssignment['String']["GUIFG"]     = '#663300'
" 	let ColourAssignment['String']["CTERMFG"]   = 'DarkYellow'
" 	let ColourAssignment['Union']["GUIFG"]      = 'DarkGrey'
" 	let ColourAssignment['Identifier']["GUIFG"] = 'Blue'
" 	let ColourAssignment['Operator']["GUIFG"]   = '#222288'
" 	let ColourAssignment['LineNr']["GUIBG"]     = 'Grey'
" 	let ColourAssignment['StatusLine']["GUIBG"] = 'Black'
" 	let ColourAssignment['StatusLine']["GUIFG"] = 'White'
" 	let ColourAssignment['SignColumn']["GUIBG"] = "LightGrey"
" 	let ColourAssignment['SpecialKey']["GUIFG"] = '#AAAAAA'
" 	let ColourAssignment['NonText']["GUIFG"]    = '#AAAAAA'
" endif

hi Ignore ctermfg=DarkGrey guifg=grey20

" Unless there is a need to change the links at the bottom, don't change anything below this line

let s:colours = {}
let valid_cterm_colours = 
			\ [
			\     'Black', 'DarkBlue', 'DarkGreen', 'DarkCyan',
			\     'DarkRed', 'DarkMagenta', 'Brown', 'DarkYellow',
			\     'LightGray', 'LightGrey', 'Gray', 'Grey',
			\     'DarkGray', 'DarkGrey', 'Blue', 'LightBlue',
			\     'Green', 'LightGreen', 'Cyan', 'LightCyan',
			\     'Red', 'LightRed', 'Magenta', 'LightMagenta',
			\     'Yellow', 'LightYellow', 'White', '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','80','81','82','83','84','85','86','87','88','89','90','91','92','93','94','95','96','97','98','99','100','101','102','103','104','105','106','107','108','109','110','111','112','113','114','115','116','117','118','119','120','121','122','123','124','125','126','127','128','129','130','131','132','133','134','135','136','137','138','139','140','141','142','143','144','145','146','147','148','149','150','151','152','153','154','155','156','157','158','159','160','161','162','163','164','165','166','167','168','169','170','171','172','173','174','175','176','177','178','179','180','181','182','183','184','185','186','187','188','189','190','191','192','193','194','195','196','197','198','199','200','201','202','203','204','205','206','207','208','209','210','211','212','213','214','215','216','217','218','219','220','221','222','223','224','225','226','227','228','229','230','231','232','233','234','235','236','237','238','239','240','241','242','243','244','245','246','247','248','249','250','251','252','253','254','255', 'Underline'
			\ ]
for key in keys(ColourAssignment)
	let s:colours = ColourAssignment[key]
	if has_key(s:colours, 'TERM')
		let term = s:colours['TERM']
	else
		let term = 'None'
	endif
	if has_key(s:colours, 'GUI')
		let gui = s:colours['GUI']
	else
		let gui='None'
	endif
	if has_key(s:colours, 'GUIFG')
		let guifg = s:colours['GUIFG']
	else
		let guifg='None'
	endif
	if has_key(s:colours, 'GUIBG')
		let guibg = s:colours['GUIBG']
	else
		let guibg='None'
	endif
	if has_key(s:colours, 'CTERM')
		let cterm = s:colours['CTERM']
	else
		let cterm=gui
	endif
	if has_key(s:colours, 'CTERMFG')
		let ctermfg = s:colours['CTERMFG']
	else
		"if index(valid_cterm_colours, guifg) != -1
			let ctermfg=guifg
		"else
			"let ctermfg='Blue'
		"endif
	endif
	if has_key(s:colours, 'CTERMBG')
		let ctermbg = s:colours['CTERMBG']
	else
		if index(valid_cterm_colours, guibg) != -1
			let ctermbg=guibg
		else
			let ctermbg='None'
		endif
	endif
	if has_key(s:colours, 'GUISP')
		let guisp = s:colours['GUISP']
	else
		let guisp='None'
	endif

	if key =~ '^\k*$' && ctermfg!=''
		execute "hi ".key." term=".term." cterm=".cterm." gui=".gui." ctermfg=".ctermfg." guifg=".guifg." ctermbg=".ctermbg." guibg=".guibg." guisp=".guisp
	endif
endfor

hi! link MoreMsg        Comment
"hi! link ErrorMsg       Visual
"hi! link WarningMsg     ErrorMsg
"hi! link Question       Comment
hi  link Number         Constant
hi  link Boolean        Number
hi  link Float          Number
"*hi  link Keyword        Statement
hi  link Typedef        Type
hi  link SpecialComment Special
hi  link Debug          Special

hi link javaParen  hlLevel0
hi link javaParen1 hlLevel1
hi link javaParen2 hlLevel2

" easytags plugin
highlight link cTypeTag Type
highlight link cEnumTag EnumerationValue
highlight link cPreProcTag PreProc
highlight link cFunctionTag Function
highlight link cMember Member



" For reference, roughly equivalent syntax highlighting in diffuse
" (http://diffuse.sourceforge.net)
" This is for C++ syntax:
"
" # colours
" colour c++_comment 0.0 0.5 0.0
" colour c++_fixme 0.5 0.5 0.0
" colour c++_keyword 0.2 0.2 0.7
" colour c++_type 0.7 0.3 0.0
" colour c++_cpp 0.0 0.0 0.0
" colour c++_cppkeyword 0.4 0.4 0.7
" colour c++_literal 0.7 0.7 0.3
" colour c++_string 0.4 0.2 0.0
" colour c++_escapedchar 0.7 0.0 0.0
" colour c++_punctuation 0.1 0.1 0.5


" davide
runtime plugin/RainbowParenthsis.vim


