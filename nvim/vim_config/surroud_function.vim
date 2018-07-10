" This lets vim-surround be able to surround a motion with a function-call,
" but it's not smart enough to handle delete-surrounding & change-surrounding,
" so it's handled by the functions below
let surround_{char2nr("f")} = "\1func: \1(\r)"


" Mappings

nmap dsf  :call DSurroundFunc()<CR>
nmap csf  :call CSurroundFunc()<CR>

" Change inside/all current/last/next fcall - I don't use these but they
" operate on the surrounding function-call ('a'), or on the arguments inside
" the function-call ('i')
" 'c' is for current (closest one)
" 'l' is for last (aka previous)
" 'b' is for next
"nmap cif    :call <SID>changeFunc('c')<CR>
"nmap cIf    :call <SID>changeFunc('ic')<CR>
"nmap caf    :call <SID>changeFunc('ac')<CR>
"nmap cnf    :call <SID>changeFunc('n')<CR>
"nmap cpf    :call <SID>changeFunc('l')<CR>
"nmap cinf   :call <SID>changeFunc('in')<CR>
"nmap cilf   :call <SID>changeFunc('il')<CR>
"nmap canf   :call <SID>changeFunc('an')<CR>
"nmap calf   :call <SID>changeFunc('al')<CR>




" Patterns
let name_pattern = '\(\k\|\i\|\f\|<\|>\|:\|\\\)\+'
let args_pattern = '\(\\)\|[^)]\)*'
let fcall_pattern = name_pattern . '\s*\ze('
let fargs_pattern = name_pattern . '\s*(\zs' . args_pattern . '\ze\s*)'
let func_pattern  = name_pattern . '\s*(' . args_pattern . '\s*)'

" Delete surrounding function call
function! DSurroundFunc()
    call s:findFunc ('vbc')
    normal ddsb
endfu
" Change surrounding function call
function! CSurroundFunc ()
    let saved_cursor = getcurpos()
    call s:findFunc ('vbc') | redraw
    let char = s:getChar('Change surrounding func with: ')
    if char != "\<Esc>"
        call feedkeys('dcsb' . char, '')
    else
        call s:reset(saved_cursor)
    end
endfu


" Helpers

" Param {String} flags - same as search() (see vim help),
"                       plus 'v' - visually select the function
" Returns the [lnum, col] of the nearest function
function! s:findFunc (flags, ...)
    let fc = a:flags =~# 'c' ? 'c' : ''
    let fb = a:flags =~# 'b' ? 'b' : ''
    let fn = a:flags =~# 'n' ? 'n' : ''
    let visual = a:flags =~# 'v' ? 1 : 0

    let pattern = '\(\k\|\i\|\f\|<\|>\|:\|\\\)\+\s*\ze('
    if (len(a:000) == 1)
        let pattern = a:000[0] | end

    if (visual)
        let start = searchpos(pattern, fc . fb)
        normal! v
        let end   = searchpos(pattern, 'ce')
        return [ start, end ]
    else
        return searchpos(pattern, fc . fb . fn)
    end
endfu
function! s:visualFunc(...)
    let which = get(a:, 1, 'c')
    let pattern = g:fcall_pattern

    " inside ...
    if which =~ 'i'
        let pattern = g:fargs_pattern | end

    " all ...
    if which =~ 'a'
        let pattern = g:func_pattern | end

    " Current
    if which =~ 'c'
        call s:findFunc ('vbc', pattern) | end

    " Next
    if which =~ 'n'
        call s:findFunc ('v', pattern) | end

    " Last
    if which =~ 'l'
        call s:findFunc ('vb', pattern) | end

    return
endfu
function! s:changeFunc(...)
    let which = get(a:, 1, 'c')

    let pattern = g:fcall_pattern

    " inside ...
    if which =~ 'i'
        let pattern = g:fargs_pattern | end

    " all ...
    if which =~ 'a'
        let pattern = g:func_pattern | end

    " Current
    if which =~ 'c'
        call s:findFunc ('vbc', pattern)
        call feedkeys('c', '') | end

    " Next
    if which =~ 'n'
        call s:findFunc ('v', pattern)
        call feedkeys('c', '') | end

    " Last
    if which =~ 'l'
        call s:findFunc ('vb', pattern)
        call feedkeys('c', '') | end

    return ''
endfu
function! s:getChar(message)
    call s:echonHL('Question', a:message)
    let c = getchar()
    if (c =~ '^\d\+$')
        let c = nr2char(c)
    end
    return c
endfu
function! s:reset(position)
    exe 'normal! ' . "\<Esc>"
    call setpos('.', a:position)
endfu
function! s:echonHL(hlgroup, ...)
    exe ':echohl ' . a:hlgroup
    echon join(a:000)
    echohl None
endfu
