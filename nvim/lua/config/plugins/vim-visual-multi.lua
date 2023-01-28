vim.cmd([[
  let g:VM_Mono_hl   = 'Visual'
  let g:VM_Extend_hl = 'WildMenu'
  let g:VM_Cursor_hl = 'Visual'
  let g:VM_Insert_hl = 'IncSearch'

  let g:VM_highlight_matches = 'red'
  let g:VM_leader = '<space>'
  let g:VM_maps = {}
  let g:VM_maps['Find Under']         = '<C-d>'
  let g:VM_maps['Find Subword Under'] = '<C-d>'

  let g:VM_maps['Add Cursor Down']             = '<C-U>'
  let g:VM_maps['Visual Cursors']              = '<space>'
  let g:VM_maps['Switch Mode']                 = 'v'
  let g:VM_maps['Visual Regex']                = '/'

  ]])
