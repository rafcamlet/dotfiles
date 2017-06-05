function! DoppelgangerInitHandler()
  if getline('.') !~# '\vdef\s+initialize\(' | return 0 | endif

  let beginning_of_class  =  search('\v^\s*class', 'nbW')
  let attr_line_nr  =  search('\v^\s*attr_accessor', 'nbW', beginning_of_class)
  let class_offset = strlen(matchstr(getline(beginning_of_class), '^\s*'))
  let c_offset = repeat(' ', class_offset + &tabstop)

  let init_offset = strlen(matchstr(getline('.'), '^\s*'))
  let i_offset = repeat(' ', init_offset + &tabstop)

  let params = substitute(getline('.'), '\v\s*def\s+initialize\(([^()]*)\)' , '\1', '')
  echom '"' . params

  let accessor_params = join(map(split(params, '\v,\s*'), '":" . v:val'), ', ')

  let str = i_offset . '@' . params . ' = ' . params

  if  beginning_of_class && !attr_line_nr
    call append(beginning_of_class + 1, c_offset . 'attr_accessor ')
    call append(beginning_of_class + 2, '')
  elseif beginning_of_class && attr_line_nr
    call setline(attr_line_nr, c_offset . 'attr_accessor ' . accessor_params)
  endif

  call setline(line('.') + 1, str)
endfunction

function! DoppelgangerDo()
  call DoppelgangerInitHandler()
endfunction

function! ToggleDoppelganger()
  let g:DoppelgangerEnabled = exists('g:DoppelgangerEnabled') ? !g:DoppelgangerEnabled : 1

  if g:DoppelgangerEnabled
    echom 'Doppelganger Enabled!'
    augroup doppelganger_group
      autocmd!
      autocmd TextChanged   * call DoppelgangerDo()
      autocmd TextChangedI  * call DoppelgangerDo()
    augroup END
  else
    echom 'Doppelganger Disabled!'
    augroup doppelganger_group
      autocmd!
    augroup END
  endif
endfunction

nnoremap <space>k <esc>:call ToggleDoppelganger()<cr>
