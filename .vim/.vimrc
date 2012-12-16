set nocompatible

let &rtp = ''

" set default 'runtimepath' (without ~/.vim folders)
let &rtp = &rtp . ',' . printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &rtp= &rtp . ',' . printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

if $USER != "apeoncal"
  let g:dot_vim_dir = $HOME.'/.vim'
else
  let g:dot_vim_dir = $HOME.'/.vim.darmand'
endif

if version >= 702

  " Remove ALL auto-commands.  This avoids having the
  " autocommands twice when the vimrc file is sourced again.
  autocmd!


  """""""""""""" vundle+localbundle - START
  set nocompatible               " be iMproved
  filetype off                   " required!

  " add vundle plugin path
  let &rtp = &rtp . ',' . g:dot_vim_dir.'/bundle/vundle'


  if isdirectory(g:dot_vim_dir.'/localbundle')
    " add localbundle target dir
    let &runtimepath = g:dot_vim_dir.','.g:dot_vim_dir.'/localbundle,'.g:dot_vim_dir.'/localbundle/after'
  endif

  call vundle#rc()

  " let Vundle manage Vundle
  " required! 
  Bundle 'vundle'

  " My Bundles here:
  "
  Bundle 'CVSconflict'
  Bundle 'Color-Sampler-Pack'
  Bundle 'DirDiff'
  Bundle 'DoxygenToolkit'
  Bundle 'IndexedSearch'
  Bundle 'MatchTag'
  Bundle 'a'
  Bundle 'taghighlight'
  Bundle 'aftersyntax'
  Bundle 'aftersyntaxc.vim'
  Bundle 'ape_syntax'
  Bundle 'asyncfinder.vim'
  Bundle 'bandit'
  Bundle 'coderifous-textobj-word-column.vim-69c30da'
  Bundle 'cpp_stuff'
  Bundle 'current-func-info'
  Bundle 'enter-indent'
  Bundle 'exjumplist'
  Bundle 'file_line'
  Bundle 'grep'
  Bundle 'gtags'
  Bundle 'undotree'
  Bundle 'ctrlp.vim'
  Bundle 'mark'
  Bundle 'marvim'
  Bundle 'matchit'
  Bundle 'nathanaelkane-vim-indent-guides-5bc809d'
  Bundle 'neocomplcache'
  Bundle 'neocomplcache-snippets-complete'
  Bundle 'nerdcommenter'
  Bundle 'vim-powerline'
  Bundle 'quickfixsigns'
  Bundle 'rename'
  Bundle 'scratch'
  Bundle 'sessionman'
  Bundle 'tabbar'
  Bundle 'themes'
  Bundle 'tpope-vim-surround-1a73f60'
  Bundle 'vcscommand.vim'
  Bundle 'vimball'
  Bundle 'vimproc'
  Bundle 'xml'
  Bundle 'xterm-color-table'
  Bundle 'yankring_140'
  Bundle 'vim-orgmode'
  Bundle 'errormarker.vim'
  Bundle 'EasyGrep'
  Bundle 'vim-repeat'

  Bundle 'localbundle.vim'
  call localbundle#init()

  if !isdirectory(g:dot_vim_dir.'/localbundle')
    LocalBundle
  endif

  "" original repos on github
  "Bundle 'tpope/vim-fugitive'
  "Bundle 'Lokaltog/vim-easymotion'
  "Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  "Bundle 'tpope/vim-rails.git'
  "" vim-scripts repos
  "Bundle 'L9'
  "Bundle 'FuzzyFinder'
  "" non github repos
  "Bundle 'git://git.wincent.com/command-t.git'

  filetype plugin indent on     " required!
  "
  " Brief help
  " :BundleList          - list configured bundles
  " :BundleInstall(!)    - install(update) bundles
  " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
  "
  " see :h vundle for more details or wiki for FAQ
  " NOTE: comments after Bundle command are not allowed..

  """""""""""""" vundle+localbundle - END


  """""""""""""" neobundle - START
  "filetype off                   " Required!
  "filetype plugin indent off     " Required!

  "if has('vim_starting')
    "set runtimepath+=/remote/users2/$USER/.vim/bundle/Shougo-neobundle.vim-91b483e/
  "endif

  "call neobundle#rc(expand('/remote/users2/$USER/.vim/bundle/'))

  "NeoBundle 'CVSconflict'
  "NeoBundle 'C_Syntax_Extensions'
  "NeoBundle 'ColorSamplerPack'
  "NeoBundle 'DirDiff'
  "NeoBundle 'DoxygenToolkit'
  "NeoBundle 'IndexedSearch'
  "NeoBundle 'MatchTag'
  "NeoBundle 'Shougo-neobundle.vim-91b483e'
  "NeoBundle 'Shougo-neocomplcache-0f8c31b'
  "NeoBundle 'Shougo-neocomplcache-snippets-complete-35a112d'
  "NeoBundle 'Shougo-vimproc-f6e6484'
  "NeoBundle 'SwapExistsDiff'
  "NeoBundle 'a'
  "NeoBundle 'abudden-taghighlight-f58e4fd24d1e'
  "NeoBundle 'aftersyntax'
  "NeoBundle 'ape_syntax'
  "NeoBundle 'asyncfinder.vim'
  "NeoBundle 'bandit'
  "NeoBundle 'coderifous-textobj-word-column.vim-69c30da'
  "NeoBundle 'cpp_stuff'
  "NeoBundle 'current-func-info'
  "NeoBundle 'enter-indent'
  "NeoBundle 'exjumplist'
  "NeoBundle 'file_line'
  "NeoBundle 'grep'
  "NeoBundle 'gtags'
  "NeoBundle 'gundo'
  "NeoBundle 'kien-ctrlp.vim-8820dec'
  "NeoBundle 'mark'
  "NeoBundle 'marvim'
  "NeoBundle 'matchit'
  "NeoBundle 'nathanaelkane-vim-indent-guides-5bc809d'
  "NeoBundle 'nerdcommenter'
  "NeoBundle 'powerline'
  "NeoBundle 'quickfixsigns'
  "NeoBundle 'rename'
  "NeoBundle 'scratch'
  "NeoBundle 'sessionman'
  "NeoBundle 'swap_word'
  "NeoBundle 'tabbar'
  "NeoBundle 'themes'
  "NeoBundle 'tpope-vim-surround-1a73f60'
  "NeoBundle 'vcscommand'
  "NeoBundle 'vimball'
  "NeoBundle 'xml'
  "NeoBundle 'xterm-color-table'
  "NeoBundle 'yankring_140'

  "filetype plugin indent on     " Required!

  """""""""""""" neobundle - END

  """""""""""""" tplugin - START
  "runtime bundle/tomtom-tplugin_vim-266145a/macros/tplugin.vim
  "TPluginRoot /remote/users2/$USER/.vim/bundle/
  "TPlugin tabbar
  ""TPluginBefore *.[hc]pp TPlugin abudden-taghighlight-f58e4fd24d1e | e!
  ""TPlugin abudden-taghighlight-f58e4fd24d1e
  """""""""""""" tplugin - END


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


  function! EnsureDirExists (dir)
    if !isdirectory(a:dir)
      if exists("*mkdir")
        echo "Creating directory: " . a:dir
        call mkdir(a:dir,'p')
        echo "Done!"
      else
        echo "Please create directory: " . a:dir
      endif
    endif
  endfunction

  call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM')

  " Auto reload .vimrc when modified
"  autocmd BufWritePost .vimrc source %

  " Set ESC time lenght to 1 ms.
  set timeoutlen=1000
  set ttimeoutlen=10

  set linespace=0
"  set clipboard=unnamed

  filetype on

"  let g:obviousModeInsertHi = 'term=reverse ctermbg=green'

  set vb t_vb=

  " Allow 256 colros in gnu screen
  set t_Co=256

  " cscope
  "  map [I :cs find c <C-r><C-w><CR> 
  set csto=1

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


  " default is 4000 ms
  " makes quickfixsigns plugin faster to refresh
  set updatetime=500

  """""""""""""""""""""""""""""""""
  """""""""""""""""""""""""""""""""
  """""""""""""""""""""""""""""""""

  "Only ignore case when we type lower case when searching
  set ignorecase
  set smartcase

  set history=10000

  " Spell check
  nnoremap <silent> [14~ :setlocal invspell spell? spelllang=en_us<CR>


  """""""""""""""""""""""""""""""""
  " Tabs and indentation {{{

    " insert spaces instead of real tabs
    set expandtab 
    " number of space in which a tab is expanded
    set tabstop=2
    set softtabstop=2

    " >> indentation size
    set shiftwidth=2

    "set autoindent
    "set cindent
    set smartindent

    set list
    set listchars=tab:>-,trail:_
    "set listchars=tab:\\ \ ,trail:_


    " reselect visual block after in/dedent so we can in/dedent more
    vnoremap < <gv
    vnoremap > >gv

    vnoremap = =gv

    " select the last changed text (or the text that was just pasted)
    nnoremap <expr> gV "`[".getregtype(v:register)[0]."`]"
    
    " move visual selection:
    " to the right
    vnoremap <expr> [C 'dp`[' . strpart(getregtype(), 0, 1) . '`]'
    "vnoremap <expr> gh 'dp`[' . strpart(getregtype(), 0, 1) . '`]'
    " to the left
    vnoremap <expr> [D 'dhhp`[' . strpart(getregtype(), 0, 1) . '`]'
    " up
    vnoremap <expr> [A 'dkhp`[' . strpart(getregtype(), 0, 1) . '`]'
    " down
    vnoremap <expr> [B 'djhp`[' . strpart(getregtype(), 0, 1) . '`]'

    set smarttab

    " Intuitive backspacing in insert mode
    " bs delete anything
    set backspace=indent,eol,start
"    :fixdel
"     if &term == "termname"
"       set t_kb=^V<BS>
"       fixdel
"     endif  

    filetype indent on 
    filetype plugin indent on
"    set smartindent
    set cindent " do c-style indenting

   " default is: set cinoptions=s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,gs,hs,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,j0,)20,*30,#0
   " set cinoptions=>s,e0,n0,f0,{s,}0,^0,:s,=s,l1,b0,gs,t0,+2s,i0,c3,(0,W2s
   set cinoptions=s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,gs,hs,ps,ts,is,+s,c3,C0,/0,(0,us,U0,w0,W0,m0,j0,)20,*30,#0


    set comments=sl:/*,mb:\ *,elx:\ */


    " davide temppppp
    " Folding
    " Open all folds when opening a file. Note, perl automatically sets foldmethod in the syntax file
    function! SetFoldingOptions()
      setlocal foldmethod=syntax
      setlocal foldlevelstart=4
    endfunction
    "autocmd FileType c,cpp,vim,xml,html,xhtml call SetFoldingOptions()
    ""Each time you close a file, its fold state will be saved and reloaded when you reopen the file in Vim
    "function! RunLoadView()
      "if &l:diff
      "else
        "loadview
      "endif
    "endfunction
    "au BufWinEnter *.* silent call RunLoadView()
    "function! RunMkView()
      "if &l:diff
      "else
        "mkview
      "endif
    "endfunction
    "au BufWinLeave *.* call RunMkView()


  " }}}
 
  """""""""""""""""""""""""""""""""
  " Color settings, highlights, visual {{{

  colorscheme bandit
  set background=dark

  " This makes Vim show invisible characters with the same characters that
  " TextMate uses. You might need to adjust your color scheme so they.re not
  " too distracting. 
  "    set list
  "    set listchars=tab:.\ ,eol:¬

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
    "set statusline+=%{HasPaste()}
    "set statusline+=%02n:\                           " buffer number
    "set statusline+=%f\                          " file name
    "set statusline+=%h%m%r%w                     " flags
    "set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
    "set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
    "set statusline+=%{&fileformat}]              " file format
    ""      set statusline+=\ [%r%{getcwd()}%h]     " CWD
    "set statusline+=%=      "left/right separator
    "set statusline+=%b,0x%-8B\      " current char
    "set statusline+=%c,%l/ "cursor column/total lines
    "set statusline+=%L\ %P "total lines/percentage in file

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

    "set cursorline
    " Highlight the current line (see Highlight current line ),
    " which might be more visible.
    " Mode Indication -Prominent!
    au BufEnter * set cursorline
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
    "au BufEnter -TabBar- set nocursorline

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

  "Maintain more context around the cursor 
  "When the cursor is moved outside the viewport of the current window, 
  " the buffer is scrolled by a single line. 
  " Setting the option below will start the scrolling three lines before the border, 
  " keeping more context around where you're working. 
  "set scrolloff=10
  "set sidescrolloff=10

  "    set list " we do what to show tabs
  "    set listchars=tab:>-,trail:- " show tabs and trailing

  "    set matchtime=5 " how many tenths of a second to blink matching brackets for

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

  " tmux
  "set term=screen-256color

  " Set an orange cursor in insert mode, and a red cursor otherwise.
  " Works at least for xterm and rxvt terminals.
  " Does not work for gnome terminal, konsole, xfce4-terminal.
  "    if &term =~ "xterm\\|rxvt"
  "      :silent !echo -ne "\033]12;red\007"
  "      let &t_SI = "\033]12;orange\007"
  "      let &t_EI = "\033]12;red\007"
  "      autocmd VimLeave * :!echo -ne "\033]12;red\007"
  "    endif

  "let &termencoding = &encoding

  " Set title for screen windows
  "let &titleold=substitute(getcwd(), $HOME, "~", '')

  "set notitle
  "let &titlestring = "[vim(" . expand("%:t") . ")]"
  "if &term == "screen" || &term == "screen-bce"
  "  set t_ts=k
  "  set t_fs=\
  "endif
  "if &term == "screen" || &term == "xterm" || &term == "screen-bce"
  "  set title
  "endif

  "autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"


  if has("gui_running")
    set guifont=*
    "if has("gui_gtk2")
    "set guifont=Courier\ New\ 11
    "elseif has("gui_photon")
    "set guifont=Courier\ New:s11
    "elseif has("gui_kde")
    "set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
    "elseif has("x11")
    "set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    "else
    "set guifont=Courier_New:h11:cDEFAULT
    "endif
  endif

  "set relativenumber
  set number

  if version >= 703
    "autocmd InsertEnter * :set number
    "autocmd InsertLeave * :set relativenumber
    "inoremap <silent><C-C> <ESC>:set relativenumber<CR><C-C>
    ""au BufRead -TabBar- :set nonumber norelativenumber<CR>
    ""au BufCreate * echo 'davide: '.bufname('%')

    "au BufReadPost * if bufname('%') == '-TabBar-' |
    "\   echo 'ciao' |
    ""\   setlocal nonumber norelativenumber |
    "\ endif

    "noremap V :set relativenumber<CR>V
    "vnoremap V :set relativenumber<CR>V
    "vnoremap <silent><C-C> <ESC>:set number<CR><C-C>
    "vnoremap <silent><ESC> <ESC>:set number<CR>
  endif

  " that's a vertical box-drawing character
  "set fillchars=vert:|
  " needed by powerline
  "set fillchars+=stl:\ ,stlnc:\
  set encoding=utf-8
  " }}}


  """""""""""""""""""""""""""""""""
  " Misc {{{

    " To open each buffer in its own tabpage, add this to your vimrc:
"    :au BufAdd,BufNewFile * nested tab sball

    set mouse=a            " Enable mouse usage (all modes) in terminals
    "non-tmux:
    "set ttymouse=xterm2    " Make mouse and putty work together
    " tmux:
    set ttymouse=xterm    " Make mouse and putty work together

    set ttyfast
    " Affiche le nombre de lignes sélectionnées en mode visuel ou la
    " touche/commande qu'on vient de taper en mode commande
    set showcmd
    " Indiquer le nombre de modification lorsqu'il y en a plus de 0 suite à
    " une commande
     set report=0

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
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \ let JumpCursorOnEdit_foo = line("'\"") |
     \ let b:doopenfold = 1 |
     \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
     \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
     \ let b:doopenfold = 2 |
     \ endif |
     \ exe JumpCursorOnEdit_foo |
     \ endif |
     \ endif
     " Need to postpone using "zv" until after reading the modelines.
     autocmd BufWinEnter *
     \ if exists("b:doopenfold") |
     \ exe "normal zv" |
     \ if(b:doopenfold > 1) |
     \ exe "+".1 |
     \ endif |
     \ unlet b:doopenfold |
     \ endif
    augroup END

    "if has("autocmd")
      "" When editing a file, always jump to the last cursor position
      "autocmd BufReadPost *
            "\ if line("'\"") > 0 && line ("'\"") <= line("$") |
            "\ exe "normal g`\"" |
""            \ exe "normal zz"|
            "\ endif
    "endif

   
"    set clipboard=unnamed " copy paste to system registry
    set clipboard+=unnamed " share windows clipboard
    set clipboard+=autoselect " share windows clipboard

    set noequalalways

    set lz " do not redraw while running macros (much faster) (LazyRedraw)"

    " earch for selected text, forwards or backwards.
     " Remove the Windows ^M - when the encodings gets messed up
     "noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

  " }}}


  """""""""""""""""""""""""""""""""
  " Plugins/Scripts {{{

    filetype plugin on

    " TABBAR
    "
    "if &diff
      "let g:Tb_AutoUpdt = 0
    "else
      "let g:Tb_AutoUpdt = 1
    "endif
    let g:Tb_TabWrap = 1
    " Limit number of line displaying tabs in the tabs window
    let g:Tb_MaxSize = 0
    " 1 mouse click to change tab
    let g:Tb_UseSingleClick = 1
"    let g:Tb_ForceSyntaxEnable = 1
    " Only show TabBar if we have a real buffer
    let g:Tb_MoreThanOne = 0
    "let g:Tb_ModSelTarget = 1

    "autocmd bufenter exe "normal \<c-w>\<c-w>\<c-w>\<c-w>"

    " key maps are in the plugin file ===>
"    noremap <unique> w :call <SID>Bf_Cycle(0)<CR>:<BS>
"    noremap <unique> e :call <SID>Bf_Cycle(1)<CR>:<BS>

    " Omnicppcomplete 
    "imap <TAB> <C-x><C-o>
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

    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"    set completeopt=menu,preview  " default
    set completeopt=menu


    " another benefit of using ctags is that you can use it for tab completion. I find 
    " that tab completion becomes unusably slow in a large project if you're finding 
    " keywords from open buffers, but you can tell Vim to only use the current file and 
    " ctags when finding keywords:
    set complete=.,t


    "DOXYGEN
"    let g:DoxygenToolkit_briefTag_pre="\brief  " 
"    let g:DoxygenToolkit_paramTag_pre="\param " 
"    let g:DoxygenToolkit_returnTag="\returns   "

    " grep.vim
    let Grep_Skip_Dirs = 'RCS CVS SCCS objLinux64Rel objLinux64Dbg L64D342 L64R342 deliveries'
    let Grep_Skip_Files = '*~ *,v s.* *.os .*.swp core.* .#* vim.err build.log'

    " sessionma.vim
    let sessionman_save_on_exit = 1

    " a.vim (switch between hpp and cpp)
    let g:alternateNoDefaultAlternate = 1
    let g:alternateSearchPath = 'reg:|src/\([^/]*\)/.*|src/\1/include/\1||,reg:|src/\([^/]*\)/.*|src/\1/entry||,reg:|src/\([^/]*\)/.*|src/\1/command||,reg:|src/\([^/]*\)/.*|src/\1/basic||,reg:|src/\([^/]*\)/.*|src/\1/field||,reg:|src/\([^/]*\)/.*|src/\1/gdminterface||,reg:|src/\([^/]*\)/.*|src/\1/msgencoder||,reg:|src/\([^/]*\)/.*|src/\1/msginterface||,reg:|src/\([^/]*\)/.*|src/\1/test||,reg:|src/\([^/]*\)/.*|src/\1/server||,reg:|src/\([^/]*\)/.*|src/\1/proxy_core||,reg:|src/\([^/]*\)/.*|src/\1/common||,reg:|src/\([^/]*\)/.*|src/\1/dbadaptor||,reg:|src/\([^/]*\)/.*|src/\1/dbrequest||,reg:|src/\([^/]*\)/.*|src/\1/bointerface||,reg:|src/\([^/]*\)/.*|src/\1/factory||,reg:|src/\([^/]*\)/.*|src/\1/bom||'


    " neocomplcache.vim"{{{

        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_auto_completion_start_length = 1
        " Use camel case completion.
        let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        let g:neocomplcache_enable_underbar_completion = 0
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 1
        " Set manual completion length.
        let g:neocomplcache_manual_completion_start_length = 0
        let g:NeoComplCacheAutoCompletionLength = 1
        "let g:neocomplcache_caching_limit_file_size = 1000000
        " Disable ctags
        let g:neocomplcache_ctags_program = ''

        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif
        "let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        "let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
              \ 'default' : '',
              \ 'vimshell' : $HOME.'/.vimshell_hist',
              \ 'scheme' : $HOME.'/.gosh_completions'
              \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
          let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\v\h\w*'

        "imap <C-E>     g:neocomplcache_snippets_expand

        " Using omni-completion:
        function! SuperCleverTab()             
          "check if at beginning of line or after a space
          if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
            return "\<Tab>"
          endif
          if pumvisible()
            "return "\<C-K>"
            return "\<C-E>"
          endif
          " do we have omni completion available
          if &omnifunc != ''
            "use omni-completion 1. priority
            return "\<C-X>\<C-O>"
          elseif &ft != 'cpp'
            inoremap <expr><silent>L  neocomplcache#manual_omni_complete()
            if &dictionary != ''
              " no omni completion, try dictionary completion
              return "\<C-K>"
            else
              "use omni completion or dictionary completion
              "use known-word completion
              return "\<C-N>"
            endif
          endif
        endfunction
        inoremap <Tab> <C-R>=SuperCleverTab()<CR>


        "func! EnterIndent()
          "let EnterIndentActive = [
                "\ {'left' : '[\{\[\(]','right' : '[\)\]\}]'},
                "\ {'left' : '<[^>]*>', 'right' : '</[^>]*>'},
                "\ {'left' : '<?\(php\)\?', 'right' : '?>'},
                "\ {'left' : '<%', 'right' : '%>'},
                "\ {'left' : '\[[^\]]*\]', 'right' : '\[/[^\]]*\]'},
                "\ {'left' : '<!--', 'right' : '-->'},
                "\ {'left' : '\(#\)\?{[^\}]*\}', 'right' : '\(#\)\?{[^\}]*\}'},
                "\ ]

          "let GetLine = getline('.')
          "let ColNow = col('.') - 1

          "let RightGetLine = substitute(
                "\ strpart(GetLine, ColNow, col('$')),
                "\ '^[ ]*', '', ''
                "\ )

          "if RightGetLine == "" | call feedkeys("\<CR>", 'n') | return '' | endif

          "for value in EnterIndentActive
            "if matchstr(RightGetLine, '^' . value.right) != ""
              "let EnterIndentRun = 1 | break
            "endif
          "endfor

          "if !exists('EnterIndentRun') | call feedkeys("\<CR>", 'n') | return '' | endif

          "let LeftGetLine = substitute(
                "\ strpart(GetLine, 0, ColNow),
                "\ '[ ]*$', '', ''
                "\ )

          "if matchstr(LeftGetLine, value.left . '$') == ""
            "call feedkeys("\<CR>", 'n') | return ''
          "endif

          "let LineNow = line('.')
          "let Indent = substitute(LeftGetLine, '^\([ |\t]*\).*$', '\1', '')

          "call setline(LineNow, LeftGetLine)
          "call append(LineNow, Indent . RightGetLine)
          "call append(LineNow, Indent)
          "call feedkeys("\<Down>\<Esc>\A\<Tab>", 'n')

          "return ''
        "endf

        "" davide
        ""inoremap <silent> <cr> <c-r>=EnterIndent()<cr>
        "inoremap <silent> <CR> <C-R>=pumvisible() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-R>=EnterIndent()\<CR>"

        "imap <CR>     <Plug>(neocomplcache_snippets_expand)
        "smap <CR>     <Plug>(neocomplcache_snippets_expand)

        " SuperTab like snippets behavior.
        imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
         \ "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2 concealcursor=i
        endif

        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2 concealcursor=i
        endif


        let g:neocomplcache_snippets_dir = $HOME.'/snippets'
        let g:neocomplcache_disable_select_mode_mappings = 1

    " }}}


    " indent guide
    let g:indent_guides_enable_on_vim_startup = 1
    "autocmd BufWinEnter *.cpp :IndentGuidesEnable
    "autocmd BufWinEnter *.hpp :IndentGuidesEnable
    let g:indent_guides_indent_levels = 8
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237 ctermfg=240
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238 ctermfg=242

    "nnoremap Y y$

    " Yankring
    let g:yankring_n_keys = 'Y D x K'
    function! YRRunAfterMaps()
        nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
    endfunction
    " <F3>
    nnoremap <silent> [13~ :YRShow<CR>
    "let g:yankring_n_keys = 'Y D s S'
    let g:yankring_replace_n_pkey = '<Tab>'
    let g:yankring_replace_n_nkey = '<S-Tab>'

    " Yankstack
    "let g:yankstack_map_keys = 0
    "call yankstack#setup()
    "nmap <TAB> <Plug>yankstack_substitute_older_paste
    "nmap <S-TAB> <Plug>yankstack_substitute_newer_paste
    "nnoremap <silent> <F3> :Yanks<CR>
    " have Y behave analogously to D and C rather 
    " than to dd and cc (which is already done by yy):


    " Mark : moved to mark.vim
    "hi MarkWord1  ctermbg=Green       ctermfg=White
    "hi MarkWord2  ctermbg=darkcyan    ctermfg=white
    "hi MarkWord3  ctermbg=brown       ctermfg=white
    "hi MarkWord4  ctermbg=darkmagenta ctermfg=white
    "hi MarkWord5  ctermbg=magenta     ctermfg=white
    "hi MarkWord6  ctermbg=darkblue    ctermfg=white

    "" gundo
    "nnoremap <silent> [19~ :GundoToggle<CR>

    " undotree
    nnoremap <silent> [19~  :UndotreeToggle<cr>

    " Enhanced Commentify
    "let g:EnhCommentifyTraditionalMode = 'no'
    "let g:EnhCommentifyFirstLineMode = 'no'
    "let g:EnhCommentifyUserBindings = 'no'
    "let g:EnhCommentifyUserMode = 'yes'
    
    " xml.vim
    let g:xml_syntax_folding = 1
    "au FileType xml setlocal foldmethod=syntax
    "set foldmethod=syntax

    " Tagbar
    " <F4>
    "nnoremap <silent> [14~ :TagbarToggle<CR>

    " rainbow_parenthesis
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
    " vcscommand
    au BufEnter *CVS* set syntax=rcslog
    nmap <Leader>C <Plug>VCSCommit

    " Sessionman
    " <F12>
    noremap <silent> [24~ :SessionList<CR>
    
    " quickfixsigns
    let g:quickfixsigns_balloon = 0
    let g:quickfixsigns#marks#marks = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
    let g:quickfixsigns_class_vcsdiff = {'sign': '*quickfixsigns#vcsdiff#Signs', 'get': 'quickfixsigns#vcsdiff#GetList(%s)', 'event': ['BufWritePost','BufRead'], 'always_new': 1}

    function! ToggleQuickfixSigns()
      "if g:quickfixsigns#marks#marks == []
      if g:quickfixsigns_class_vcsdiff == {}
        let g:quickfixsigns#marks#marks = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
        let g:quickfixsigns_class_vcsdiff = {'sign': '*quickfixsigns#vcsdiff#Signs', 'get': 'quickfixsigns#vcsdiff#GetList(%s)', 'event': ['BufWritePost','BufRead'], 'always_new': 1}
      else
        let g:quickfixsigns#marks#marks = []
        let g:quickfixsigns_class_vcsdiff = {}
      endif
      QuickfixsignsSet
    endfunction
    silent command! ToggleQuickfixSigns :silent call ToggleQuickfixSigns()

    " <F11>
    silent! noremap <silent> [23~ :ToggleQuickfixSigns<CR>
    silent! vmap <silent> [23~ <ESC>:ToggleQuickfixSigns<CR>gv
    silent! imap <silent> [23~ <C-O>[23~

    "let g:quickfixsigns_events = ['BufRead', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'InsertEnter', 'InsertChange']
    "let g:quickfixsigns_events = ['BufRead']
    let g:quickfixsigns_events = ['BufWritePost']

    " Powerline
    call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/Powerline_cache')
    let Powerline_cache_file = $TMPDIR.'/'.$USER.'/_VIM/Powerline_cache/Powerline.cache'
    let Powerline_cache_enabled = 1
    "let Powerline_symbols="unicode"
    "TPlugin powerline

    " TagHighlight
    if ! exists('g:TagHighlightSettings')          
      let g:TagHighlightSettings = {}
    endif

    let g:TagHighlightSettings['LanguageDetectionMethods'] =
          \ ['Extension', 'FileType']
    let g:TagHighlightSettings['FileTypeLanguageOverrides'] =
          \ {'tagbar': 'cpp'}
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

    "TPlugin abudden-taghighlight-f58e4fd24d1e

    " easytag
    ""let g:easytags_file = '$HOME/ngi_1/tags'
    "let g:easytags_include_members = 1
    "let g:easytags_suppress_ctags_warning = 0
    "let g:easytags_always_enabled = 0
    "let g:easytags_by_filetype = 1
    "let g:easytags_python_enabled = 1

    " Mark (simultaneous multiple highlights)
    " I already use <Leader>r to repalce words..
    nmap <silent> <Leader>R <Plug>MarkRegex
    xmap <silent> <Leader>R <Plug>MarkRegex
    " Add new mark
    nmap <silent> + <Plug>MarkSet
    xmap <silent> + <Plug>MarkSet
    " Clear all marks
    nmap <silent> - <Plug>ClearLastMark
    xmap <silent> - <Plug>ClearLastMark

    nnoremap <silent>  :nohlsearch<CR>
    nnoremap <silent>  :nohlsearch<CR>

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

    "" Mappings WITHOUT Mark plugin:
    "nnoremap <unique> <silent>  :nohlsearch<CR>
    "nnoremap <unique> <silent>  :nohlsearch<CR>
    "" keep searched word in the middle of the screen
    "" AND do not move the cursor when highlighting:
    "nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
    "nnoremap g* yiw/^.*\%<C-r>=col('.')<CR>c\zs<C-r>"<CR>
    "nnoremap g# yiw?^.*\%<C-r>=col('.')<CR>c\zs<C-r>"<CR>
    "" Search for visually selected text:
    "vnoremap <silent> * :<C-U>
      "\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      "\gvy/<C-R><C-R>=substitute(
      "\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      "\gV:call setreg('"', old_reg, old_regtype)<CR>
    "vnoremap <silent> # :<C-U>
      "\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      "\gvy?<C-R><C-R>=substitute(
      "\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      "\gV:call setreg('"', old_reg, old_regtype)<CR>


    " Mappings WITH Mark plugin:
    "nmap <unique> <silent> <CR> <Plug>MarkClear :nohlsearch<CR><CR>
    "nnoremap <unique><silent><CR> <Plug>Mark
    "nmap <unique> <silent> * <Plug>MarkSet
    "vmap <unique> <silent> <Leader>m <Plug>MarkSet
    " in normal mode enter clears search highlight
    "nnoremap <silent><CR> :nohlsearch<CR><CR> 
    "From "bundle/IndexedSearch/plugin/IndexedSearch.vim" :
    "nnoremap <silent>* :let v:errmsg=''<cr>:silent! norm! *<cr>:call <SID>ShowCurrentSearchIndex(0,'!')<cr>
    "From my "bundle/mark/plugin/mark.vim":
    "nmap <unique> <silent> <Leader>m <Plug>MarkSet
    "Combination of the 3:

    " Syntastic
    let g:syntastic_cpp_check_header = 1


    " DynamicSigns
    "let g:Signs_IndentationLevel = 1
    ":let g:SignsMixedIndentation = 1
    :let g:Signs_Bookmarks = 1
    :let g:Signs_QFList = 1
    :let g:Signs_Diff = 1
    :let g:Signs_Scrollbar = 1


    " Clang complete

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


    " CCTree
    "let g:CCTreeMinVisibleDepth = 1

    " AsNeeded


    " Marvim (macros management)
    " to change the macro storage location use the following 
    call EnsureDirExists($HOME.'/.vimmacros')
    let marvim_store = $HOME.'/.vimmacros' 
    let marvim_find_key = '<leader>mm'
    let marvim_store_key = '<leader>ms'
    let marvim_register = 'q'
    "let marvim_prefix = 0           " disable default syntax based prefix

    "Scratch
    nnoremap <silent> <Leader>sc :Sscratch<CR>

    " errormarker
    "nmap <silent> <unique> <Leader>cc :ErrorAtCursor<CR>
    let g:errormarker_disablemappings = 1

    " EasyGrep
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

  " }}} Plugins/Scripts end

  """""""""""""""""""""""""""""""""
  """""""""""""""""""""""""""""""""
  """""""""""""""""""""""""""""""""
  """""""""""""""""""""""""""""""""
  """""""""""""""""""""""""""""""""
  """""""""""""""""""""""""""""""""
  " Mappings {{{

    " Edit/source dot files
    nmap <silent> <Leader>ev :execute "e ".g:dot_vim_dir."/.vimrc"<CR>
    nmap <silent> <Leader>sv :execute "source ".g:dot_vim_dir."/.vimrc"<CR>
    nmap <silent> <Leader>ez :execute "e ~/.zshrc.".$USER<CR>

    " Edit TTS files
    nmap <silent> <Leader>el :e %.log<CR>
    nmap <silent> <Leader>er :e NONREG_RESULTS-STDOUT.txt<CR>

    " Wrap on/off
    nmap <silent> <Leader>w :set invwrap<CR>:set wrap?<CR>

  " Delete the previous word
  "Arpeggio inoremap dw <C-W>
  "call arpeggio#map('i', '', 0, '<SPACE>', '<C-W>')

    " Map Alt+Right/Left to move forward/backward 1 word
    "imap [1;3C <C-Right>
    "imap [1;3D <C-Left>


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

    nnoremap <C-]> g<C-]>zvzz
    nnoremap g<C-]> g<C-]>zvzz

    " Reformat a paragraph:
    vnoremap Q gq
    nnoremap Q gqap
    map K <silent>

    map <C-K> <C-W>k<C-W>_

    " window splitting maps
    nmap <leader>v :vsplit<CR><C-w><C-w>:Tbbl<CR>zz<C-w><C-w><C-w><C-w>zz
    "nmap <leader>v :vertical wincmd ^<CR>:wincmd w<CR>
    nmap <leader>h :split<CR><C-w><C-w>:Tbbl<CR>zz<C-w><C-w><C-w><C-w>zz
    "nmap <leader>v :vsplit<CR><C-w><C-w><Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)zz<C-w><C-w><C-w><C-w>zz
    "nmap <leader>h :split<CR><C-w><C-w><Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)<Plug>(exjumplist-previous-buffer)zz<C-w><C-w><C-w><C-w>zz

    function! MoveSplitSeparatorToUp()
      let currentWinNb = winnr()
      wincmd j
      let downWinNb = winnr()
      if(currentWinNb == downWinNb)
        " We are in the down side window
        5wincmd +
      else
        " We are in the up side window
        wincmd p
        5wincmd -
      endif
    endfunction

    function! MoveSplitSeparatorToDown()
      let currentWinNb = winnr()
      wincmd k
      if(bufname('%') == '-TabBar-')
        wincmd p
      endif
      let upWinNb = winnr()
      if(currentWinNb == upWinNb)
        " We are in the up side window
        5wincmd +
      else
        " We are in the up side window
        wincmd p
        5wincmd -
      endif
    endfunction

    function! MoveSplitSeparatorToRight()
      let currentWinNb = winnr()
      wincmd h
      let leftWinNb = winnr()
      if(currentWinNb == leftWinNb)
        " We are in the left side window
        5wincmd >
      else
        " We are in the right side window
        wincmd p
        5wincmd <
      endif
    endfunction

    function! MoveSplitSeparatorToLeft()
      let currentWinNb = winnr()
      wincmd l
      let rightWinNb = winnr()
      if(currentWinNb == rightWinNb)
        " We are in the right side window
        5wincmd >
      else
        " We are in the right side window
        wincmd p
        5wincmd <
      endif
    endfunction

    " window splits resizing maps
    " height:
    "nmap [1;3B 5<C-w>-
    "nmap [1;3A 5<C-w>+
    nmap <silent> [1;3B :silent call MoveSplitSeparatorToDown()<CR>
    nmap <silent> [1;3A :silent call MoveSplitSeparatorToUp()<CR>
    " width:
    "nmap [1;3C 5<C-w>>
    "nmap [1;3D 5<C-w><
    " ALT-RIGHT
    nmap <silent> [1;3C :silent call MoveSplitSeparatorToRight()<CR>
    " ALT-LEFT
    nmap <silent> [1;3D :silent call MoveSplitSeparatorToLeft()<CR>
    " all windows same size:
    nmap = <C-w>=

    " switch cpp <--> hpp
    map a :A<CR>
    vmap a <C-C>:A<CR>gv
    imap a <C-C>:A<CR>i
    "map <S-Tab> :A<CR>
    "vmap <S-Tab> <C-C>:A<CR>gv
    "imap <S-Tab> <C-C>:A<CR>i

    function! CloseBuffer()
      if &buftype == '-TabBar-'
        return
      elseif &buftype == 'quickfix'
        exec "silent :cclose"
      else
        let last_buffer = bufnr('%')
        "set nobuflisted
        Tbbp
        "exec "silent bwipeout ".last_buffer
        exec "silent bdelete ".last_buffer
      endif
    endfunction
    command! CloseBuffer call CloseBuffer()

    function! CloseBufferAndSplit()
      if &buftype == '-TabBar-'
        return
      elseif &buftype == 'quickfix'
        exec "silent :cclose"
      else
        let last_buffer = bufnr('%')
        "set nobuflisted
        quit
        "exec "silent bwipeout ".last_buffer
        exec "silent bdelete ".last_buffer
      endif
    endfunction
    command! CloseBufferAndSplit call CloseBufferAndSplit()

    " close current buffer, keep current split open
    noremap <silent> q :CloseBuffer<CR><C-C>
    vnoremap <silent> q <ESC>:CloseBuffer<CR>gv
    inoremap <silent> q <ESC>:CloseBuffer<CR>i

    " close current buffer and current split
    noremap <silent> <C-Q> :CloseBufferAndSplit<CR>
    vnoremap <silent> <C-Q> <ESC>:CloseBufferAndSplit<CR>
    inoremap <silent> <C-Q> <ESC>:CloseBufferAndSplit<CR>i

    "From http://stackoverflow.com/questions/3984544/skipping-a-window-in-vim-with-ctrl-w-w
    function! s:NextWindowBut(skip,dir)
      let w0 = winnr()
      let nok = 1
      while nok
        " exe "normal! \<c-W>w"
        " or better
        exe 'wincmd '.a:dir
        let w = winnr()
        let n = bufname('%')
        let nok = (n=~a:skip) && (w != w0)
        " echo "skip(".n."):".(n=~a:skip)." w!=w0:".(w != w0)." --> ".nok
      endwhile
      if w == w0
        echomsg "No other acceptable window"
      endif
    endfunction

    nnoremap <silent> <leader><leader> :call <sid>NextWindowBut('-TabBar-','w')<cr>

    "noremap <silent> ` :b#<CR>
    "vnoremap <silent> ` <ESC>:b#<CR>gv
    "inoremap <silent> ` <ESC>:b#<CR>i

    " Tabbar mappings
    " Switch to next/previous buffer
    noremap <silent> w :Tbbp<CR>
    vnoremap <silent> w <ESC>:Tbbp<CR>gv
    inoremap <silent> w <ESC>:Tbbp<CR>i
"    map <silent> e exec "silent Tbbn"
    noremap <silent> e :Tbbn<CR>
    vnoremap <silent> e <ESC>:Tbbn<CR>gv
    inoremap <silent> e <ESC>:Tbbn<CR>i


    " to go back to exact place
    nnoremap ' `
    nnoremap ` '
    noremap '. `.zz
    noremap '' ``zz

    " ctrlp
    let g:ctrlp_match_window_bottom = 1
    "let g:ctrlp_map = 's'
    let g:ctrlp_map = '<Space>'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_max_height = 70
    let g:ctrlp_persistent_input = 0
    let g:ctrlp_clear_cache_on_exit = 0
    call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/ctrlp_cache')
    let g:ctrlp_cache_dir = '$TMPDIR/$USER/_VIM/ctrlp_cache'
    let g:ctrlp_dotfiles = 0
    let g:ctrlp_max_files = 0
    let g:ctrlp_split_window = 0
    "let g:ctrlp_open_multi = 2
    hi CtrlpHighlightMatch ctermfg=Yellow
    let g:ctrlp_highlight_match = [1, 'CtrlpHighlightMatch']
    let g:ctrlp_by_filename = 0
    let g:ctrlp_follow_symlinks = 2
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_lazy_update = 1
    let g:ctrlp_open_multiple_files = '1vr'

    let g:ctrlp_extensions = [ 'quickfix', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']



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
          \ 'PrtHistory(-1)':       ['x'],
          \ 'PrtHistory(1)':        ['z'],
          \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
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
          \ 'PrtClearCache()':      ['[15~'],
          \ 'PrtDeleteEnt()':       ['<F7>'],
          \ 'CreateNewFile()':      ['<c-y>'],
          \ 'MarkToOpen()':         ['<space>'],
          \ 'OpenMulti()':          ['<c-o>'],
          \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
          \ }

    " matcher for ctrlP 
    let g:path_to_matcher = g:dot_vim_dir.'/bundle/ctrlp.vim/matcher'

    "let g:ctrlp_user_command = {
          "\ 'types': {
          "\ 1: ['.git/', 'cd %s && git ls-files'],
          "\ },
          "\ 'fallback': 'find %s -type f'
          "\ }

    function! g:GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
      " the Command-T matcher doesn't do regex. Return now if that was requested.
      if a:regex == 1
        let [lines, id] = [[], 0]
        for item in a:items
          let id += 1
          try | if !( a:ispath && item == a:crfile ) && (match(item, a:str) >= 0)
            cal add(lines, item)
          en | cat | brea | endt
        endfo
        return lines
      end

      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = g:path_to_matcher . " --limit " . a:limit . " --manifest " . ctrlp#utils#cachefile() . " "
      if ! g:ctrlp_dotfiles
        let cmd = cmd . "--no-dotfiles "
      endif
      let cmd = cmd . a:str
      return split(system(cmd))

    endfunction
    let g:ctrlp_match_func = { 'match': 'g:GoodMatch' }

    " tplugin
    "TPlugin kien-ctrlp.vim-8820dec


    " Correct typos..
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
    map <silent> \ :colder<CR>
    vmap <silent> \ <ESC>:colder<CR>i
    imap <silent> \ <ESC>:colder<CR>i

    " Load next search in quickfix window
    map <silent> c :cnewer<CR>
    vmap <silent> c <ESC>:cnewer<CR>i
    imap <silent> c <ESC>:cnewer<CR>i

    " this allows all window commands in insert mode and i'm not accidentally deleting words anymore :-)
    imap <C-w> <C-o><C-w>

    " insert new line without going into insert mode
    au WinEnter *
          \ if &modifiable |
          \   nnoremap <CR> :put=''<CR> |
          \ endif
          "\   nnoremap <S-CR> :put!=''<CR> |
    "nnoremap <CR> :put=''<CR>
    "nnoremap <S-CR> :put!=''<CR>

    " Moving lines or block of text with Alt+Movement Keys
    "nnoremap <C-j> :m+<CR>==
    "nnoremap <C-k> :m-2<CR>==
    "inoremap <C-j> <Esc>:m+<CR>==gi
    "inoremap <C-k> <Esc>:m-2<CR>==gi
    "vnoremap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
    "vnoremap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

    " Bash like keys for the command line
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>
    cnoremap <C-K> <C-U>

    " Jump back to previous cursor location in jumps history 
    nmap <S-Z> <Plug>(exjumplist-previous-buffer)
    " Jump forward to next cursor location in jumps history
    nmap <S-X> <Plug>(exjumplist-next-buffer)

    " Move to next/previous method
    nmap ] ]m
    nmap [ [m<C-C>:noh<CR>

    " NERD commenter
    map <Leader>x <plug>NERDCommenterInvert
    map <Leader>x <plug>NERDCommenterInvert
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

    " Move to next/previous fold
    "nmap [A zkzz  " <C-Up>
    "nmap [B zjzz  " <C-Down>
    "imap [A <C-O>zkzz  " <C-Up>
    "imap [B <C-O>zjzz  " <C-Down>

    " Fold current block of code
    "nmap [D zfi} " <C-Left>
    "nmap [C zo " <C-Right>
    "nmap [C vf} " <C-Right>
    "nmap [D zo " <C-Left>

    " Toggle fold (open/close)
    "inoremap <space> <C-O>za
    nnoremap <space> za
    onoremap <space> <C-C>za

    " Close fold
    "inoremap [D <C-O>zci " <C-Left>
    "nnoremap [D zc " <C-Left>
    "onoremap [D <C-C>zc " <C-Left>

    " Open fold
    "inoremap [C <C-O>zoi " <C-Right>
    "nnoremap [C zo " <C-Right>
    "onoremap [C <C-C>zo " <C-Right>

    " stlrefvim
    " <F6>
    autocmd bufenter *.c,*.h,*.cpp,*.hpp vmap <silent> <Leader>[11 <Plug>StlRefVimVisual
    " <F1>
    autocmd bufenter *.c,*.h,*.cpp,*.hpp nmap <silent> <Leader>[11 <Plug>StlRefVimNormal
                                            
    " crefvim
    " <F1>
    autocmd bufenter *.c,*.h,*.cpp,*.hpp vmap <silent> [11 <Plug>CRV_CRefVimVisual
    autocmd bufenter *.c,*.h,*.cpp,*.hpp nmap <silent> [11 <Plug>CRV_CRefVimNormal

    function! MergeLeftToRight()
      let currentWinNb = winnr()
      wincmd h
      let leftWinNb = winnr()
      if(currentWinNb == leftWinNb)
        " We are in the left side window
        "echo "diffput!"
        normal dp]czz
      else
        " We are in the right side window
        wincmd p
        "echo "diffget!"
        normal do]czz
      endif
    endfunction

    function! MergeRightToLeft()
      let currentWinNb = winnr()
      wincmd l
      let rightWinNb = winnr()
      if(currentWinNb == rightWinNb)
        " We are in the right side window
        "echo "diffput!"
        normal dp]czz
      else
        " We are in the left side window
        wincmd p
        "echo "diffget!"
        normal do]czz
      endif
    endfunction

    " <F5>
    "noremap [15~ do]czz
    "ALT->
    noremap <silent> . :silent call MergeLeftToRight()<CR>
    " <F6>
    "noremap [17~ dp]czz
    "ALT-<
    noremap <silent> , :silent call MergeRightToLeft()<CR>
    
    " if it's a diff
    if &diff
      noremap z [czz
      noremap x ]czz

    else
      map z :silent cprev<CR>zz
      map x :silent cnext<CR>zz
      " <F6>
      nnoremap [17~ :silent set invpaste paste?<CR>
      inoremap [17~ <C-C>:silent set invpaste paste?<CR>i
      "inoremap [17~ <C-C>:silent set paste!<CR>i
      "inoremap [17~ <C-O>[17~
      vnoremap [17~ <C-C>:silent set paste!<CR>gv
    endif

    " Resize splits:
    " vertical
    "nnoremap OA :vertical resize +10<CR>  " <C-Up>
    "nnoremap OB :vertical resize -10<CR>  " <C-Down>
    "inoremap OA <C-O>:resize +10<CR>  " <C-Up>
    "inoremap OB <C-O>:resize -10<CR>  " <C-Down>
    "" horizontal
    "nnoremap OC :resize +10<CR>  " <C-Right>
    "nnoremap OD :resize -10<CR>  " <C-Left>
    "inoremap OC <C-O>:resize +10<CR>  " <C-Right>
    "inoremap OD <C-O>:resize -10<CR>  " <C-Left>

    " Move to prev/next jump
    nnoremap - <C-O>
    nnoremap + <C-I>
    
    " original
    "nnoremap <leader>h       "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>
    "nnoremap <leader>l       "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>

    " very magic
    "" 9 characters shorter
    "nnoremap <leader>OD  "_yiw?\v\w+\_W+%#<CR>:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o><C-l>
    "" 8 characters shorter
    "nnoremap <leader>OC "_yiw:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o>/\v\w+\_W+<CR><C-l>

    " Lets you type :R <command> to run an external command and give you the
    " results in a small new buffer. Useful for filtering your file and
    " getting the results separately
    command! -complete=shellcmd -nargs=* R belowright 15new | r ! <args>

    " Keybinds to make the global register less annoying
    noremap <Leader>p :silent set paste<CR>"+]p:set nopaste<CR>
    noremap <C-P> :silent set paste<CR>"+]p:set nopaste<CR>
    noremap <Leader>P :silent set paste<CR>"+]P:set nopaste<CR>
    noremap <Leader>y "+y
    noremap <Leader>Y "+Y

    " Paste over visually selected text without copying back in the default
    " register the visually selected text that is overwritten
    " (http://www.reddit.com/r/vim/comments/wii9v/try_that_xnoremap_expr_p_vregisterpgvyp/)
    vnoremap P "_dP

    "nnoremap x <C-I>
    "nnoremap z <C-O>

    " Swap two words
    "nmap <silent> Xp :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`':nohlsearch<CR>
    nmap <silent> Xp dawwP

    " Underline the current line with '=' or '-'
    nmap <silent> <Leader>u= :t.\|s/./=/g\|:nohls<cr>
    nmap <silent> <Leader>u- :t.\|s/./-/g\|:nohls<cr>

  " }}} Mappings end


  """""""""""""""""""""""""""""""""
  " Ctags and path {{{
 
    " The last semicolon is the key here. When Vim tries to locate the 'tags' file,
    " it first looks at the current directory, then the parent directory, then the parent of the parent, and so on:
    set tags=$HOME/ngi_1/tags

  " }}}

  "
  """""""""""""""""""""""""""""""""""
  " gtags
  "map <C-[> :Gtags<CR><CR>
  map <C-\> :Gtags -r<CR><CR>

  " Functions {{{

    " CVSdiff branch_name
    command! -nargs=* CVSdiff silent call CVSdiff("<args>")
    function! CVSdiff(cvsversion)
      TbToggle
      TbStop
      "noremap <F3> [czz
      "noremap <F4> ]czz
      noremap z [czz
      noremap x ]czz
      " <F5>
      noremap [15~ do]czz
      " <F6>
      noremap [17~ dp]czz
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
    endfunction

    " View diff of modification done on file since last save
    function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
    endfunction
    com! DiffSaved call s:DiffWithSaved()

  function! Bin2Asc()
    %s//+/g
    %s//:/g
    %s//'\&\r/g
    %s//*/g
  endfunction

  function! CleanTTLog()
    g/^'[^']/d
    g/^UNB/d
    g/^UNZ/d
    g/^''UNB/d
    g/^''UNZ/d
    g/^$/d
    %s/^\(UNT.*'\)&/\1/
    %s/^\(''UNT.*'\)&/\1/
    %s/esponse\nUNH/esponse\r\r\rUNH/
  endfunction

  function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
      silent execute 'bwipeout' buf
    endfor
  endfunction

  function! Refactor()
    call inputsave()
    let @z=input("Replace local var " . @z . "' with: ")
    call inputrestore()
  endfunction
  " Locally (local to block) rename a variable
  nmap <Leader>rv "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[V%:s/<C-R>//<c-r>z/gc<cr>`x

  " }}} Functions end

  " Compilation {{{

    set makeef=vim.err

    call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/scons_errors')
    function! Scons()
      let l:save_shellcmdflag = &shellcmdflag
      set shellcmdflag=-ic
      :cd ~/ngi_1
      ":lcd ~/ngi_1
      :!~/doc/scripts/scons.sh 2>&1 | ~/doc/scripts/filter_scons.sh 2>&1 >| $TMPDIR/$USER/_VIM/scons_errors/scons.err&
      ":cd -
      exe 'set shellcmdflag='.escape(l:save_shellcmdflag,' ')
      :cf $TMPDIR/$USER/_VIM/scons_errors/scons.err
    endfunction

    " F7
    noremap [18~ :!~/doc/scripts/kill_scons.sh<CR>

    function! RestartBE()
      let l:save_shellcmdflag = &shellcmdflag
      set shellcmdflag=-ic
      :!~/doc/scripts/restartBEs.sh LINUX AGS_SvrAVL_APE 2>&1 >| $TMPDIR/$USER/_VIM/restart_logs/logs&
      exe 'set shellcmdflag='.escape(l:save_shellcmdflag,' ')
      :cf $TMPDIR/$USER/_VIM/restart_logs/logs
    endfunction

    " F9
    noremap [20~ :call Scons()<CR>:botright copen<CR>

    call EnsureDirExists($TMPDIR.'/'.$USER.'/_VIM/restart_logs')
    " ALT-F9
    noremap [20;3~ :call RestartBE()<CR>:botright copen<CR>
    "noremap [20;3~ :SyntasticCheck<CR>

    " F10
    noremap <silent> [21~ :silent botright copen<CR>:silent cg $TMPDIR/$USER/_VIM/scons_errors/scons.err<CR>:silent setlocal autoread<CR>G

    " ATL-F10
    noremap <silent> [21;3~ :silent botright copen<CR>:silent cg $TMPDIR/$USER/_VIM/restart_logs/logs<CR>:silent setlocal autoread<CR>G
    "noremap <silent> [21;3~ :silent botright Errors<CR>

    "au FileChangedShellPost * echo "Warning: File changed on disk"
    "au FileType *
          "\ if &buftype == "quickfix" |
          "\     setlocal statusline+=\ \[quickfix\ window\] |
          "\     setlocal statusline+=%=%2*\ %<%P |
          "\ endif


    let g:jah_Quickfix_Win_Height = 10

    " allow the . to execute once for each line of a BLOCK visual selection
    vnoremap . :normal .<CR>

    " Use CTRL-S for saving, also in Insert mode
    "<F2>
    noremap [12~ :w<CR>
    vnoremap [12~ <C-C>:w<CR>gv
    inoremap [12~ <C-O>:w<CR>

    " save to new file and open it
    "    nnoremap :we :WriteAndEdit 
    " <F5>
    noremap [15~ :e!<CR>

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

    function! Dec2Hex()
      let lstr = getline(".")
      let decstr = matchstr(lstr, '\<[0-9]\+\>')
      while decstr != ""
        let decstr = printf("0x%x", decstr)
        exe 's#\<[0-9]\+\>#'.decstr."#"
        let lstr = getline(".")
        let decstr = matchstr(lstr, '\<[0-9]\+\>')
      endwhile
    endfunction

    vnoremap <Leader>ah :call Dec2Hex()<CR>

    function! Hex2Dec()
      let lstr = getline(".")
      let hexstr = matchstr(lstr, '0x[a-fA-F0-9]\+')
      while hexstr != ""
        let hexstr = hexstr + 0
        exe 's#0x[a-fA-F0-9]\+#'.hexstr."#"
        let lstr = substitute(lstr, '0x[a-fA-F0-9]\+', hexstr, "")
        let hexstr = matchstr(lstr, '0x[a-fA-F0-9]\+')
      endwhile
    endfunction

    vnoremap <Leader>ha :call Hex2Dec()<CR>


    " }}}

" MACROS {{{
 
    " ********************************
    " *********** SEARCH *************
    " ********************************

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
    vnoremap <Leader>rb y:bufdo %s/<C-R>=escape(@",'\\/.*$^~[]')<CR>//gec<Left> \|up<Left><Left><Left><Left><Left><Left><Left>
    vnoremap <Leader>rrb y:bufdo %s/<C-R>=escape(@",'\\/.*$^~[]')<CR>//gec<Left> \|up<Left><Left><Left><Left><Left><Left><Left>
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
    autocmd bufenter *.vim,.vimrc nnoremap <silent> [11~ :h <C-R><C-W><CR>
    autocmd bufenter *.vim,.vimrc vnoremap <silent> [11~ y:h <C-R>=escape(@",'\\/.*$^~[]')<CR><CR>

    " Retrofitting: to convert from webpage to cvs up -j.. -j..
"    noremap \wr Icvs up wdw.....WDBPa ^wwdw.i-jWdwi-j^€kd 
    let @t='Icvs up wdw.....WDBPa ^wwdw.i-jWdwi-j^€kd'
"    let @t='^dWdWIcvs up kd^dwdwdwct;Ai kbkb krp^dWdWdWi-jWi-jbklkD^v$dku^wwP^kddd'
"    let @t='dWdWkdv$dkuP^dWdWi-jt;krdWdWdWi -jbdW^PIcvs up kdddku^'
    " Retrofitting: to convert from cvs commit output to cvs up -j.. -j..
"    noremap \cr dWdWddp€kudw..I-jE€kDdw...i -j^dW$A €krpB€kl€kDJIcvs up ^
    let @r='dWdWddp€kudwdwdwI-jE€kDdwdwdwdwi -j^dW$A €krpB€kl€kDJIcvs up ^€kd'

    " revert changes:
    let @e='^df/...€kddd€kuE€klD€kd^dW.E€kl€kr€kD€krdW.^i-jWi-j^D€kuPa Icvs up €kddd€ku^'

    " Paste and increase number, useful for adding numbered log debug
    "nnoremap <leader>p p<C-A>==yy
    "nnoremap <C-P> ciw<C-r>0<C-C>

    " Always save last session when exiting vim
    autocmd VimLeavePre * SessionSaveAs _LAST_SESSION_

    " Warn when opening a file generated during compilation
    "autocmd BufEnter */replicate/*,*/deliveries/* echohl WarningMsg | echo "W A R N I N G !    Editing a file generated during compilation!" | echohl None
    autocmd BufEnter */replicate/*,*/deliveries/* set readonly

    " Edit a macros in place:
    " - qp ==> paste the macro from the q register into the current buffer
    " - qd ==> copy back the modified macro to the q register
    noremap qp mqo"qp
    noremap qd 0"qdd`q

  " }}}

" Stolen from other .vimrc
" {{{

  " Automatic colorization of edifact
  autocmd BufEnter *.play,*.edi,*.edi.log,*.edi.rep,*.rgr,*.gsv,*.gsr,*.gsv.log setf edifact
  
  " Automatic colorization of OTF log files
  autocmd BufEnter *_otf_be_*,*_otf_fe_*,*_otf_cs*,mon*err*,*_sei_master_*,*Svr*,*_Batch_*,*feAPE* setf tracer
  
  " Handle SConstruct and SConscript as python files
  autocmd BufNewFile,BufRead SConstruct* setf python
  autocmd BufNewFile,BufRead SConscript* setf python

  autocmd BufEnter .zsh* setf zsh


  "-----------------------------------------------------------------------------
  " Fix constant spelling mistakes
  "-----------------------------------------------------------------------------

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

" }}}

"echo "davide: DONE!" 

endif
