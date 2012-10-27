"=============================================
"    Name: localbundle.vim
"    File: localbundle.vim
" Summary: move bundle into localbundle.
"  Author: Rykka G.F
"  Update: 2012-09-19
"=============================================
let s:cpo_save = &cpo
set cpo-=C

com! LocalBundle call localbundle#install()

fun! localbundle#init() "{{{
    if !exists('g:localbundle_dir')
        let g:localbundle_dir = expand(g:dot_vim_dir.'/localbundle')
    endif
    if !exists('g:localbundle_rtp')
        let g:localbundle_rtp = ''
    endif
    if filereadable(g:localbundle_dir."/autoload/vundle.vim")
        set rtp&
        exe 'set rtp^='.fnameescape(g:localbundle_rtp)
        exe 'set rtp^='.fnameescape(g:localbundle_dir)
        exe 'set rtp+='.fnameescape(g:localbundle_dir.'/after')
    endif
endfun "}}}

fun! s:log(msg) "{{{
    let g:localbundle_log .= a:msg . "\n"
endfun "}}}
fun! s:system(cmd) abort "{{{
  return system(a:cmd)
endfun "}}}
fun! localbundle#install() abort "{{{
    
    let g:localbundle_log = ""
    let local_dir = shellescape(g:localbundle_dir)
    if !exists("g:bundle_dir")
        let g:bundle_dir = expand(g:dot_vim_dir.'/bundle') 
    endif
    let bundle_dir = shellescape(g:bundle_dir)
    call s:log('')
    call s:log('Remove dir of localbundle')
    redraw 
    echo "Remove dir"
    if has('win32') || has('win64')
        let cmd = "rd /S /Q ".local_dir
    else
        let cmd = "rm -rf ".local_dir
    endif
    let out = s:system(cmd)
    call s:log('$ '.cmd)
    call s:log('> '.out)

    call mkdir(g:localbundle_dir, "p")

    call s:log('')
    call s:log('copy to localbundle ')
    redraw 
    echo "copy to dir"
    if has('win32') || has('win64')
        let dirs = split(glob(g:bundle_dir.'/*/'),'\n')
        for dir in dirs
            let cmd =   'xcopy /E /Y /C /I '.shellescape(dir."*").' '.local_dir
            let out = s:system(cmd)
            call s:log('$ '.cmd)
            call s:log('> '.out)
        endfor
    else
        " davide
        "let opts = "-rn "
        let opts = "-r "
        if !has("mac")
            let opts .= " -l "
        endif
        let cmd = "cp ".opts.bundle_dir."/*/* ".local_dir
        let out = s:system(cmd)
        call s:log('$ '.cmd)
        call s:log('> '.out)
    endif
    
    redraw 
    echo "HelpTags"
    sil! exe 'helptags ' g:localbundle_dir.'/doc'
    call localbundle#init()

    redraw 
    echo "Done. You can view the log by 'echo g:localbundle_log'"
endfun "}}}

let &cpo = s:cpo_save
unlet s:cpo_save
