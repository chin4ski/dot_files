" Compilation from source {{{

" ./configure --with-features=normal --enable-cscope --enable-pythoninterp=yes --enable-rubyinterp=yes --enable-luainterp=yes  --with-lua-prefix=$HOME/env --enable-gui --with-features=huge --prefix=$HOME/env --enable-gtk2-check --enable-gui=gtk2
" make
" make install

" }}}
" Helper functions {{{

function! EnsureDirExists (dir) " {{{

    if !isdirectory(a:dir)
        if exists("*mkdir")
            echo "Creating directory: " . a:dir
            call mkdir(a:dir,'p')
            echo "Done!"
        else
            echo "Please create directory: " . a:dir
        endif
    endif

endfunction " }}}

" }}}
" Basic settings {{{

set nocompatible

" Remove ALL auto-commands.  This avoids having the
" autocommands twice when the vimrc file is sourced again.
autocmd!

"}}}
" Terminal stuff {{{

set vb t_vb=

" Allow 256 colors in gnu screen
set t_Co=256

" Enable cursor shape control (Tera Term)
set t_SI=[6\ q
set t_EI=[1\ q

" Do not set the title in terminal window
set notitle

" Restore window title when exiting vim
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"

" Fix control sequence in screen
if &term == "screen"
    let &t_SI .= "\eP\e[3 q\e\\"
    let &t_EI .= "\eP\e[1 q\e\\"
else
    let &t_SI .= "\e[3 q"
    let &t_EI .= "\e[1 q"
endif

" Set a nicer cursor in insert mode (from terryma on github)
" Tmux will only forward escape sequences to the terminal if surrounded by
" a DCS sequence
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif



" In insert mode make Esc happen without waiting for timeoutlen
set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END
"set timeout timeoutlen=1000 ttimeoutlen=0

function! Allmap(mapping) " {{{

    execute 'map' a:mapping
    execute 'map!' a:mapping

endfunction " }}}

if exists("$USING_TERA_TERM")

    "set term=xterm-256color
    set ttymouse=sgr

    " Already working keys:
    " <M-Any_key>
    " <C-Arrows>
    " <C-S-Arrows>
    " <S-F_KEY>
    " <S-Tab>
    " <Tab>

    " Keys need a manual map:
    call Allmap('          <BS>')
    call Allmap('   [11~   <F1>')
    call Allmap('   [12~   <F2>')
    call Allmap('   [13~   <F3>')
    call Allmap('   [14~   <F4>')
    call Allmap('   [15~   <F5>')
    call Allmap('   [17~   <F6>')
    call Allmap('   [18~   <F7>')
    call Allmap('   [19~   <F8>')
    call Allmap('   [20~   <F9>')
    call Allmap('   [21~   <F10>')
    call Allmap('   [23~   <F11>')
    call Allmap('   [24~   <F12>')

    call Allmap('   OR   *')
    call Allmap('   Ol   +')
    call Allmap('   OS   -')
    call Allmap('   OM   <CR>')

    "echo 'Tera Term key mapping applied!'

elseif exists("$USING_XTERM_LINUX") || exists("$USING_XTERM_CYGWIN")

    set ttymouse=sgr

    " Already working keys:
    " <M-Any_key>
    " <S-F_KEY>
    " <S-Tab>
    " <Tab>

    " Keys need a manual map:
    call Allmap('            <BS>')
    "call Allmap('            <Del>')

    call Allmap('    <C-@>      <C-Space>')
    call Allmap('   [27;5;13~ <C-CR>')
    call Allmap('   [27;2;13~ <S-CR>')

    call Allmap('   [1~      <Home>')
    call Allmap('   [4~      <End>')

    call Allmap('   ® <M-.>')
    call Allmap('   ¬ <M-,>')

    call Allmap('   [27;5;46~ <C-.>')
    call Allmap('   [27;5;44~ <C-,>')

    call Allmap('   OP      <F1>')
    call Allmap('   OQ      <F2>')
    call Allmap('   OR      <F3>')
    call Allmap('   OS      <F4>')

    "call Allmap('   [11~      <F1>')
    "call Allmap('   [12~      <F2>')
    "call Allmap('   [13~      <F3>')
    "call Allmap('   [14~      <F4>')

    call Allmap('   [1;5P    <C-F1>')
    call Allmap('   [1;5Q    <C-F2>')
    call Allmap('   [1;5R    <C-F3>')
    call Allmap('   [1;5S    <C-F4>')

    "call Allmap('   [23~    <C-F1>')
    "call Allmap('   [24~    <C-F2>')
    "call Allmap('   [25~    <C-F3>')
    "call Allmap('   [26~    <C-F4>')

    call Allmap('   [15;5~   <C-F5>')
    call Allmap('   [17;5~   <C-F6>')
    call Allmap('   [18;5~   <C-F7>')
    call Allmap('   [19;5~   <C-F8>')
    call Allmap('   [20;5~   <C-F9>')
    call Allmap('   [21;5~   <C-F10>')
    call Allmap('   [23;5~   <C-F11>')
    call Allmap('   [24;5~   <C-F12>')

    call Allmap('   [1;2P    <S-F1>')
    call Allmap('   [1;2Q    <S-F2>')
    call Allmap('   [1;2R    <S-F3>')
    call Allmap('   [1;2S    <S-F4>')

    "call Allmap('   [11;2~    <S-F1>')
    "call Allmap('   [12;2~    <S-F2>')
    "call Allmap('   [13;2~    <S-F3>')
    "call Allmap('   [14;2~    <S-F4>')

    call Allmap('   [15;2~   <S-F5>')
    call Allmap('   [17;2~   <S-F6>')
    call Allmap('   [18;2~   <S-F7>')
    call Allmap('   [19;2~   <S-F8>')
    call Allmap('   [20;2~   <S-F9>')
    call Allmap('   [21;2~   <S-F10>')
    call Allmap('   [23;2~   <S-F11>')
    call Allmap('   [24;2~   <S-F12>')

    call Allmap('   [1;6P    <C-S-F1>')
    call Allmap('   [1;6Q    <C-S-F2>')
    call Allmap('   [1;6R    <C-S-F3>')
    call Allmap('   [1;6S    <C-S-F4>')

    "call Allmap('   [23;2~    <C-S-F1>')
    "call Allmap('   [24;2~    <C-S-F2>')
    "call Allmap('   [25;2~    <C-S-F3>')
    "call Allmap('   [26;2~    <C-S-F4>')

    call Allmap('   [15;6~   <C-S-F5>')
    call Allmap('   [17;6~   <C-S-F6>')
    call Allmap('   [18;6~   <C-S-F7>')
    call Allmap('   [19;6~   <C-S-F8>')
    call Allmap('   [20;6~   <C-S-F9>')
    call Allmap('   [21;6~   <C-S-F10>')
    call Allmap('   [23;6~   <C-S-F11>')
    call Allmap('   [24;6~   <C-S-F12>')

    call Allmap('  [1;5A <C-Up>')
    call Allmap('  [1;5B <C-Down>')
    call Allmap('  [1;5D <C-Left>')
    call Allmap('  [1;5C <C-Right>')

    call Allmap('  [1;2A <S-Up>')
    call Allmap('  [1;2B <S-Down>')
    call Allmap('  [1;2D <S-Left>')
    call Allmap('  [1;2C <S-Right>')

    call Allmap('  [1;6A <C-S-Up>')
    call Allmap('  [1;6B <C-S-Down>')
    call Allmap('  [1;6D <C-S-Left>')
    call Allmap('  [1;6C <C-S-Right>')

    "echo 'xterm key mapping applied!'

elseif exists( "$USING_URXVT_LINUX" )

    set term=xterm-256color
    "set termencoding=latin1
    "set fileencoding=utf-8
    set ttymouse=urxvt

    echo 'rxvt-linux key mapping applied!'

elseif exists("$USING_URXVT_CYGWIN")

    set term=xterm-256color
    set ttymouse=urxvt
    echo 'urxvt cygwin key mapping applied!'

elseif exists("$USING_PUTTY")

    for i in range(97,122)
        let c = nr2char(i)
        exec "set <M-".c.">=\<Esc>".c
    endfor
    set <M-Space>=<Esc><Space>

    "set ttymouse=xterm2   " Make mouse and putty work together (no tmux)
    set ttymouse=xterm    " Make mouse and putty work together (with tmux)

    set encoding=utf-8  " with putty 'character set translation' set to 'UTF-8'
    set termencoding=utf-8

    "echo 'putty key mapping applied!'

elseif exists("$USING_MOBAXTERM")

    echo 'mobaxterm key mapping applied!'

elseif exists("$USING_FUTTY")

    "set ttymouse=xterm2   " Make mouse and putty work together (no tmux)
    "set ttymouse=xterm    " Make mouse and putty work together (with tmux)
    set ttymouse=sgr

    set encoding=utf-8  " with putty 'character set translation' set to 'UTF-8'
    set termencoding=utf-8

    echo 'futty key mapping applied!'

elseif exists("$USING_PUTTY_GDI")

    "set ttymouse=xterm2   " Make mouse and putty work together (no tmux)
    "set ttymouse=xterm    " Make mouse and putty work together (with tmux)
    set ttymouse=sgr

    set encoding=utf-8  " with putty 'character set translation' set to 'UTF-8'
    set termencoding=utf-8

    "echo 'putty_gdi key mapping applied!'

elseif exists("$USING_ST_TERMINAL_LINUX")

    set term=st-256color
    set ttymouse=sgr

    echo 'st key mapping applied!'

else
    echo 'No key mapping applied!'
endif

" test
"map <kPlus> :echo 'ciao'<CR>

" }}}
" Path variables {{{

let &rtp = ''

" set default 'runtimepath' (without ~/.vim folders)
let &rtp = &rtp . ',' . printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &rtp= &rtp . ',' . printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

let $VIMHOME=expand("<sfile>:p:h")
let g:dot_vim_dir = $VIMHOME

if !exists("$TMPDIR")
    if isdirectory('/temp')
        let $TMPDIR = '/temp'
    elseif isdirectory('/gctmp')
        let $TMPDIR = '/gctmp'
    elseif isdirectory('/tmp')
        let $TMPDIR = '/tmp'
    else
        echo 'Error! Could no find any temp dir to use!'
    endif
endif

call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM')

" }}}
" Load bundles {{{

let g:bundle_dir = g:dot_vim_dir.'/bundle'
let g:localbundle_dir = g:dot_vim_dir.'/localbundle'

filetype off  " required!

" add vundle plugin path
let g:vundle_dir = g:bundle_dir . '/vundle'
let &rtp = &rtp . ',' . g:bundle_dir . '/vundle'

if isdirectory(g:localbundle_dir)
    " add localbundle target dir
    let &rtp = &rtp . ',' . g:dot_vim_dir.','.g:localbundle_dir.','.g:localbundle_dir.'/after'
endif

if isdirectory(g:vundle_dir)
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'vundle'

    Bundle 'CVSconflict'
    Bundle 'Color-Sampler-Pack'
    Bundle 'DirDiff'
    Bundle 'DoxygenToolkit'
    Bundle 'Enter-Indent'
    Bundle 'IndexedSearch'
    Bundle 'Mark--Karkat'
    Bundle 'MatchTag'
    Bundle 'Rename2'
    "Bundle 'TabBar'
    Bundle 'taghighlight'
    Bundle 'Vimball'
    Bundle 'a.vim'
    Bundle 'aftersyntax'
    Bundle 'aftersyntaxc'
    Bundle 'ape_syntax'
    Bundle 'bandit'
    Bundle 'cpp_stuff'
    Bundle 'ctrlp'
    Bundle 'current-func-info'
    Bundle 'errormarker'
    Bundle 'file-line'
    Bundle 'grep'
    Bundle 'gtags'
    Bundle 'localbundle'
    Bundle 'marvim'
    Bundle 'matchit'
    Bundle 'matchit.zip'
    Bundle 'nerdcommenter'
    Bundle 'sessionman'
    Bundle 'textobj-word-column'
    Bundle 'themes'
    Bundle 'undotree'
    Bundle 'vim-indent-guides'
    Bundle 'vim-repeat'
    Bundle 'vim-scratch'
    Bundle 'vim-surround'
    Bundle 'vim-yankstack'
    Bundle 'vimproc'
    Bundle 'vundle'
    "Bundle 'xml'
    Bundle 'xterm-color-table'
    Bundle 'gruvbox'
    Bundle 'fugitive'
    Bundle 'vcscommand'
    Bundle 'tabular'
    Bundle 'vim-textobj-user'
    Bundle 'vim-textobj-between'
    Bundle 'vim-textobj-diff'
    Bundle 'vim-textobj-function'
    Bundle 'vim-textobj-parameter'
    Bundle 'operator-camelize'
    Bundle 'operator-user'
    Bundle 'signify'
    Bundle 'unite.vim-master'
    Bundle 'recover'
    Bundle 'largefile'
    Bundle 'cpp-enhanced-highlight'
    Bundle 'tagbar'
    Bundle 'rsi'
    Bundle 'minibufexpl'
    Bundle 'airline'
    Bundle 'context_filetype'
    Bundle 'snippets'
    Bundle 'unite-help'
    Bundle 'UltiSnips'
    Bundle 'YouCompleteMe'
    " Add new bundles here

    Bundle 'localbundle'
    call localbundle#init()

    if !isdirectory(g:localbundle_dir)
        LocalBundle
    endif

endif

filetype plugin indent on     " required!

" }}}
" Various settings and init {{{

filetype plugin indent on

" Auto reload various config files when modified
"  autocmd BufWritePost .vimrc source %
autocmd BufWritePost,FileWritePost ~/.Xdefaults,~/.Xresources silent! !xrdb -load % >/dev/null 2>&1

set linespace=0

set shortmess=filnxtToOaI

" Store swap files in fixed location, not current directory, with full path
" For Unix and Win32, if a directory ends in two path separators "//" or
" "\\", the swap file name will be built from the complete path to the file
" with all path separators substituted to percent '%' signs. This will
" ensure file name uniqueness in the preserve directory.
call EnsureDirExists($HOME.'/.vimswap')
let &dir=$HOME.'/.vimswap//'

call EnsureDirExists($HOME.'/.vimview')
let &viewdir=$HOME.'/.vimview//'

set backup
call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/backup')
set backupdir=$TMPDIR/$USER/_VIM/backup//

" Enable persistent undo
if version >= 703
    set undofile
    call EnsureDirExists($HOME.'/.vimundo')
    let &undodir=$HOME.'/.vimundo//'
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif

set shell=$SHELL

"Only ignore case when we type lower case when searching
set ignorecase
set smartcase

set history=10000

set mouse=a            " Enable mouse usage (all modes) in terminals

set ttyfast
" Affiche le nombre de lignes sélectionnées en mode visuel ou la
" touche/commande qu'on vient de taper en mode commande
set showcmd

"Allow switching buffers without writing to disk
set hidden

let &viminfo="\"1000,:5000,'1000,n".$HOME."/.viminfo"

" Menu completion, bash tab style completion
set wildmenu
set wildmode=list:longest
"set wildmode=longest,list

"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.os,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.#*,L64*,deliveries

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
                \ if expand("<afile>:p:h") !=? $TEMP |
                \     if line("'\"") > 1 && line("'\"") <= line("$") |
                \         let JumpCursorOnEdit_foo = line("'\"") |
                \         let b:doopenfold = 1 |
                \         if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
                \             let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
                \             let b:doopenfold = 2 |
                \         endif |
                \         exe JumpCursorOnEdit_foo |
                \         execute 'normal! g`"zvzz' |
                \     endif |
                \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
                \ if exists("b:doopenfold") |
                \     exe "normal zvzz" |
                \     if(b:doopenfold > 1) |
                \         exe "+".1 |
                \     endif |
                \     unlet b:doopenfold |
                \ endif
augroup END

"" Make sure Vim returns to the same line when you reopen a file.
"" Thanks, Amit
"augroup line_return
"    au!
"    au BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \     execute 'normal! g`"zvzz' |
"        \ endif
"augroup END

" set clipboard=unnamed " copy paste to system registry
"set clipboard+=unnamed " share windows clipboard ==>  !breaks Yankstackpluging!
set clipboard+=autoselect " share windows clipboard

set noequalalways

" do not redraw while running macros (much faster)
set lazyredraw

" allow the . to execute once for each line of a BLOCK visual selection
vnoremap . :normal .<CR>

" Execute visually highlighted lines in  shell command without filtering
" (see :h write_c)
map <Leader>ee :w !sh<CR>
vmap <Leader>ee :w !sh<CR>

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nnoremap <silent> <BS> :nohlsearch<CR>

" Serch for work under cursor, but do not jump to next occurrence
nnoremap * :let curwd='\<<C-R>=expand("<cword>")<CR>\>'<CR> :let @/=curwd<CR>:call histadd("search", curwd)<CR>:set hls<CR>b

" Search for visually selected text, but do not jump to next occurrence
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>

" }}}
" Tabs and indentation {{{

" insert spaces instead of real tabs
set expandtab
" number of space in which a tab is expanded
set tabstop=4
set softtabstop=4

" >> indentation size
set shiftwidth=4

"set autoindent
"set cindent
set smartindent

set list
"set listchars=tab:>-,trail:_
set listchars=tab:»\ ,trail:_,extends:»,precedes:«
set fillchars=vert:│

set showbreak=¬

nnoremap <F6> :silent set invpaste paste?<CR>
inoremap <F6> <C-C>:silent set invpaste paste?<CR>i
vnoremap <F6> <C-C>:silent set paste!<CR>gv

" reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv

set smarttab

" Intuitive backspacing in insert mode
" bs delete anything
set backspace=indent,eol,start

"    set smartindent
set cindent " do c-style indenting

set cinoptions=s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,gs,hs,ps,ts,is,+s,c3,C0,/0,(0,us,U0,w0,W0,m0,j0,)20,*30,#0

set comments=sl:/*,mb:\ *,elx:\ */

" Go to new line when reaching max line lenght
set textwidth=130

" Highlight 130th column
if exists('+colorcolumn')
    set colorcolumn=130
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>130v.\+', -1)
endif

" }}}
" Folding {{{

" Show fold column
set foldcolumn=1

" Allow manual folding
set foldmethod=manual

" Do not expand folds when searching
"set foldopen-=search

" Execute command on open folds only
nnoremap <Leader>f :folddoopen 

inoremap <Leader>f <C-O>za
"nnoremap <Leader>f za
onoremap <Leader>f <C-C>za
vnoremap <Leader>f zf

"function! MyFoldText() " {{{

"    let line = getline(v:foldstart)

"    let nucolwidth = &fdc + &number * &numberwidth
"    let windowwidth = winwidth(0) - nucolwidth - 3
"    let foldedlinecount = v:foldend - v:foldstart

"    " expand tabs into spaces
"    let onetab = strpart('          ', 0, &tabstop)
"    let line = substitute(line, '\t', onetab, 'g')

"    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
"    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
"    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '

"endfunction " }}}

"function MyFoldText() " {{{

"  let nucolwidth = &fdc + &number*&numberwidth
"  let winwd = winwidth(0) - nucolwidth - 5
"  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
"  let prefix = " _______>>> "
"  let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
"  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
"  let fillcharcount = winwd - len(line) - len(fdnfo)
"  return line . repeat(" ",fillcharcount) . fdnfo

"endfunction " }}}
"set foldtext=MyFoldText()

"if has("folding")
"  set foldtext=MyFoldText()
"  function! MyFoldText()
"    " for now, just don't try if version isn't 7 or higher
"    if v:version < 701
"      return foldtext()
"    endif
"    " clear fold from fillchars to set it up the way we want later
"    let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
"    let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
"    if &fdm=='diff'
"      let l:linetext=''
"      let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
"      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
"      let l:align = (l:align / 2) + (strlen(l:foldtext)/2)
"      " note trailing space on next line
"      setlocal fillchars+=fold:\ 
"    elseif !exists('b:foldpat') || b:foldpat==0
"      let l:foldtext = ' '.(v:foldend-v:foldstart).' lines folded'.v:folddashes.'|'
"      let l:endofline = (&textwidth>0 ? &textwidth : 80)
"      let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strlen(l:foldtext))
"      let l:align = l:endofline-strlen(l:linetext)
"      setlocal fillchars+=fold:-
"    elseif b:foldpat==1
"      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
"      let l:foldtext = ' '.v:folddashes
"      let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
"      let l:linetext .= ' ---'.(v:foldend-v:foldstart-1).' lines--- '
"      let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
"      let l:linetext = strpart(l:linetext,0,l:align-strlen(l:foldtext))
"      let l:align -= strlen(l:linetext)
"      setlocal fillchars+=fold:-
"    endif
"    return printf('%s%*s', l:linetext, l:align, l:foldtext)
"  endfunction
"endif


" Open all folds when opening a file. Note, perl automatically sets foldmethod in the syntax file
"function! SetFoldingOptions() " {{{

    "setlocal foldmethod=syntax
    "setlocal foldlevelstart=4

"endfunction " }}}
"autocmd FileType c,cpp,vim,xml,html,xhtml call SetFoldingOptions()

nmap <Leader>z zMzvzz

" }}}
" Color settings, highlights, visual {{{

set background=dark

let g:bandit_dir = g:bundle_dir.'/bandit'
if isdirectory(g:bandit_dir)
    colorscheme bandit
endif

set noerrorbells
set noflash

" syntax higlight on
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

set showmatch
set matchtime=5  " show matching brackets for 0.5 seconds

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>
set comments=s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:-


if has("statusline") 

    " always show the status line
    set laststatus=2 
    " now set it up to change the status line based on mode
    "    if version >= 700
    "      au InsertEnter * hi StatusLine ctermbg=red 
    "      au InsertLeave * hi StatusLine ctermfg=white ctermbg=black
    "    endif

    function! HasPaste()

        if &paste
            return 'PASTE MODE  '
        else
            return ''
        endif
    endfunction

    " Format the statusline
    "    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c

    " Custom status line
    set statusline=   " clear the statusline for when vimrc is reloaded

    "" A statusbar function, that provides a visual scrollbar (courtesy of A.Politz)
    "func! STL()
    "let stl = '%f [%{(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?",B":"")}%M%R%H%W] %y [%l/%L,%v] [%p%%]'
    "let barWidth = &columns - 250 " <-- wild guess
    "let barWidth = barWidth < 3 ? 3 : barWidth

    "if line('$') > 1
    "let progress = (line('.')-1) * (barWidth-1) / (line('$')-1)
    "else
    "let progress = barWidth/2
    "endif

    "" line + vcol + %
    "let pad = strlen(line('$'))-strlen(line('.')) + 3 - strlen(virtcol('.')) + 3 - strlen(line('.')*100/line('$'))
    "let bar = repeat(' ',pad).' [%1*%'.barWidth.'.'.barWidth.'('
    "\.repeat('-',progress )
    "\.'%2*0%1*'
    "\.repeat('-',barWidth - progress - 1).'%0*%)%<]'

    "return stl.bar
    "endfun

    "hi def link User1 DiffAdd
    "hi def link User2 DiffDelete
    "set stl=%!STL()

    " Highlight the current line, except for TabBar win
    au WinEnter,BufEnter * call SetCursorline()
    au WinLeave * set nocursorline

    function! SetCursorline()
        if(bufname('%') != '-MiniBufExplorer-')
            set cursorline
        endif
    endfunction

    " Don't try to highlight lines longer than 800 characters.
    set synmaxcol=800

    " For the most accurate but slowest result, set the syntax synchronization method to fromstart. This can be done with an autocmd in your vimrc:
    "autocmd BufEnter * :syntax sync fromstart
    "au BufWinEnter * e!

    "function! InsertStatuslineColor(mode)
    "hi cursorline ctermbg=239
    "endfunction

    "function! InsertLeaveActions()
    "hi cursorline ctermbg=237
    "endfunction

    "au InsertEnter * call InsertStatuslineColor(v:insertmode)
    "au InsertLeave * call InsertLeaveActions()
    " to handle exiting insert mode via a control-C
    "inoremap <silent><C-C> <C-C>:call InsertLeaveActions()<CR>

endif

"fu! ShowTab()
"return (indent('.') / &sw )
"endf

fun! FileTime()
    let ext=tolower(expand("%:e"))
    let fname=tolower(expand('%<'))
    let filename=fname . '.' . ext
    let msg=""
    let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
    return msg
endf

set rulerformat=%15(%c%V\ %p%%%)

"    set autoindent
"    set formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
"    set formatlistpat+=^\\s*\\*\\s*\@\\s*\\w*\\s*
set formatoptions=rq " Automatically insert comment leader on return, 
" and let gq format comments

" Show 80 char limit
"    highlight OverLength ctermbg=lightgray guibg=lightgray
"    match OverLength /\%81v.*/


" highlight search
set hlsearch!
" incremental search
set incsearch

" Maintain more context around the cursor 
" When the cursor is moved outside the viewport of the current window, 
" the buffer is scrolled by a single line. 
" Setting the option below will start the scrolling three lines before the border, 
" keeping more context around where you're working. 
"set scrolloff=5
"set sidescrolloff=10

set report=0 " tell us when anything is changed via :...

" Tenter de rester toujours sur la même colonne lors de changements de
" lignes :
set nostartofline

set wrap " wrap line

set showmode " Show the current mode

" By default, vim doesn't let the cursor stray beyond the defined text. This 
" setting allows the cursor to freely roam anywhere it likes in command mode. 
" It feels weird at first but is quite useful.
set virtualedit=all

set number

" }}}
" Plugins/Scripts {{{

filetype plugin on

" Alternate plugin {{{

let g:alternateNoDefaultAlternate = 1
let g:alternateSearchPath = 'reg:|src/\([^/]*\)/.*|src/\1/include/\1||,reg:|src/\([^/]*\)/.*|src/\1/entry||,reg:|src/\([^/]*\)/.*|src/\1/command||,reg:|src/\([^/]*\)/.*|src/\1/basic||,reg:|src/\([^/]*\)/.*|src/\1/field||,reg:|src/\([^/]*\)/.*|src/\1/gdminterface||,reg:|src/\([^/]*\)/.*|src/\1/msgencoder||,reg:|src/\([^/]*\)/.*|src/\1/msginterface||,reg:|src/\([^/]*\)/.*|src/\1/test||,reg:|src/\([^/]*\)/.*|src/\1/server||,reg:|src/\([^/]*\)/.*|src/\1/proxy_core||,reg:|src/\([^/]*\)/.*|src/\1/common||,reg:|src/\([^/]*\)/.*|src/\1/dbadaptor||,reg:|src/\([^/]*\)/.*|src/\1/dbrequest||,reg:|src/\([^/]*\)/.*|src/\1/bointerface||,reg:|src/\([^/]*\)/.*|src/\1/factory||,reg:|src/\([^/]*\)/.*|src/\1/bom||'

map <Leader>a :A<CR>
vmap <Leader>a <C-C>:A<CR>gv
imap <Leader>a <C-C>:A<CR>i

" }}}
" TabBar {{{

" Don't load TabBar
let Tb_loaded= 1
let g:Tb_TabWrap = 1
" Limit number of line displaying tabs in the tabs window
let g:Tb_MaxSize = 0
" 1 mouse click to change tab
let g:Tb_UseSingleClick = 1
" Only show TabBar if we have a real buffer
let g:Tb_MoreThanOne = 0
"let g:Tb_ModSelTarget = 1
"noremap <silent> <M-w> :Tbbp<CR>
"vnoremap <silent> <M-w> <ESC>:Tbbp<CR>gv
"inoremap <silent> <M-w> <ESC>:Tbbp<CR>i
"noremap <silent> <M-e> :Tbbn<CR>
"noremap <silent> <M-e> :Tbbn<CR>
"vnoremap <silent> <M-e> <ESC>:Tbbn<CR>gv
"inoremap <silent> <M-e> <ESC>:Tbbn<CR>i

" }}}
" MiniBufExpl {{{

"let g:miniBufExplorerDebugLevel = 5
"let g:miniBufExplDebugMode = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplBuffersNeeded = 0
" Previous buffer
noremap    <silent>   <M-w>   :MBEbp<CR>
vnoremap   <silent>   <M-w>   <C-c>:MBEbp<CR>
inoremap   <silent>   <M-w>   <C-c>:MBEbp<CR>i
" Next buffer
noremap    <silent>   <M-e>   :MBEbn<CR>
noremap    <silent>   <M-e>   :MBEbn<CR>
vnoremap   <silent>   <M-e>   <C-c>:MBEbn<CR>
inoremap   <silent>   <M-e>   <C-c>:MBEbn<CR>i
" Next buffer (mru)
noremap    <silent>   <S-x>   :MBEbf<CR>
vnoremap   <silent>   <S-x>   <C-c>:MBEbf<CR>
"inoremap   <silent>   <S-x>   <C-c>:MBEbf<CR>i
" Previous buffer (mru)
noremap    <silent>   <S-z>   :MBEbb<CR>
vnoremap   <silent>   <S-z>   <C-c>:MBEbb<CR>
"inoremap   <silent>   <S-z>   <C-c>:MBEbb<CR>i

" }}}
" Omnicppcomplete {{{

"imap <Tab> <C-x><C-o>
" imap <C-Space> <C-x><C-o>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 0
let OmniCpp_DisplayMode = 0
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_DefaultNamespaces = []
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
let OmniCpp_SelectFirstItem = 0
let OmniCpp_LocalSearchDecl = 1

"set completeopt=menu,preview  " default
"set completeopt=menu

" }}}
" Doxygen {{{

"let g:DoxygenToolkit_briefTag_pre="\brief  " 
"let g:DoxygenToolkit_paramTag_pre="\param " 
"let g:DoxygenToolkit_returnTag="\returns   "

" }}}
" Grep {{{

let Grep_Skip_Dirs = 'RCS CVS SCCS objLinux64Rel objLinux64Dbg L64D342 L64R342 deliveries'
let Grep_Skip_Files = '*~ *,v s.* *.os .*.swp core.* .#* vim.err build.log'

" }}}
" UltiSnips {{{

let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips", "bundle/snippets"]

" }}}
" Neosnippet {{{

"let g:neosnippet#disable_select_mode_mappings = 0

"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif

"" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

"" Use sippets from https://github.com/honza/vim-snippets
"let g:neosnippet#snippets_directory = g:bundle_dir . '/snippets/snippets'

"" Tab completion --> see neocomplete mapping

"" }}}
" Neocomplcache {{{

"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 0
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_auto_completion_start_length = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 0
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 1
"" Set manual completion length.
"let g:neocomplcache_manual_completion_start_length = 0
"let g:NeoComplCacheAutoCompletionLength = 1
""let g:neocomplcache_caching_limit_file_size = 1000000
"" Disable ctags
"let g:neocomplcache_ctags_program = ''

"if !exists('g:neocomplcache_omni_patterns')
"    let g:neocomplcache_omni_patterns = {}
"endif
""let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
""let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"            \ 'default' : '',
"            \ 'vimshell' : $HOME.'/.vimshell_hist',
"            \ 'scheme' : $HOME.'/.gosh_completions'
"            \ }

"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\v\h\w*'

"" Tab completion for neosnippet and neocomplete
"imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : <SID>check_back_space() ?
" \ "\<Tab>" : neocomplcache#start_manual_complete()

"smap <expr><Tab> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : <SID>check_back_space() ?
" \ "\<Tab>" : neocomplcache#start_manual_complete()

function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
"}}}

" }}}
" Neocomplete {{{

let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_ignore_case = 1

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Tab completion for neosnippet and neocomplete
"imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : <SID>check_back_space() ?
" \ "\<Tab>" : neocomplete#start_manual_complete()

"smap <expr><Tab> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : <SID>check_back_space() ?
" \ "\<Tab>" : neocomplete#start_manual_complete()

function! s:check_back_space() "{{{

  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'

endfunction
"}}}

" }}}
" Indent guide {{{

let g:indent_guides_enable_on_vim_startup = 1
"autocmd BufWinEnter *.cpp :IndentGuidesEnable
"autocmd BufWinEnter *.hpp :IndentGuidesEnable
let g:indent_guides_indent_levels = 8
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237 ctermfg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238 ctermfg=242

" }}}
" Yankring {{{

"nnoremap Y y$
"let g:yankring_n_keys = 'Y D x K'
"function! YRRunAfterMaps()
"nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
"endfunction
"nnoremap <silent> <F3> :YRShow<CR>
""let g:yankring_n_keys = 'Y D s S'
"let g:yankring_replace_n_pkey = '<Tab>'
"let g:yankring_replace_n_nkey = '<S-Tab>'

" }}}
" Yankstack {{{

"let g:yankstack_map_keys = 0
" The following needs to be called before any mapping redefining yank
" actions (e.g. 'nmap Y y$' )
let g:yankstack_dir = g:bundle_dir.'/vim-yankstack'
if isdirectory(g:yankstack_dir)
    call yankstack#setup()
    nmap <Tab> <Plug>yankstack_substitute_older_paste
    nmap <S-Tab> <Plug>yankstack_substitute_newer_paste
    nnoremap <F3> :Yanks<CR>
endif

" }}}
" Mark {{{

" Some stuff moved to mark.vim
let g:mwDefaultHighlightingPalette = 'maximum'

" }}}
" Gundo {{{

"nnoremap <silent> <F8> :GundoToggle<CR>

" }}}
" Undotree {{{

nnoremap <silent> <F8>  :UndotreeToggle<CR>

" }}}
" Enhanced Commentify {{{

"let g:EnhCommentifyTraditionalMode = 'no'
"let g:EnhCommentifyFirstLineMode = 'no'
"let g:EnhCommentifyUserBindings = 'no'
"let g:EnhCommentifyUserMode = 'yes'

" }}}
" Xml {{{

let g:xml_syntax_folding = 1
"au FileType xml setlocal foldmethod=syntax
"set foldmethod=syntax

" }}}
" Tagbar {{{

nnoremap <silent> <F4> :TagbarToggle<CR>

" }}}
" Rainbow_parenthesis {{{

"let g:rbpt_colorpairs = [
"\ ['202', '202'],
"\ ['208', '208'],
"\ ['214', '214'],
"\ ['220', '220'],
"\ ['226', '226'],
"\ ['202', '202'],
"\ ['208', '208'],
"\ ['214', '214'],
"\ ['220', '220'],
"\ ['7', '7'],
"\ ['6', '6'],
"\ ['5', '5'],
"\ ['4', '4'],
"\ ['3', '3'],
"\ ['2', '2'],
"\ ['1', '1'],
"\ ]

" }}}
" Vcscommand {{{

"let VCSCommandCommitOnWrite = 0
au FileType cvslog set syntax=rcslog
"nmap <Leader>C <Plug>VCSCommit

" }}}
" Sessionman {{{

let sessionman_save_on_exit = 1
noremap <silent> <F12> :SessionList<CR>

" }}}
" Quickfixsigns {{{

" default is 4000 ms
" makes quickfixsigns plugin faster to refresh
"set updatetime=500
"let g:quickfixsigns_balloon = 0
"let g:quickfixsigns#marks#marks = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
"let g:quickfixsigns_class_vcsdiff = {'sign': '*quickfixsigns#vcsdiff#Signs', 'get': 'quickfixsigns#vcsdiff#GetList(%s)', 'event': ['BufWritePost','BufRead'], 'always_new': 1}

"function! ToggleQuickfixSigns()
"  "if g:quickfixsigns#marks#marks == []
"  if g:quickfixsigns_class_vcsdiff == {}
"    let g:quickfixsigns#marks#marks = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
"    let g:quickfixsigns_class_vcsdiff = {'sign': '*quickfixsigns#vcsdiff#Signs', 'get': 'quickfixsigns#vcsdiff#GetList(%s)', 'event': ['BufWritePost','BufRead'], 'always_new': 1}
"  else
"    let g:quickfixsigns#marks#marks = []
"    let g:quickfixsigns_class_vcsdiff = {}
"  endif
"  QuickfixsignsSet
"endfunction
"silent command! ToggleQuickfixSigns :silent call ToggleQuickfixSigns()

" <F11>
"silent! noremap <silent> <F11> :ToggleQuickfixSigns<CR>
"silent! vmap <silent> <F11> <ESC>:ToggleQuickfixSigns<CR>gv
"silent! imap <silent> <F11> <C-O><F11>

"let g:quickfixsigns_events = ['BufWritePost']

" }}}
" Vim-powerline (old) {{{

call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/Powerline_cache')
let Powerline_cache_file = $TMPDIR.'/'.$USER.'/_VIM/Powerline_cache/Powerline.cache'
let Powerline_cache_enabled = 1
let Powerline_symbols="fancy"

" }}}
" powerline (new) {{{

"let pl_dir = g:bundle_dir . '/powerline'
"if isdirectory(pl_dir)
"  let &rtp = &rtp . ',' . pl_dir . '/powerline/bindings/vim'
"endif

" }}}
" TagHighlight {{{

if ! exists('g:TagHighlightSettings')          
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['LanguageDetectionMethods'] =
            \ ['Extension', 'FileType']
let g:TagHighlightSettings['FileTypeLanguageOverrides'] =
            \ {'tagbar': 'c'}
let g:TagHighlightSettings['CtagsExecutable'] = 'etags'
let g:TagHighlightSettings['IncludeLocals'] = 'False'
let g:TagHighlightSettings['IncludeSynMatches'] = 'False'
let g:TagHighlightSettings['DoNotGenerateTagsIfPresent'] = 'True'
let g:TagHighlightSettings['DisableTagManager'] = 'True'
"let g:TagHighlightSettings['DisableTypeParsing'] = 'True'
"let g:TagHighlightSettings['DoNotGenerateTagsIfPresent'] = 'True'

"exe 'so $TMPDIR/$USER/_SYNTAX/types_c.taghl'
"let g:TagHighlightLoadedLibraries =
"\ [{
"\     'Name': 'Local',
"\     'Filename': 'types_c.taghl',
"\     'Path': $TMPDIR.'/$USER/_SYNTAX/',
"\ }]

"let g:TagHighlightSettings['DebugFile'] = '~/TagHL_debug.txt'
"let g:TagHighlightSettings['DebugLevel'] = 'Information'

" }}}
" Easytag {{{

""let g:easytags_file = '$HOME/ngi_1/tags'
"let g:easytags_include_members = 1
"let g:easytags_suppress_ctags_warning = 0
"let g:easytags_always_enabled = 0
"let g:easytags_by_filetype = 1
"let g:easytags_python_enabled = 1

" }}}
" Marks {{{

let g:mwAutoSaveMarks = 1
let g:mwAutoLoadMarks = 1
" I already use <Leader>r to repalce words..
nmap <silent> <Leader>R <Plug>MarkRegex
xmap <silent> <Leader>R <Plug>MarkRegex
" Add new mark
nmap <silent> + <Plug>MarkSet
xmap <silent> + <Plug>MarkSet
" Temporary clear all marks
nmap <silent> - <Plug>ClearLastMark
xmap <silent> - <Plug>ClearLastMark
" Clear all marks
nmap <silent> ­ <Plug>MarkClear
xmap <silent> ­ <Plug>MarkClear
"To remove the default overriding of * and #, use:
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev

" Marks #colors
" (moved to ~/.vim/bundle/bandit/colors/bandit.vim)
"highlight MarkWord1 ctermbg=117 ctermfg=black
"highlight MarkWord2 ctermbg=119 ctermfg=black
"highlight MarkWord3 ctermbg=220 ctermfg=black

" }}}
" Syntastic {{{

let g:syntastic_cpp_check_header = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let b:syntastic_cpp_cflags = ' -I$HOME/ngi_1/src/acp/include'

noremap <S-F5> :SyntasticCheck<CR>
noremap <silent> <S-F10> :silent botright Errors<CR>

" }}}
" DynamicSigns {{{

""let g:Signs_IndentationLevel = 1
"":let g:SignsMixedIndentation = 1
":let g:Signs_Bookmarks = 1
":let g:Signs_QFList = 1
":let g:Signs_Diff = 1
":let g:Signs_Scrollbar = 1

" }}}
" Clang complete {{{

"let g:clang_use_library = 1

"source /remote/intdeliv/sscdelde/clang/vimrc
"let g:clang_library_path="/remote/intdeliv/sscdelde/clang/current/lib"

"let g:clang_complete_auto     = 1
"let g:clang_complete_copen    = 1

"let g:clang_hl_errors         = 1
"let g:clang_periodic_quickfix = 1
"let g:clang_snippets          = 1

"set runtimepath+=/remote/intdeliv/sscdelde/clang/vim
"nnoremap <F4> :call g:ClangUpdateQuickFix()<CR>:cw<CR>

" }}}
" CCTree {{{

"let g:CCTreeMinVisibleDepth = 1

" }}}
" Marvim {{{

" To change the macro storage location use the following
call EnsureDirExists($HOME.'/.vimmacros')
let marvim_store = $HOME.'/.vimmacros' 

let marvim_find_key = '<leader>mm'
let marvim_store_key = '<leader>ms'
let marvim_register = 'q'
"let marvim_prefix = 0           " disable default syntax based prefix

" }}}
"Scratch {{{

nnoremap <silent> <Leader>sc :Sscratch<CR>

" }}}
" errormarker {{{

"nmap <silent> <unique> <Leader>cc :ErrorAtCursor<CR>
let g:errormarker_disablemappings = 1

" }}}
" EasyGrep {{{

"set grepprg=grep\ -R
" 0 - vimgrep
" 1 - grep (follows grepprg)
let EasyGrepCommand = 1
let EasyGrepMode = 2
let EasyGrepRecursive = 1
let EasyGrepHidden = 1
let EasyGrepAllOptionsInExplorer = 1
" 0 - quickfix
" 1 - location list
let EasyGrepWindow = 0

" }}}
" VimOrganizer {{{

let g:org_todo_setup='TODO WAITING ON-GOING COMMITTED REQ_LOAD_TST LOADED_IN_TST REQ_LOAD_PRD | DONE'
"let g:org_todo_custom_highlights =
"      \ {
"      \   'TODO': {'guifg':'white', 'guibg':'blue'},
"      \   'WAITING': { 'ctermfg':'white', 'ctermbg':'red' },
"      \   'ON-GOING': { 'ctermfg':'white', 'ctermbg':'blue' },
"      \   'DONE': { 'ctermfg':'white', 'ctermbg':'green' }
"      \ }

" }}}
" operator-camelize {{{

map <Leader>tc <Plug>(operator-camelize-toggle)

" }}}
"Signify {{{

"let g:signify_disable_by_default = 0
let g:signify_vcs_list = ['cvs', 'hg', 'git']
"let g:signify_line_highlight = 1
"let g:signify_mapping_next_hunk = '<C-Down>'
"let g:signify_mapping_prev_hunk = '<C-Up>'

" }}}
" Easyclip {{{

let g:EasyClipUseYankDefaults = 0
let g:EasyClipUseCutDefaults = 0
let g:EasyClipUseBlackholeDefaults = 0
let g:EasyClipUsePasteDefaults = 0
let g:EasyClipUseSubstituteDefaults = 1

" }}}
" Unite {{{

let g:unite_source_grep_max_candidates = 1000
let g:unite_source_find_max_candidates = 100000
let g:unite_source_rec_max_cache_files = 10000
let g:unite_source_file_rec_max_cache_files = 10000

call unite#custom#source('file,file/new,buffer,file_rec,grep,command,buffer,function,jump,launcher,mapping,output,process,register,help',
            \ 'matchers', 'matcher_fuzzy')
" Mappings
nnoremap <C-p> :<C-u>Unite -no-split -start-insert file_rec/async<CR>
nnoremap <Leader>us :Unite -no-split -start-insert grep:.<CR>
nnoremap <Leader>uc :Unite -no-split -start-insert command<CR>
nnoremap <Leader>ub :Unite -no-split -start-insert buffer<CR>
nnoremap <Leader>uf :Unite -no-split -start-insert function<CR>
nnoremap <Leader>uj :Unite -no-split -start-insert jump<CR>
nnoremap <Leader>ul :Unite -no-split -start-insert launcher<CR>
nnoremap <Leader>um :Unite -no-split -start-insert mapping<CR>
nnoremap <Leader>uo :Unite -no-split -start-insert output<CR>
nnoremap <Leader>up :Unite -no-split -start-insert process<CR>
nnoremap <Leader>ur :Unite -no-split -start-insert register<CR>
nnoremap <Leader>uh :Unite -no-split -start-insert help<CR>

if executable('ag')
  " Use ag in unite grep source
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
        \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

" }}}
" Startify {{{

let g:startify_session_dir = $HOME . '/.vim/sessions'
let g:startify_custom_header = [
            \ '   __      ___            ______ ____   ',
            \ '   \ \    / (_)           |____  |___ \ ',
            \ '    \ \  / / _ _ __ ___       / /  __) |',
            \ '     \ \/ / | | ''_ ` _ \     / /  |__ <',
            \ '      \  /  | | | | | | |   / /   ___) |',
            \ '       \/   |_|_| |_| |_|  /_(_) |____/ ',
            \ '',
            \ '',
            \ ]

" }}}
" LargeFile {{{

let g:LargeFile = '100MB'

" }}}
" Airline {{{

let g:airline_section_b = '%{getcwd()}'
"let g:airline_left_sep = '◆' 
"let g:airline_left_sep = '】' 
"let g:airline_left_sep = '〉' 
let g:airline_left_sep = '》' 
"let g:airline_right_sep = '◆'
"let g:airline_right_sep = '【'
"let g:airline_right_sep = '〈'
let g:airline_right_sep = '《'
"let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
"let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = 'Þ'
"let g:airline_paste_symbol = 'ρ'
"let g:airline_paste_symbol = 'Þ'
"let g:airline_paste_symbol = '∥'

" }}}
" YouCompleteMe {{{
" Compilation:
"   cmake -G "Unix Makefiles" -DPYTHON_LIBRARY=/softntools/opt/Python-2.7/lib  -DPYTHON_INCLUDE_DIR=/softntools/opt/Python-2.7/include/python2.7 -DPYTHON_EXECUTABLE=/softntools/opt/Python-2.7/bin/python  -DPATH_TO_LLVM_ROOT=~/env . ~/.vim/bundle/YouCompleteMe/cpp
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}

" }}}
" Mappings {{{

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" select the last changed text (or the text that was just pasted)
nnoremap <expr> gV "`[".getregtype(v:register)[0]."`]"

" Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" move visual selection:
" to the right
vnoremap <expr> <C-Right> 'dp`[' . strpart(getregtype(), 0, 1) . '`]'
"vnoremap <expr> gh 'dp`[' . strpart(getregtype(), 0, 1) . '`]'
" to the left
vnoremap <expr> <C-Left> 'dhhp`[' . strpart(getregtype(), 0, 1) . '`]'
" up
vnoremap <expr> <C-Up> 'dkhp`[' . strpart(getregtype(), 0, 1) . '`]'
" down
vnoremap <expr> <C-Down> 'djhp`[' . strpart(getregtype(), 0, 1) . '`]'

" Spell check
nnoremap <silent> <S-F4> :setlocal invspell spell? spelllang=en_us<CR>

" Use <F2> for saving, also in Insert mode
noremap <F2> :w<CR>
vnoremap <F2> <C-C>:w<CR>gv
inoremap <F2> <C-O>:w<CR>

" save to new file and open it
"    nnoremap :we :WriteAndEdit 
" <F5>
noremap <F5> :e!<CR>

" Have Y behave analogously to D and C rather
" than to dd and cc (which is already done by yy):
nmap Y y$

" Edit/source dot files
nmap <silent> <Leader>ev :cd ~/.vim/bundle<CR>:execute "e ".g:dot_vim_dir."/.vimrc"<CR>
nmap <silent> <Leader>sv :execute "source ".g:dot_vim_dir."/.vimrc"<CR>
nmap <silent> <Leader>ez :cd ~/.oh-my-zsh<CR>:execute "e ~/.zshrc.".$USER<CR>
nmap <silent> <Leader>ex :e ~/.Xresources<CR>
nmap <silent> <Leader>ef :e ~/.fonts.conf<CR>
nmap <silent> <Leader>ei :e ~/.inputrc<CR>
nmap <silent> <Leader>et :execute "e ~/.tmux.conf"<CR>
"nmap <silent> <Leader>eto :execute "e ~/doc/TODO_LIST.org"<CR>:let g:quickfixsigns#marks#marks = []<CR>:let g:quickfixsigns_class_vcsdiff = {}<CR>


" Edit TTS files
nmap <silent> <Leader>tl :e %.log<CR>
nmap <silent> <Leader>tr :e NONREG_RESULTS-STDOUT.txt<CR>

" Wrap on/off
nmap <silent> <Leader>w :set invwrap<CR>:set wrap?<CR>

" Delete the previous word
"Arpeggio inoremap dw <C-W>
"call arpeggio#map('i', '', 0, '<SPACE>', '<C-W>')


" Write a backup file at every ESC keypress
fun! InitBex() 
    let myvar = strftime("_%y%m%d-%Hh%Mm%Ss") 
    let myvar = "set backupext=_". myvar 
    execute myvar 
endfun 
silent command! WriteBackup :silent call InitBex()
autocmd BufWritePre * silent WriteBackup
"noremap <silent> <ESC> :silent WriteBackup<CR>

nmap n nzvzz
nmap N Nzvzz
"nmap g* g*zvzz 
"nmap g# g#zvzz

" Reformat a paragraph:
vnoremap Q gq
nnoremap Q gqap
map K <silent>

map <C-K> <C-W>k<C-W>_

" window splitting maps
"nmap <leader>v :vsplit<CR><C-w><C-w>:Tbbl<CR>zz<C-w><C-w><C-w><C-w>zz
"nmap <leader>v :vertical wincmd ^<CR>:wincmd w<CR>
"nmap <leader>h :split<CR><C-w><C-w>:Tbbl<CR>zz<C-w><C-w><C-w><C-w>zz
"nmap <leader>v :vsplit<CR><C-w><C-w><Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)zz<C-w><C-w><C-w><C-w>zz
"nmap <leader>h :split<CR><C-w><C-w><Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)zz<C-w><C-w><C-w><C-w>zz

"Move split window:
"" up
"nmap <C-w><C-Up> <C-w>K
"" down
"nmap <C-w><C-Down> <C-w>J
""left
"nmap <C-w><C-Left> <C-w>H
"" right
"nmap <C-w><C-Right> <C-w>L


" ====================================
function! MoveSplitSeparatorToUp() " {{{

    echo 'davide'

    let origWinNb = winnr()
    wincmd j

    if(bufname('%') == '-MiniBufExplorer-')
        let downWinNb = origWinNb
    else
        let downWinNb = winnr()
    endif
    execute origWinNb . " wincmd w"

    if(origWinNb == downWinNb)
        " We are in the down side window
        5wincmd +
    else
        " We are in the up side window
        5wincmd -
    endif

endfunction " }}}

" ====================================
function! MoveSplitSeparatorToDown() " {{{

    let origWinNb = winnr()
    wincmd k

    if(bufname('%') == '-MiniBufExplorer-')
        let upWinNb = origWinNb
    else
        let upWinNb = winnr()
    endif
    execute origWinNb . " wincmd w"

    if(origWinNb == upWinNb)
        " We are in the down side window
        5wincmd +
    else
        " We are in the up side window
        5wincmd -
    endif

endfunction " }}}

" ====================================
function! MoveSplitSeparatorToRight() " {{{

    let origWinNb = winnr()
    wincmd k

    if(bufname('%') == '-MiniBufExplorer-')
        let leftWinNb = origWinNb
    else
        let leftWinNb = winnr()
    endif
    execute origWinNb . " wincmd w"

    if(origWinNb == leftWinNb)
        " We are in the down side window
        5wincmd >
    else
        " We are in the up side window
        5wincmd <
    endif

endfunction " }}}

" ====================================
function! MoveSplitSeparatorToLeft() " {{{

    let origWinNb = winnr()
    wincmd k

    if(bufname('%') == '-MiniBufExplorer-')
        let rightWinNb = origWinNb
    else
        let rightWinNb = winnr()
    endif
    execute origWinNb . " wincmd w"

    if(origWinNb == rightWinNb)
        " We are in the down side window
        5wincmd <
    else
        " We are in the up side window
        5wincmd >
    endif

endfunction " }}}

" Window splits resizing maps

" Change height:
nmap <silent> <C-S-Down> :silent call MoveSplitSeparatorToDown()<CR>
nmap <silent> <C-S-Up> :call MoveSplitSeparatorToUp()<CR>

" Change width:
nmap <silent> <C-S-Left> :silent call MoveSplitSeparatorToRight()<CR>
nmap <silent> <C-S-Right> :silent call MoveSplitSeparatorToLeft()<CR>

"function! CloseBuffer()
"    if &buftype == '-MiniBufExplorer-'
"        return
"    elseif &buftype == 'quickfix'
"        exec "silent :cclose"
"    elseif bufname('%') == '[Command Line]'
"        quit
"    else
"        let last_buffer = bufnr('%')
"        "set nobuflisted
"        Tbbp
"        "exec "silent bwipeout ".last_buffer
"        exec "silent bdelete ".last_buffer
"    endif
"endfunction
"command! CloseBuffer call CloseBuffer()

function! CloseBufferAndSplit() " {{{

  if &buftype == '-MiniBufExplorer-'
    return
  elseif &buftype == 'quickfix'
    exec "silent :cclose"
  elseif bufname('%') == '[Command Line]'
    quit
  else
    let last_buffer = bufnr('%')
    "set nobuflisted
    "quit
    wincmd q
    "exec "silent! bdelete ".last_buffer
    exec "MBEbd ".last_buffer
    if &diff
      diffoff
    endif
  endif

endfunction " }}}
command! CloseBufferAndSplit call CloseBufferAndSplit()

" close current buffer, keep current split open
noremap <silent> <M-q> :MBEbd<CR><C-C>
vnoremap <silent> <M-q> <ESC>:MBEbd<CR>
inoremap <silent> <M-q> <ESC>:MBEbd<CR>i

" close current buffer and current split
noremap <silent> <C-q> :CloseBufferAndSplit<CR>
vnoremap <silent> <C-q> <ESC>:CloseBufferAndSplit<CR>
inoremap <silent> <C-q> <ESC>:CloseBufferAndSplit<CR>i

"From http://stackoverflow.com/questions/3984544/skipping-a-window-in-vim-with-ctrl-w-w
function! s:NextWindowBut(skip,dir) " {{{

    let w0 = winnr()
    let wp = w0
    let nok = 1
    while nok
        exe 'wincmd '.a:dir
        let w = winnr()
        let n = bufname('%')
        let nok = (n=~a:skip) && (w != w0) && (w != wp)
        if nok
            let wp = w
        endif
        "echo "skip(".n."):".(n=~a:skip)." w!=w0:".(w != w0)."(w != wp)".(w != wp)." --> ".nok
    endwhile
    if (w == wp) && (w != w0)
        exe 'wincmd p'
        echomsg "No further window!"
    elseif (w == w0)
        echomsg "No further window!"
    endif

endfunction " }}}

nnoremap <silent> <leader><leader> :call <sid>NextWindowBut('-MiniBufExplorer-','w')<CR>

nnoremap <silent> <C-w><C-w> :call <sid>NextWindowBut('-MiniBufExplorer-','w')<CR>
nnoremap <silent> <C-w><Up> :call <sid>NextWindowBut('-MiniBufExplorer-','k')<CR>
nnoremap <silent> <C-w><Down> :call <sid>NextWindowBut('-MiniBufExplorer-','j')<CR>
nnoremap <silent> <C-w><Left> :call <sid>NextWindowBut('-MiniBufExplorer-','h')<CR>
nnoremap <silent> <C-w><Right> :call <sid>NextWindowBut('-MiniBufExplorer-','l')<CR>

"noremap <silent> <M-`> :b#<CR>
"vnoremap <silent> <M-`> <ESC>:b#<CR>gv
"inoremap <silent> <M-`> <ESC>:b#<CR>i

" to go back to exact place
nnoremap ' `
nnoremap ` '
noremap '. `.zzzo
noremap '' ``zzzo

" ctrlp
let g:ctrlp_map = '<Space>'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 60
let g:ctrlp_persistent_input = 0
let g:ctrlp_clear_cache_on_exit = 0
call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/ctrlp_cache')
let g:ctrlp_cache_dir = '$TMPDIR/$USER/_VIM/ctrlp_cache'
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 0
let g:ctrlp_split_window = 0
hi CtrlpHighlightMatch cterm=Underline ctermfg=190
let g:ctrlp_highlight_match = [1, 'CtrlpHighlightMatch']
let g:ctrlp_regexp = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_working_path_mode = 0
let g:ctrlp_lazy_update = 0
let g:ctrlp_open_multiple_files = '1vr'
let g:ctrlp_mruf_default_order = 0
let g:ctrlp_mruf_save_on_update = 1
let g:ctrlp_mruf_relative = 0

let g:ctrlp_extensions = [ 'quickfix', 'undo', 'changes' ]

let g:ctrlp_prompt_mappings = {
            \ 'PrtBS()':              ['<bs>'. '', ''],
            \ 'PrtDelete()':          ['<del>'],
            \ 'PrtDeleteWord()':      ['<c-w>'],
            \ 'PrtClear()':           ['<c-u>'],
            \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
            \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
            \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
            \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
            \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
            \ 'PrtHistory(-1)':       ['<M-x>'],
            \ 'PrtHistory(1)':        ['<M-z>'],
            \ 'AcceptSelection("e")': ['<CR>', '<2-LeftMouse>'],
            \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
            \ 'AcceptSelection("t")': ['<c-t>'],
            \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
            \ 'ToggleFocus()':        ['<s-tab>'],
            \ 'ToggleRegex()':        ['<c-r>'],
            \ 'ToggleByFname()':      ['<c-d>'],
            \ 'ToggleType(1)':        ['[1;3C'],
            \ 'ToggleType(-1)':       ['[1;3D'],
            \ 'PrtExpandDir()':       ['<tab>'],
            \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
            \ 'PrtInsert()':          ['<c-\>'],
            \ 'PrtCurStart()':        ['<c-a>'],
            \ 'PrtCurEnd()':          ['<c-e>'],
            \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
            \ 'PrtCurRight()':        ['<c-l>', '<right>'],
            \ 'PrtClearCache()':      ['<F5>'],
            \ 'PrtDeleteEnt()':       ['<F7>'],
            \ 'CreateNewFile()':      ['<c-y>'],
            \ 'MarkToOpen()':         ['<space>'],
            \ 'OpenMulti()':          ['<c-o>'],
            \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
            \ }

"" matcher for ctrlP 
"let g:path_to_matcher = g:dot_vim_dir.'/bundle/ctrlp.vim/matcher'

"function! g:GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
"  " the Command-T matcher doesn't do regex. Return now if that was requested.
"  if a:regex == 1
"    let [lines, id] = [[], 0]
"    for item in a:items
"      let id += 1
"      try | if !( a:ispath && item == a:crfile ) && (match(item, a:str) >= 0)
"        cal add(lines, item)
"      en | cat | brea | endt
"    endfo
"    return lines
"  end

"  " a:mmode is currently ignored. In the future, we should probably do
"  " something about that. the matcher behaves like "full-line".
"  let cmd = g:path_to_matcher . " --limit " . a:limit . " --manifest " . ctrlp#utils#cachefile() . " "
"  if ! g:ctrlp_dotfiles
"    let cmd = cmd . "--no-dotfiles "
"  endif
"  let cmd = cmd . a:str
"  return split(system(cmd))

"endfunction
"let g:ctrlp_match_func = { 'match': 'g:GoodMatch' }

" tplugin
"TPlugin kien-ctrlp.vim-8820dec


" fix mistype :W and :Q
"command! -bang -range=% -complete=file -nargs=* WQ <line1>,<line2>wq<bang> <args>
"command! -bang -complete=file -nargs=* Qa qa<bang>
"command! -bang -complete=file -nargs=* QA qa<bang>
"command! -bang -range=% -complete=file -nargs=* Wq <line1>,<line2>wq<bang> <args>
"command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>w<bang> <args>
"command! -bang Q quit<bang>.

" Correct typos.
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" mouse block selection
"noremap <C-LeftMouse> <4-LeftMouse>
"inoremap <C-LeftMouse> <4-LeftMouse>
"onoremap <C-LeftMouse> <C-C><4-LeftMouse>
"noremap <C-LeftDrag> <LeftDrag>
"inoremap <C-LeftDrag> <LeftDrag>
"onoremap <C-LeftDrag> <C-C><LeftDrag>

" Load previous search in quickfix window
map <silent> <M-\> :colder<CR>
vmap <silent> <M-\> <ESC>:colder<CR>i
imap <silent> <M-\> <ESC>:colder<CR>i

" Load next search in quickfix window
map <silent> <M-c> :cnewer<CR>
vmap <silent> <M-c> <ESC>:cnewer<CR>i
imap <silent> <M-c> <ESC>:cnewer<CR>i

" this allows all window commands in insert mode and i'm not accidentally deleting words anymore :-)
imap <C-w> <C-o><C-w>

" insert new line without going into insert mode
au BufEnter,WinEnter *
            \ if &modifiable && &buftype != 'quickfix'|
            \   map <CR> :silent put=''<CR>|
            \   map <S-CR> :silent put!=''<CR>|
            \ else|
            \   silent! unmap <CR>|
            \   silent! unmap <S-CR>|
            \ endif

au CmdwinEnter *
            \ silent! unmap <CR>|
            \ silent! unmap <S-CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" Move to next/previous method
"nmap ] ]m
"nmap [ [m<C-C>:noh<CR>

" NERD commenter
map <Leader>x <plug>NERDCommenterInvert
map <Leader>x <plug>NERDCommenterInvert
map <Leader>cb <plug>NERDCommenterComment
vmap <Leader>cb <plug>NERDCommenterComment
map <Leader>cc <plug>NERDCommenterAlignBoth
vmap <Leader>cc <plug>NERDCommenterAlignBoth
let g:NERDCustomDelimiters = {
            \ 'edifact': { 'left': ''' ' }
            \ }

" Surround
"map <Leader>' ysiw'
"map <Leader>" ysiw"
"map <Leader>( ysiw)
"map <Leader>[ ysiw]
"map <Leader>{ ysiw}
"map <Leader>` ysiw`

" Highlight current block of code
nmap <Leader>b va{

" Jump to previous/next fold point
nmap <S-Up> zk
nmap <S-Down> zj
imap <S-Up> <C-C>zki
imap <S-Down> <C-C>zji

" Fold current block of code
"nmap <C-Left> zfi} " <C-Left>
"nmap <C-Right> zo " <C-Right>
"nmap <C-Right> vf} " <C-Right>
"nmap <C-Left> zo " <C-Left>

"" Toggle fold
"nnoremap <C-Space> zazz
"inoremap <C-Space> <C-c>zazzi
"onoremap <C-Space> <C-c>zazz

" Open fold
nnoremap <S-Right> zozz
inoremap <S-Right> <C-c>zozzi
onoremap <S-Right> <C-c>zozz

" Close fold
nnoremap <S-Left> zczz
inoremap <S-Left> <C-c>zczzi
onoremap <S-Left> <C-c>zczz

" crefvim
autocmd bufenter *.c,*.h,*.cpp,*.hpp vmap <S-F1> <Plug>CRV_CRefVimVisual
autocmd bufenter *.c,*.h,*.cpp,*.hpp nmap <S-F1> <Plug>CRV_CRefVimNormal

" stlrefvim
autocmd bufenter *.c,*.h,*.cpp,*.hpp vmap <C-F1> <Plug>StlRefVimVisual
autocmd bufenter *.c,*.h,*.cpp,*.hpp nmap <C-F1> <Plug>StlRefVimNormal

function! MergeLeftToRight() " {{{

    if !&diff
        echo "Cannot merge when not in diff mode!"
        return
    endif
    let origWinNb = winnr()
    wincmd h
    let leftWinNb = winnr()
    if(origWinNb == leftWinNb)
        " We are in the left side window
        echo "diffput!"
        normal dp]czz
    else
        " We are in the right side window
        wincmd p
        echo "diffget!"
        normal do]czz
    endif

endfunction " }}}

function! MergeRightToLeft() " {{{

    if !&diff
        echo "Cannot merge when not in diff mode!"
        return
    endif
    let origWinNb = winnr()
    wincmd l
    let rightWinNb = winnr()
    if(origWinNb == rightWinNb)
        " We are in the right side window
        echo "diffput!"
        normal dp]czz
    else
        " We are in the left side window
        wincmd p
        echo "diffget!"
        normal do]czz
    endif

endfunction " }}}

noremap <silent> <C-Right> :call MergeLeftToRight()<CR>
noremap <silent> <C-Left> :call MergeRightToLeft()<CR>

" Settings for when in diff mode
"au WinEnter *
"            \ if &diff |
"            \   map <C-Down> [czz|
"            \   map <C-Up> ]czz|
"            \ else |
"            \   map <silent> <C-Down> :<c-u>execute v:count .'SignifyJumpToNextHunk'<CR>|
"            \   map <silent> <C-Up> :<c-u>execute v:count .'SignifyJumpToPrevHunk'<CR>|
"            \ endif


" Jump to previous/next diff
map <C-Up> [czvzz
map <C-Down> ]czvzz

" Jump to previous/next quickfix location
map <M-z> :silent cprev<CR>zvzz
map <M-x> :silent cnext<CR>zvzz

" Resize splits:
" vertical
"nnoremap <Up> :vertical resize +10<CR>  " <C-Up>
"nnoremap <Down> :vertical resize -10<CR>  " <C-Down>
"inoremap <Up> <C-O>:resize +10<CR>  " <C-Up>
"inoremap <Down> <C-O>:resize -10<CR>  " <C-Down>
"" horizontal
"nnoremap <Right> :resize +10<CR>  " <C-Right>
"nnoremap <Left> :resize -10<CR>  " <C-Left>
"inoremap <Right> <C-O>:resize +10<CR>  " <C-Right>
"inoremap <Left> <C-O>:resize -10<CR>  " <C-Left>

" Keep split windows aspect ration when resizing the main terminal window
autocmd VimResized * :wincmd =


" Move to prev/next jump
nnoremap <M--> <C-O>
nnoremap <M-+> <C-I>

" Jump prev/next mru file --> Replaced by minibufexpl plugin
"nmap <S-Z> <Plug>(exjumplist-previous-buffer)
"nmap <S-X> <Plug>(exjumplist-next-buffer)

" Move to prev/next change
nnoremap <M-o> g;zvzz
nnoremap <M-i> g,zvzz

" original
"nnoremap <leader>h       "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>
"nnoremap <leader>l       "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>

" very magic
"" 9 characters shorter
"nnoremap <leader><Left>  "_yiw?\v\w+\_W+%#<CR>:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o><C-l>
"" 8 characters shorter
"nnoremap <leader><Right> "_yiw:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o>/\v\w+\_W+<CR><C-l>

" Lets you type :R <command> to run an external command and give you the
" results in a small new buffer. Useful for filtering your file and
" getting the results separately
"command! -complete=shellcmd -nargs=* R belowright 15new | r ! <args>
command! -complete=shellcmd -nargs=* R execute 'Sscratch'| r ! <args>

" Keybinds to make the global register less annoying
noremap <Leader>p :silent set paste<CR>"*]p:set nopaste<CR>
"noremap <C-P> :silent set paste<CR>"+]p:set nopaste<CR>
noremap <Leader>P :silent set paste<CR>"*]P:set nopaste<CR>
noremap <Leader>y "*y
noremap <Leader>Y "*Y

vnoremap <Leader>p <C-C>:silent set paste<CR>gv"*]p:set nopaste<CR>
vnoremap <Leader>P <C-C>:silent set paste<CR>gv"*]P:set nopaste<CR>
vnoremap <Leader>y "*y
"vnoremap <Leader>y "*ygv:!xclip -d $DISPLAY -o -selection clipboard<CR>
"vnoremap <Leader>y :!xclip -d $DISPLAY -o -selection clipboard<CR>
vnoremap <Leader>Y "*Y


" Paste over visually selected text without copying back in the default
" register the visually selected text that is overwritten
" (http://www.reddit.com/r/vim/comments/wii9v/try_that_xnoremap_expr_p_vregisterpgvyp/)
vnoremap P "_dP

" Swap two words
"nmap <silent> Xp :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`':nohlsearch<CR>
"nmap <silent> Xp dawwP

" Underline the current line with a char, and comment it
nmap <silent> <Leader>o= yyp:silent s/./=/g\|:nohls<CR><plug>NERDCommenterAlignBoth
nmap <silent> <Leader>o- yyp:silent s/./-/g\|:nohls<CR><plug>NERDCommenterAlignBoth
nmap <silent> <Leader>o* yyp:silent s/./*/g\|:nohls<CR><plug>NERDCommenterAlignBoth
nmap <silent> <Leader>o/ yyp:silent s/./\//g\|:nohls<CR><plug>NERDCommenterAlignBoth
" Same, but overline
nmap <silent> <Leader>O- yyP:silent s/./-/g\|:nohls<CR><plug>NERDCommenterAlignBoth
nmap <silent> <Leader>O= yyP:silent s/./=/g\|:nohls<CR><plug>NERDCommenterAlignBoth
nmap <silent> <Leader>O* yyP:silent s/./*/g\|:nohls<CR><plug>NERDCommenterAlignBoth
nmap <silent> <Leader>O/ yyP:silent s/./\//g\|:nohls<CR><plug>NERDCommenterAlignBoth

" Identify the syntax highlighting group used at the cursor
command! ShowSyntaxGroup silent call ShowSyntaxGroup()
function! ShowSyntaxGroup() " {{{

    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

endfunction " }}}
map <Leader>sy :call ShowSyntaxGroup()<CR>

" CtrlP
nmap <M-m> :CtrlPMRU<CR>
nmap <M-u> :CtrlPUndo<CR>
nmap <M-.> :CtrlPChange<CR>

" Source lines from current file
vnoremap <leader>S y:silent execute @@<CR>:echo 'Sourced selection.'<CR>
nnoremap <leader>S ^vg_y:silent execute @@<CR>:echo 'Sourced line.'<CR>

nnoremap <C-]> g<C-]>zvzz
nnoremap g<C-]> g<C-]>zvzz

" }}}
" Ctags, gtags and cscope {{{

" The last semicolon is the key here. When Vim tries to locate the 'tags' file,
" it first looks at the current directory, then the parent directory, then the parent of the parent, and so on:
set tags=$HOME/ngi_1/tags

" ctags completion
set complete=.,t

" gtags
"map <C-[> :Gtags<CR><CR>
map <C-\> +:Gtags -r<CR><CR>

" cscope
"  map [I :cs find c <C-r><C-w><CR> 
set csto=1

" }}}
" Functions {{{

function! DiffToggle() " {{{

    if &diff
        windo diffoff
    else
        windo diffthis
    endif

endfunction " }}}
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

" CVSdiff branch_name
command! -nargs=* CVSdiff silent call CVSdiff("<args>")
function! CVSdiff(cvsversion) " {{{

    "TbToggle
    "TbStop
    "noremap <M-z> [czz
    "noremap <M-x> ]czz
    diffthis
    let filenameRelativePath=bufname("%")
    let filenameOnly = fnamemodify(filenameRelativePath, ":t")
    let execVNew = "vnew [CVS]__" . filenameOnly
    execute execVNew 
    execute "r!cvs -q up -p " . a:cvsversion . " " . filenameRelativePath
    1d
    let Tb_loaded=1
    diffthis
    set nomodified

endfunction " }}}

" View diff of modification done on file since last save
function! s:DiffWithSaved() " {{{

    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype

endfunction " }}}
com! DiffSaved call s:DiffWithSaved()
nnoremap <silent> <Leader>ds :call DiffWithSaved()<CR>

function! Bin2Asc() " {{{

    %s//+/g
    %s//:/g
    %s//'\&\r/g
    %s//*/g

endfunction " }}}

function! CleanTTLog() " {{{

    g/^'[^']/d
    g/^UNB/d
    g/^UNZ/d
    g/^''UNB/d
    g/^''UNZ/d
    g/^$/d
    %s/^\(UNT.*'\)&/\1/
    %s/^\(''UNT.*'\)&/\1/
    %s/esponse\nUNH/esponse\r\r\rUNH/

endfunction " }}}

function! DeleteHiddenBuffers() " {{{

    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor

endfunction " }}}

function! Refactor() " {{{

    call inputsave()
    let @z=input("Replace local var " . @z . "' with: ")
    call inputrestore()

endfunction " }}}
" Locally (local to block) rename a variable
nmap <Leader>rv "zyiw:call Refactor()<CR>mx:silent! norm gd<CR>[V%:s/<C-R>//<c-r>z/gc<CR>`x



" Execute 'cmd' while redirecting output.
" Delete all lines that do not match regex 'filter' (if not empty).
" Delete any blank lines.
" Delete '<whitespace><number>:<whitespace>' from start of each line.
" Display result in a scratch buffer.
function! s:Filter_lines(cmd, filter) " {{{

    let save_more = &more
    set nomore
    redir => lines
    silent execute a:cmd
    redir END
    let &more = save_more
    new
    setlocal buftype=nofile bufhidden=hide noswapfile
    put =lines
    g/^\s*$/d
    %s/^\s*\d\+:\s*//e
    if !empty(a:filter)
        execute 'v/' . a:filter . '/d'
    endif
    0

endfunction " }}}
command! -nargs=? Scriptnames call s:Filter_lines('scriptnames', <q-args>)

" }}} Functions end
" Compilation, start/stop applications, testing {{{

set makeef=vim.err

call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/scons_errors')
function! Scons() " {{{

    let l:save_shellcmdflag = &shellcmdflag
    set shellcmdflag=-ic
    :cd ~/ngi_1
    ":lcd ~/ngi_1
    :!~/doc/scripts/scons.sh 2>&1 | ~/doc/scripts/filter_scons.sh 2>&1 >| $TMPDIR/$USER/_VIM/scons_errors/scons.err&
    ":cd -
    exe 'set shellcmdflag='.escape(l:save_shellcmdflag,' ')
    :cf $TMPDIR/$USER/_VIM/scons_errors/scons.err

endfunction " }}}

noremap <F7> :!~/doc/scripts/kill_scons.sh<CR>

function! RestartBE() " {{{

    let l:save_shellcmdflag = &shellcmdflag
    set shellcmdflag=-ic
    :!~/doc/scripts/restartBEs.sh LINUX AGS_SvrAVL_APE 2>&1 >| $TMPDIR/$USER/_VIM/restart_logs/logs&
    exe 'set shellcmdflag='.escape(l:save_shellcmdflag,' ')
    :cf $TMPDIR/$USER/_VIM/restart_logs/logs

endfunction " }}}

" Start compilation
noremap <F9> :call Scons()<CR>:botright copen<CR>

call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/restart_logs')
noremap <C-F9> :call RestartBE()<CR>:botright copen<CR>

noremap <silent> <F10> :silent botright copen<CR>:silent cg $TMPDIR/$USER/_VIM/scons_errors/scons.err<CR>:silent setlocal autoread<CR>G
noremap <silent> <C-F10> :silent botright copen<CR>:silent cg $TMPDIR/$USER/_VIM/restart_logs/logs<CR>:silent setlocal autoread<CR>G

" Return the hex string of a number.
func! Nr2hex(nr)
    let n = a:nr
    let r = ""
    while n
        let r = '0123456789ABCDEF'[n % 16] . r
        let n = n / 16
    endwhile
    return r
endfunc

" Convert each character in a string to a two-digit hex string.
func! String2hex(str)
    let out = ''
    let ix = 0
    while ix < strlen(a:str)
        let out = out . Nr2hex(char2nr(a:str[ix]))
        let ix = ix + 1
    endwhile
    return out
endfunc

function! Dec2Hex() " {{{

    let lstr = getline(".")
    let decstr = matchstr(lstr, '\<[0-9]\+\>')
    while decstr != ""
        let decstr = printf("0x%x", decstr)
        exe 's#\<[0-9]\+\>#'.decstr."#"
        let lstr = getline(".")
        let decstr = matchstr(lstr, '\<[0-9]\+\>')
    endwhile

endfunction " }}}

vnoremap <Leader>th :call Dec2Hex()<CR>

function! Hex2Dec() " {{{

    let lstr = getline(".")
    let hexstr = matchstr(lstr, '0x[a-fA-F0-9]\+')
    while hexstr != ""
        let hexstr = hexstr + 0
        exe 's#0x[a-fA-F0-9]\+#'.hexstr."#"
        let lstr = substitute(lstr, '0x[a-fA-F0-9]\+', hexstr, "")
        let hexstr = matchstr(lstr, '0x[a-fA-F0-9]\+')
    endwhile

endfunction " }}}

vnoremap <Leader>ha :call Hex2Dec()<CR>

function! VimDiffResultTTS() " {{{

    diffthis
    "execute "rightbelow vsplit " . '%' . ".log"
    let test_file = expand("%")
    execute "rightbelow vsplit " . test_file . ".result"
    execute "r!cat " . test_file . ".log | grep -v 'UN[BNZT]' | grep -v '^\'\'\'\'DCX' | grep -v '\'\'[ -]'"
    diffthis
    wincmd h

endfunction " }}}

" }}}
" Macros {{{

" ********************************
" *********** SEARCH *************
" ********************************

" Open quickfix window after grep commands
autocmd QuickFixCmdPost *grep* cwindow


" === ACK ===
" Motions to Ack for things.  Works with pretty much everything, including:
"  w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

"nnoremap <silent> <leader>A :set opfunc=<SID>AckMotion<CR>g@
"nnoremap <leader>A :set opfunc=<SID>AckMotion<CR>g@
"xnoremap <silent> <leader>A :<C-U>call <SID>AckMotion(visualmode())<CR>

"nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<CR>
"xnoremap <silent> <bs> :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<CR>"

    let @@ = reg_save
endfunction
" ===========


" ***********************************************
" Target string unfilled
" ***********************************************
" Recursive search in file tree
nnoremap  <Leader>s :Rgrep -i  *pp<Left><Left><Left><Left>
" Search in open buffers
nnoremap  <Leader>sb :Bgrep -i 
" Search in files matching the regex, save matching filenames in args
"nnoremap <Leader>sa :args `grep -Ril \"\" *`<Left><Left><Left><Left><Left>
nnoremap <Leader>sa :args `find . -name \"*\" -exec grep -il \"\" '{}' \;`<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" Search in vim help pages
nnoremap  <Leader>sh :helpgrep 

" ***********************************************
" Target string is the word under the cursor
" ***********************************************
" Recursive search in file tree, NOT whole word ("pattern")
"map <silent> <Leader>ss <plug>EgMapGrepCurrentWord_v
" WHOLE word ("\<pattern\>")
nnoremap  <Leader>ss :Rgrep -i \<<C-r><C-w>\> *pp
"map <silent> <Leader>sS <plug>EgMapGrepCurrentWord_V
" Search in open buffers 
nnoremap  <Leader>ssb :Bgrep -i \<<C-r><C-w>\>
" Search in files matching the regex, save matching filenames in args
nnoremap <Leader>ssa :args `grep -Ril \"\<<C-r><C-w>\>\" *`<Left>
" Search in vim help pages
nnoremap  <Leader>ssh :helpgrep \<<C-r><C-w>\>

" ***********************************************
" Target string is the visually selected area
" ***********************************************
" Recursive search in file tree
vnoremap <Leader>s y:Rgrep -i <C-R>=escape(@",'\\/.*$^~[]')<CR> *pp<Left><Left><Left><Left>
vnoremap <Leader>ss y:Rgrep -i <C-R>=escape(@",'\\/.*$^~[]')<CR> *pp<Left><Left><Left><Left>
"vmap <silent> <Leader>ss <plug>EgMapGrepSelection_v
" Search in all open files
vnoremap <Leader>sb y:Bgrep -i <C-R>=escape(@",'\\/.*$^~[]')<CR>
" Search in files matching the regex, save matching filenames in args
vnoremap <Leader>sa y:args `grep -Ril \"<C-R>=escape(@",'\\/.*$^~[]')<CR>\" *`<Left>
" Search in vim help pages
vnoremap  <Leader>sh y:helpgrep <C-R>=escape(@",'\\/.*$^~[]')<CR>


" ********************************
" *********** REPLACE ************
" ********************************

" ***********************************************
" Target string unfilled
" ***********************************************
" replace in current file
nnoremap <Leader>r :%s///gec<Left><Left><Left><Left><Left>
" replace inside visual selection
vnoremap <Leader>r :s///gec<Left><Left><Left><Left><Left>
" replace in all open files (word unfilled)
nnoremap <Leader>rb :bufdo %s///gec \|up<Left><Left><Left><Left><Left><Left><Left><Left><Left>
" replace in files listed in 'args'
nnoremap <Leader>ra :argdo %s///gec \|up<Left><Left><Left><Left><Left><Left><Left><Left><Left>

" ***********************************************
" Target string is the word under the cursor
" ***********************************************
" replace in current file
nnoremap <Leader>rr :%s/\<<C-r><C-w>\>//gec<Left><Left><Left><Left>
" replace in all open files
nnoremap <Leader>rrb :bufdo %s/\<<C-r><C-w>\>//gec \|up<Left><Left><Left><Left><Left><Left><Left><Left>
" replace in local block code {...}
nnoremap <Leader>rbb mo[{ma%mb`o:'a,'b s/\<<C-r><C-w>\>//gec<Left><Left><Left><Left>
" replace in local block code {...}
nnoremap <Leader>rbb mo[{ma%mb`o:'a,'b s/\<<C-r><C-w>\>//gec<Left><Left><Left><Left>
" replace in files listed in 'args'
nnoremap <Leader>rra :argdo %s/\<<C-r><C-w>\>//gec \|up<Left><Left><Left><Left><Left><Left><Left><Left>
" replace in ALL files in tree (recursive), NOT whole word ("pattern")
map <silent> <Leader>rg <plug>EgMapReplaceCurrentWord_r
" WHOLE word ("\<pattern\>")
map <silent> <Leader>rG <plug>EgMapReplaceCurrentWord_R

" ***********************************************
" Target string is the visually selected area
" ***********************************************
" replace in current file
vnoremap <Leader>rr y:%s/<C-R>=escape(@",'\\/.*$^~[]')<CR>//gec<Left><Left><Left><Left>
" replace in all open files
vnoremap <Leader>rb y:bufdo %s/<C-R>=escape(@",'\\/.*$^~[]')<CR>//gec \|up<Left><Left><Left><Left><Left><Left><Left>
vnoremap <Leader>rrb y:bufdo %s/<C-R>=escape(@",'\\/.*$^~[]')<CR>//gec \|up<Left><Left><Left><Left><Left><Left><Left>
" replace in local block code {...}
vnoremap <Leader>rbb y<C-C>mo[{ma%mb`o:'a,'b s/<C-R>=escape(@",'\\/.*$^~[]')<CR>//gec<Left><Left><Left><Left>
" replace in files listed in 'args'
vnoremap <Leader>ra y:argdo %s/<C-R>=escape(@",'\\/.*$^~[]')<CR>//gec \|up<Left><Left><Left><Left><Left><Left><Left><Left>
" replace in ALL files in tree (recursive), NOT whole word ("pattern")
vmap <silent> <Leader>rg <plug>EgMapGrepSelection_v
" WHOLE word ("\<pattern\>")
vmap <silent> <Leader>rG <plug>EgMapGrepSelection_V


" under_scores to CamelCase:
" Convert inside visual selection each name_like_this to NameLikeThis
vnoremap <Leader>__ :s#\(\%(\<\l\+\)\%(_\)\@=\)\\|_\(\l\)#\u\1\2#g<CR><C-C>
" Same, but in current line
noremap <Leader>__ :s#\(\%(\<\l\+\)\%(_\)\@=\)\\|_\(\l\)#\u\1\2#g<CR>

" CamelCase to under_scores 
" Convert each name_like_this to nameLikeThis in current line.
vnoremap <Leader>_ :s#_\(\l\)#\u\1#g<CR><C-C>
" Same, but in current line
noremap <Leader>_ :s#_\(\l\)#\u\1#g<CR>

" GLOBAL
" global command in current file (word unfilled)
nnoremap <Leader>g :g//normal <Left><Left><Left><Left><Left><Left><Left><Left>
" global command on word under cursor in current file
nnoremap <Leader>gg :g/\<<C-r><C-w>\>/normal 
" global command in all open files (word unfilled)
nnoremap <Leader>gb :bufdo g//normal  \|up<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" global command on word under cursor in all open files
nnoremap <Leader>ggb :bufdo g/\<<C-r><C-w>\>/normal  \|up<Left><Left><Left>
" global command on word under cursor in local block code {...}
nnoremap <Leader>gbb mo[{ma%mb`o:'a,'b g/\<<C-r><C-w>\>/normal 

" global command inside visual selection (word unfilled)
vnoremap <Leader>g :g//normal <Left><Left><Left><Left><Left><Left><Left><Left>
" global command on visual selected test in current file
vnoremap <Leader>gg y:g/<C-R>=escape(@",'\\/.*$^~[]')<CR>/normal 
" global command on visual selected text in all open files
vnoremap <Leader>gb y:bufdo g/<C-R>=escape(@",'\\/.*$^~[]')<CR>/normal  \|up<Left><Left><Left><Left><Left>
vnoremap <Leader>ggb y:bufdo g/<C-R>=escape(@",'\\/.*$^~[]')<CR>/normal  \|up<Left><Left><Left><Left><Left>
" global command on visual selected text in local block code {...}
vnoremap <Leader>gbb y<C-C>mo[{ma%mb`o:'a,'b g/<C-R>=escape(@",'\\/.*$^~[]')<CR>/normal 

" Get help for word under cursor
" <F1>
autocmd bufenter *.vim,.vimrc nnoremap <F1> :h <C-R><C-W><CR>
autocmd bufenter *.vim,.vimrc vnoremap <F1> y:h <C-R>=escape(@",'\\/.*$^~[]')<CR><CR>

" Retrofitting: to convert from webpage to cvs up -j.. -j..
"    noremap \wr Icvs up <M-w>dw.....<M-W>D<M-B>Pa ^wwdw.i-j<M-W>dwi-j^kd 
let @t='Icvs up wdw.....WDBPa ^wwdw.i-jWdwi-j^kd'
"    let @t='^dWdWIcvs up kd^dwdwdwct;Ai kbkb krp^dWdWdWi-jWi-jbklkD^v$dku^wwP^kddd'
"    let @t='dWdWkdv$dkuP^dWdWi-jt;krdWdWdWi -jbdW^PIcvs up kdddku^'
" Retrofitting: to convert from cvs commit output to cvs up -j.. -j..
"    noremap \cr dWdWddpkudw..I-jEkDdw...i -j^dW$A krpBklkDJIcvs up ^
let @r='dWdWddpkudwdwdwI-jEkDdwdwdwdwi -j^dW$A krpBklkDJIcvs up ^kd'

" revert changes:
let @e='^df/...kdddkuEklDkd^dW.EklkrkDkrdW.^i-jWi-j^DkuPa Icvs up kdddku^'

" Paste and increase number, useful for adding numbered log debug
"nnoremap <leader>p p<C-A>==yy
"nnoremap <C-P> ciw<C-r>0<C-C>

" Always save last session when exiting vim
autocmd VimLeavePre * SessionSaveAs _LAST_SESSION_

" Warn when opening a file generated during compilation
autocmd BufEnter */replicate/*,*/deliveries/* setlocal readonly
"Same for tts log files:
autocmd BufEnter *.edi.log,*.gsv.log,*.play.log,*.sh.log setlocal readonly

" Edit a macros in place:
" - qp ==> paste the macro from the q register into the current buffer
" - qd ==> copy back the modified macro to the q register
"noremap qp mqo"qp
"noremap qd 0"qdd`q

" Reformat edi message
vnoremap <Leader>te :s/'/&\&\r/g<CR>:call histdel("search", -1)<CR>:let @/ = histget("search", -1)<CR>
map <Leader>te :s/'/&\&\r/g<CR>:call histdel("search", -1)<CR>:let @/ = histget("search", -1)<CR>

" Reformat boi/bom log
vnoremap <Leader>tb :!~/doc/scripts/display_boi<CR>
map <Leader>tb :!~/doc/scripts/display_boi<CR>

"Interpret file as latin1 or ebcdic:
"latin1 --> ebcdic :
":e ++enc=ebcdic-us
"ebcdic --> latin1 :
":e ++enc=latin1

" }}}
" Force file type {{{

" Automatic colorization of edifact
autocmd BufEnter *.play,*.edi,*.edi.log,*.edi.rep,*.rgr,*.gsv,*.gsr,*.gsv.log setf edifact
" Special mapping for edifact files
autocmd BufEnter *.play,*.edi,*.gsv,*.gsr nmap <Leader>gl :e %.log<CR>
autocmd BufEnter *.play,*.edi,*.gsv nmap <Leader>gl :e %.log<CR>
autocmd BufEnter *.gsv nmap <Leader>gr :e %.gsr<CR>

" Automatic colorization of OTF log files.
" Also, don't reload a log file when it changes
autocmd BufEnter *_otf_be_*,*_otf_fe_*,*_otf_cs*,mon*err*,*_sei_master_*,*Svr*,*_Batch_*,*feAPE* setf tracer|setlocal autoread

" Handle SConstruct and SConscript as python files
autocmd BufNewFile,BufRead SConstruct* setf python
autocmd BufNewFile,BufRead SConscript* setf python

autocmd BufEnter .zsh* setf zsh

" }}}
" Spelling mistakes {{{

iab Acheive Achieve
iab acheive achieve
iab Alos Also
iab alos also
iab Aslo Also
iab aslo also
iab Becuase Because
iab becuase because
iab Bianries Binaries
iab bianries binaries
iab Bianry Binary
iab bianry binary
iab Charcter Character
iab charcter character
iab Charcters Characters
iab charcters characters
iab Exmaple Example
iab exmaple example
iab Exmaples Examples
iab exmaples examples
iab Fone Phone
iab fone phone
iab Lifecycle Life-cycle
iab lifecycle life-cycle
iab Lifecycles Life-cycles
iab lifecycles life-cycles
iab Seperate Separate
iab seperate separate
iab Seureth Suereth
iab seureth suereth
iab Shoudl Should
iab shoudl should
iab Taht That
iab taht that
iab Teh The
iab teh the
iab Flioght Flight
iab flioght flight

" }}}

" vim: set foldmethod=marker:
