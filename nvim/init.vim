" Use gf to open config files

runtime vim_config/meta.vim
runtime vim_config/plugins.vim
runtime vim_config/plugins_config.vim
runtime vim_config/config.vim
runtime vim_config/keybindings.vim
runtime vim_config/scripts.vim
" runtime vim_config/tabline.vim
" runtime vim_config/projects.vim
runtime vim_config/custom_colors.vim

" Lua

" lua require 'old_projects'
" lua require 'projects'
" lua require 'tui'
lua require 'colors'
lua require 'helpers'
lua require 'init'
lua require 'scripts'
lua require 'ruby_helpers'
" lua require 'ts_highlights'
lua require 'ale_highlights'

" JSON store:
" vim_config/json/projects.json

" runtime vim_config/status_line.vim

"====================================
"---------Testing_new_features-------
"====================================

command! -nargs=1 Boss :call luaeval("require'boss'.eval(_A)", <q-args>)
command! Bundle lua require'finders'.find{ cwd = "/home/r2d2/projects/dotfiles/nvim/bundle/", pattern = '(lua|vim)$' }
nnoremap <space>ok <cmd>lua require'sfs'()<cr>

nnoremap <space>of <cmd>lua require('finders').grep()<cr>
nnoremap <space>o<c-f> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

"
" let g:lua_tree_side = 'left' "left by default
" let g:lua_tree_width = 40 "30 by default
" let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:lua_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
" let g:lua_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
" let g:lua_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
" let g:lua_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
" let g:lua_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:lua_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
" let g:lua_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:lua_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:lua_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
" let g:lua_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
" let g:lua_tree_show_icons = {
"     \ 'git': 1,
"     \ 'folders': 1,
"     \ 'files': 1,
"     \ }
" "If 0, do not show the icons for one of 'git' 'folder' and 'files'
" "1 by default, notice that if 'files' is 1, it will only display
" "if nvim-web-devicons is installed and on your runtimepath
"
" " You can edit keybindings be defining this variable
" " You don't have to define all keys.
" " NOTE: the 'edit' key will wrap/unwrap a folder and open a file
" let g:lua_tree_bindings = {
"     \ 'edit':            ['<CR>', 'o'],
"     \ 'edit_vsplit':     '<C-v>',
"     \ 'edit_split':      '<C-x>',
"     \ 'edit_tab':        '<C-t>',
"     \ 'toggle_ignored':  'I',
"     \ 'toggle_dotfiles': 'H',
"     \ 'refresh':         'R',
"     \ 'preview':         '<Tab>',
"     \ 'cd':              '<C-]>',
"     \ 'create':          'a',
"     \ 'remove':          'd',
"     \ 'rename':          'r',
"     \ 'cut':             'x',
"     \ 'copy':            'c',
"     \ 'paste':           'p',
"     \ 'prev_git_item':   '[c',
"     \ 'next_git_item':   ']c',
"     \ }
"
" " Disable default mappings by plugin
" " Bindings are enable by default, disabled on any non-zero value
" " let lua_tree_disable_keybindings=1
"
" " default will show icon by default if no icon is provided
" " default shows no icon by default
" let g:lua_tree_icons = {
"     \ 'default': '',
"     \ 'symlink': '',
"     \ 'git': {
"     \   'unstaged': "✗",
"     \   'staged': "✓",
"     \   'unmerged': "",
"     \   'renamed': "➜",
"     \   'untracked': "★"
"     \   },
"     \ 'folder': {
"     \   'default': "",
"     \   'open': ""
"     \   }
"     \ }
"
" nnoremap <c-g><c-g> :LuaTreeToggle<CR>
" nnoremap <leader>r :LuaTreeRefresh<CR>
" nnoremap <c-g><c-f> :LuaTreeFindFile<CR>
" " LuaTreeOpen and LuaTreeClose are also available if you need them


" a list of groups can be found at `:help lua_tree_highlight`
" highlight LuaTreeFolderIcon guifg=blue


nnoremap <space>s <cmd>RubyOpenStyle<cr>
nnoremap <expr> 8 luaeval('require("scripts").if_qf_open(":cp\<cr>", "8")')
nnoremap <expr> 9 luaeval('require("scripts").if_qf_open(":cn\<cr>", "9")')

inoremap <c-a> <home>
inoremap <c-e> <end>

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-q> <cmd>lua vim.lsp.buf.formatting()<cr>
nnoremap <silent> [g    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<cr>
vnoremap <silent> ga    <cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>
nnoremap <silent> ge    <cmd>lua vim.lsp.util.show_line_diagnostics()<cr>
command! Rename lua vim.lsp.buf.rename()

augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set ignorecase
    autocmd CmdLineLeave : set smartcase
augroup END

nnoremap <space>j :AnyJump<cr>

autocmd BufEnter * inoremap <expr><silent> <c-j> 
      \ luaeval('(({require"snippets".lookup_snippet_at_cursor()})[2]
      \ or require"snippets".has_active_snippet())
      \ and [[<cmd>lua return snippets_or_what()<cr>]]
      \ or [[<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>]]')
inoremap <c-k> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

autocmd FileType qf nnoremap <buffer> <cr> <cr> 

function! EditMigration()
  exec 'edit ' . system("ls -td1 db/migrate/* | head -1")
endfunction
command! EditMigration call EditMigration()

augroup help_autogroup
    autocmd!
    autocmd BufEnter * if &ft == 'help' | silent! wincmd L | end
    autocmd BufEnter * if &ft == 'help' | silent! vertical resize 80 | end
augroup END

command! VueFind exec 'silent grep "<' . Mixedcase(expand('%:t:r')) . '" -g "*.vue"'
nnoremap <space>u :VueFind<cr>

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup = "YankHighlight", timeout = 300 }

augroup END

nnoremap <tab>fs :FLShow<cr>
nnoremap <tab>fa :FLShow<cr>

nnoremap <nowait> <space>b :e app/assets/stylesheets/base.scss<cr>

nnoremap <nowait> <space>d :SF 
nnoremap <leader>zsh :e ~/.zshrc<cr>

" scrollbind
nnoremap yob :set scb!<cr>

augroup myCmdwinEnter
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
  autocmd CmdwinEnter * nnoremap <buffer> q :q<cr> 
augroup END

command! OpenDict exec 'edit ' . ( !empty(&l:dictionary) ? &l:dictionary : stdpath('config') . '/dict/' . &filetype)

autocmd BufRead,BufNewFile,BufEnter *.vue setlocal filetype=vue
autocmd BufRead,BufNewFile,BufEnter *.vue syntax sync fromstart

set foldtext=MyFoldText()

nnoremap <silent> <space>t :TagbarToggle<cr>

function! TestColor()
  for i in range(1, 255)
    exec 'highlight MyGroup' . i . ' ctermfg=' . i
    call append(line('$'), 'Test TEST test ' . i)
    call matchadd('MyGroup' . i, '\%'. i . 'l')
  endfor
endfunction

" Where is it from?
let g:incsearch#magic = '\v' " very magic

inoremap <expr> <c-l> fzf#complete("rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/models -r '$1' \| sed '/^$/d' \| sort")

doautocmd User InitVimLoaded
