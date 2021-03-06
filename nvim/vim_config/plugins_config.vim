" ============ svermeulen/vim-easyclip =============

let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUseCutDefaults = 0
let g:EasyClipUseSubstituteDefaults = 0
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipUsePasteDefaults = 0
let g:EasyClipUseGlobalPasteToggle = 0

" ================= junegunn/fzf ===================

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <silent> <space>oo :F<cr>
nnoremap <silent> <space>o :F<cr>
nnoremap <silent> <space>oh :History<cr>

nnoremap <space>ob :Buffers<cr>
nnoremap <space>og :GFiles?<cr>
nnoremap <space>ot  :F '' spec<cr>
" nnoremap <space>oas :F '' app/assets<cr>
nnoremap <space>oc  :F '' app/controllers<cr>
nnoremap <space>om  :F '' app/models<cr>
nnoremap <space>ov  :F '' app/views<cr>
nnoremap <space>os  :F '' app/services<cr>
nnoremap <space>of  :F '' spec/factories<cr>
nnoremap <space>oa  :F '' app/concepts<cr>
nnoremap <space>on  :FZF ~/Dropbox/notes<cr>
nnoremap <space>o-  :F <C-r>=expand("%:h")<CR>/<CR>
nnoremap <space>ol  :BLines<cr>
nnoremap <space>oL  :Lines<cr>
nnoremap <space>ow  :Windows<cr>

let g:fzf_history_dir = '~/.local/share/fzf-history'

inoremap <expr> <c-l> fzf#complete("rg --color=never --no-filename --no-line-number -e '^.*?class +([a-zA-Z0-9:]*) ?.*$' app/models -r '$1' \| sed '/^$/d' \| sort")

" ================ dyng/ctrlsf.vim =================

"By default CtrlSF window will be opened at left, change it to right by
let g:ctrlsf_position = 'right'
nnoremap <space>f :CtrlSF -I -R
nnoremap <silent> <space>F :CtrlSFOpen<cr>

" ================ tpope/vim-rails =================

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

set viminfo^=!
let g:rails_default_file='config/database.yml'

" ============ junegunn/vim-easy-align =============

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"]

" ================== mxw/vim-jsx ===================

let g:jsx_ext_required = 0

" ============= ~/projekty/show-me-db ==============

let g:ShowMeDB_default_mapping = 0
nmap <space>db <plug>show_me_db_fzf_force
nmap <space>gdb <plug>show_me_db_word_under_cursor_force

" ============== scrooloose/nerdtree ===============

nnoremap <c-g><c-g> :NERDTreeToggle<cr>
nnoremap <c-g><c-f> :NERDTreeFind<cr>
augroup NERDTreeGroup
  autocmd BufEnter NERD_tree* setlocal cursorline
  autocmd CursorMoved NERD_tree* redraw | echo '   ' . matchstr(getline('.'), '\v\w.*')
augroup END

" =============== SirVer/ultisnips =================

let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEditSplit='vertical'

" =================== w0rp/ale =====================

let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 500

let g:ale_linters = { 'ruby': ['ruby'],
      \ 'vue': ['eslint'],
      \ 'markdown': ['eslint'],
      \ 'vimwiki': [],
      \ 'md': [],
      \ 'lua': [] }

let g:ale_fixers = { 'ruby': ['rubocop'],
      \ 'typescript': ['eslint', 'prettier', 'tslint'],
      \ 'javascript': ['eslint', 'importjs'],
      \ 'vue': ['prettier', 'eslint'],
      \ 'vim': ['trim_whitespace'],
      \ 'c': ['clang-format'],
      \ 'sql': ['pgformatter'],
      \ 'lua': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'scss': [  'prettier', 'remove_trailing_lines', 'stylelint', 'trim_whitespace'],
      \ }

command! ChangeRubyLinters call ChangeRubyLinters()
nnoremap <space>r :ChangeRubyLinters<cr>
nmap <silent> <tab>k <Plug>(ale_previous_wrap)
nmap <silent> <tab>j <Plug>(ale_next_wrap)
nnoremap <tab>a :ALEFix<cr>

" ============ ryanoasis/vim-devicons ==============

autocmd FileType nerdtree setlocal nolist
autocmd User InitVimLoaded autocmd filetype nerdtree highlight CursorLIne cterm=none ctermbg=236

autocmd User InitVimLoaded autocmd filetype nerdtree highlight NERDTreeFlags cterm=none ctermfg=255

" autocmd User InitVimLoaded autocmd filetype nerdtree highlight NERDTreeFile cterm=none ctermfg=7 ctermbg=none

autocmd User InitVimLoaded autocmd filetype nerdtree highlight NERDTreeOpenable cterm=none ctermfg=14 ctermbg=none
autocmd User InitVimLoaded autocmd filetype nerdtree highlight NERDTreeClosable cterm=none ctermfg=14 ctermbg=none



function! NERDIcon(name, icon, fg)
  exec 'autocmd filetype nerdtree highlight ' . a:name . '_icon ctermbg=none ctermfg=' . a:fg
  exec 'autocmd filetype nerdtree syn match '. a:name . '_icon #' . a:icon . '# containedin=NERDTreeFlags'
endfunction

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '−'

autocmd User InitVimLoaded call NERDIcon('ruby', '', 9)
autocmd User InitVimLoaded call NERDIcon('vue', '﵂', 113)
autocmd User InitVimLoaded call NERDIcon('folder', '', 5)
autocmd User InitVimLoaded call NERDIcon('js', '', 184)
autocmd User InitVimLoaded call NERDIcon('json', '', 184)
autocmd User InitVimLoaded call NERDIcon('text', '', 255)


" =============== vim-ruby/vim-ruby ================

let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'
let g:ruby_operators = 1

" =========== AndrewRadev/splitjoin.vim ============

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_html_attributes_bracket_on_new_line = 1

" ======== nathanaelkane/vim-indent-guides =========

let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'my-note', '', 'whid']
" " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
" " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234
"
" " ============= itchyny/lightline.vim ==============

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly'],
      \     [ 'file_name', 'luapad_msg']
      \   ],
      \ 'right': [
      \   ['luapad_status'],
      \   ['linter_errors', 'linter_warnings', 'linter_ok'],
      \   ['lineinfo'],
      \   ['percent'],
      \ ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'file_name': 'LightlineFilename',
      \   'luapad_msg': 'luapad#lightline_msg',
      \   'luapad_status': 'luapad#lightline_status',
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \ }

let g:lightline.enable = {
      \ 'statusline': 1,
      \ 'tabline': 0
      \ }

function! LightlineFilename()
  let l:result = ''

  if &filetype ==# 'fzf' | return 'FZF' | endif
  if &filetype ==# 'nerdtree' | return '' | endif

  if expand('%:t') ==# ''
    let l:result = '[No Name]'
  else
    let l:result = expand('%')
  end

  if &modified == 1 | let l:result .= ' +' | endif

  return bufnr() . ' | ' . l:result
endfunction

let &updatetime = 300
autocmd CursorHold,BufWritePost * call lightline#update()


" let g:lightline = {
"       \ 'active': {
"       \   'left': [
"       \     [ 'mode', 'paste' ],
"       \     [ 'readonly', 'filename', 'modified' ],
"       \     [ 'luapad_msg']
"       \   ],
"       \ 'right': [
"       \   ['luapad_status'],
"       \   ['lineinfo'],
"       \   ['percent'],
"       \ ],
"       \ },
"       \ 'component_function': {
"       \   'luapad_msg': 'luapad#lightline_msg',
"       \   'luapad_status': 'luapad#lightline_status',
"       \ },
"       \ }



" ============== alvan/vim-closetag ================

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.vue'

" ============== tpope/vim-markdown ================

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'lua', 'javascript']


" ======= thiagoalessio/rainbow_levels.vim =========

nnoremap <silent> <tab>r :RainbowLevelsToggle<cr>

hi! link RainbowLevel0 Constant
hi! link RainbowLevel1 Type
hi! link RainbowLevel2 Function
hi! link RainbowLevel3 String
hi! link RainbowLevel4 PreProc
hi! link RainbowLevel5 Statement
hi! link RainbowLevel6 Identifier
hi! link RainbowLevel7 Normal
hi! link RainbowLevel8 Comment

" ============ Valloric/MatchTagAlways =============

let g:mta_filetypes = {
    \ 'vue' : 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'typescript' : 1,
    \}

let g:mta_use_matchparen_group = 0


" ============== airblade/vim-rooter ===============

" let g:rooter_manual_only = 1

" =========== easymotion/vim-easymotion ============

" map <space>l <Plug>(easymotion-lineforward)
" map <space>j <Plug>(easymotion-j)
" map <space>k <Plug>(easymotion-k)
" map <space>h <Plug>(easymotion-linebackward)
" map s <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-overwin-f2)

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" ============= Raimondi/delimitMate ===============

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
au FileType vue let b:delimitMate_matchpairs = "(:),[:],{:}"

" =============== junegunn/goyo.vim ================

function! s:goyo_enter()
  " set noshowmode
  " set noshowcmd
  " set scrolloff=999
  " IndentGuidesDisable
  " call lightline#disable()
  " syntax on
endfunction

function! s:goyo_leave()
  " set showmode
  " set showcmd
  " call lightline#enable()
  " IndentGuidesEnable
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" =============== majutsushi/tagbar ================

if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif

let g:tagbar_type_vue = {
      \ 'ctagstype': 'vue',
      \ 'kinds': [
      \ 'c:computed',
      \ 'm:methods',
      \ 'r:props',
      \ 'd:data',
      \ 'a:arrays',
      \ 'p:properties',
      \ 'o:elements',
      \ 'g:generator functions',
      \ 'f:functions',
      \ 'v:variables',
      \ 'i:imports',
      \ 'e:exports',
      \ 't:tags',
      \ 's:style classes',
      \ 'S:style',
      \ ],
      \'sro': '.',
      \ 'kind2scope' : { 's' : 'styleclass', 'S': 'style'},
      \ 'scope2kind' : { 'styleclass' : 's', 'style': 'S' },
      \}

nnoremap <silent> <space>t :TagbarToggle<cr>

" =============== jreybert/vimagit =================

" nnoremap <space><space>g :Magit<cr>

" ================= posva/vim-vue ==================

let g:vue_disable_pre_processors=1

" ============= bfredl/nvim-miniyank ===============

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <silent><c-p> <Plug>(miniyank-cycle)
map <silent><c-n> <Plug>(miniyank-cycleback)

" ============== tpope/vim-fugitive ================

nnoremap <space>gw :Gwrite<cr>
nnoremap <space>gs :Gstatus<cr>
nnoremap <space>gv :Gvsplit :%<left><left>
nnoremap <space>gp :Gvsplit master:%<cr>
nnoremap <space>gb :Gblame<cr>
nnoremap <space>gd :Gvdiff
nnoremap <space>gdh :diffget //2<CR>
nnoremap <space>gdl :diffget //3<CR>

" ============ rhysd/git-messenger.vim =============

nnoremap <space>gm :GitMessenger<cr>

" ============ airblade/vim-gitgutter ==============

nmap <tab>l <Plug>(GitGutterNextHunk)
nmap <tab>h <Plug>(GitGutterPrevHunk)

let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'

let g:gitgutter_set_sign_backgrounds = 1

augroup GitGutterGroup
  autocmd!
  autocmd User InitVimLoaded highlight GitGutterChange ctermfg=5
  autocmd User InitVimLoaded highlight GitGutterDelete ctermfg=1
  autocmd User InitVimLoaded highlight GitGutterChangeDelete ctermfg=5
  autocmd User InitVimLoaded highlight GitGutterAdd ctermfg=2
augroup end

" ======== ~/projects/vim-what-i-have-done =========

nnoremap <space>g :Whid<cr>

" ============ mg979/vim-visual-multi ==============

" let g:VM_theme = 'iceblue'
let g:VM_Mono_hl   = 'Visual'
let g:VM_Extend_hl = 'WildMenu'
let g:VM_Cursor_hl = 'Visual'
let g:VM_Insert_hl = 'IncSearch'

let g:VM_highlight_matches = 'red'
let g:VM_leader = '<space>'
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
" let g:VM_maps["Select l"]           = '<c-l>'       " start selecting left
" let g:VM_maps["Select h"]           = '<c-h>'        " start selecting right

let g:VM_maps['Add Cursor Down']             = '<C-U>'
" let g:VM_maps["Add Cursor Up"]               = '<C-I>'
let g:VM_maps['Visual Cursors']              = '<space>'
let g:VM_maps['Switch Mode']                 = 'v'
let g:VM_maps['Visual Regex']                = '/'

autocmd User visual_multi_start nnoremap <c-l> l
autocmd User visual_multi_start nnoremap <c-h> h
autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>
autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>

" =========== leafOfTree/vim-vue-plugin ============

let g:vim_vue_plugin_use_sass = 1
let g:vim_vue_plugin_highlight_vue_attr = 1


" =========== vigoux/LanguageTool.nvim =============

let g:languagetool = { '.' : { 'language' : 'pl-PL' } }


" =============== rhysd/devdocs.vim ================

let g:devdocs_filetype_map = {
    \   'lua': 'lua',
    \   'ruby': 'rails',
    \   'javascript.jsx': 'javascript',
    \   'javascript.test': 'chai',
    \ }

" =============== kkoomen/vim-doge =================

let g:doge_mapping = "<leader>d"

" ============= andymass/vim-matchup ===============

augroup vim-matchup-custom
  autocmd!
  autocmd FileType ruby let b:match_words = '\<\%(if\|unless\|case\|while\|until\|for\|do\|class\|module\|def\|begin\)\>=\@!:\<\%(else\|elsif\|ensure\|when\|rescue\|break\|redo\|next\|retry\)\>:\%(^\|[^.\:@$]\)\@<=\<end\:\@!\>,{:},\[:\],(:)'
augroup END

" ============= voldikss/vim-floaterm ==============

let g:floaterm_position = 'center'
" let g:floaterm_keymap_new = '<space>t'
nnoremap <space>v :FloatermNew --height=1.00 --width=1.00  vifm<cr>
nnoremap <space>V :exec 'FloatermNew --height=1.00 --width=1.00  vifm ' .. getcwd()<cr>


" ============ skywind3000/vim-quickui =============

" clear all the menus
call quickui#menu#reset()


call quickui#menu#install('&Wiki', [
			\ ["&Index", 'VimwikiIndex', ''],
			\ ['L&ua', 'VimwikiIndex 2', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ])


call quickui#menu#install('&Plugins', [
			\ ["&Magit", 'Magit', 'S-tage'],
			\ ], 10000)

call quickui#menu#install('&Session', [
      \ ["&Save", ':mks! ~/Session.vim'],
      \ ["L&oad", ':source ~/Session.vim'],
			\ ])

call quickui#menu#install('&FloatTerm', [
      \ ["&VIFM", 'FloatermNew vifm'],
			\ ])

" enable to display tips in the cmdline
let g:quickui_show_tip = 1
let g:quickui_color_scheme = 'papercol dark'
let g:quickui_border_style = 2
" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>

function ColorQuickUi()
  hi! QuickDefaultBackground ctermfg=251 ctermbg=236 guifg=#c6c6c6 guibg=#303030
  hi! QuickDefaultSel ctermfg=236 ctermbg=251 guifg=#303030 guibg=#c6c6c6
  hi! QuickDefaultKey term=bold ctermfg=179 gui=bold guifg=#d7af5f
  hi! QuickDefaultDisable ctermfg=11 guifg=#808080
  hi! QuickDefaultHelp ctermfg=7 ctermbg=8 guifg=#585858 guibg=#1c1c1c
  hi! QuickDefaultBorder ctermfg=66 ctermbg=236 guifg=#5f8787 guibg=#303030
  hi! QuickDefaultTermBorder ctermfg=66 ctermbg=236 guifg=#5f8787 guibg=#303030
endfunction

augroup QuickUiGroup
  autocmd!
  autocmd User InitVimLoaded call ColorQuickUi()
augroup end

" ============ ripxorip/aerojump.nvim ==============
" nmap <space>k <Plug>(AerojumpSpace)
"
" augroup MyAerojumpBufSettings
"   au!
"   " au Filetype AerojumpFilter setlocal nosplitbelow nosplitright
"   au Filetype *.aerojump setlocal signcolumn=yes
"   " au Filetype *.aerojump setlocal nolist
"   au Filetype AerojumpFilter setlocal nonumber
"
"   au BufLeave AerojumpFilter setlocal splitright splitbelow
" augroup END


" ============== jpalardy/vim-slime ================

let g:slime_target = "tmux"


" ============= antoinemadec/coc-fzf ===============

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:coc_fzf_opts = ['--reverse']


" ========= iamcco/markdown-preview.nvim ===========

let g:mkdp_auto_close = 0


" ============ plasticboy/vim-markdown =============

let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0


" " ========= vim-pandoc/vim-pandoc-syntax ===========
" "
" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END


" ================ mattn/emmet-vim =================

vmap <c-e> <c-y>,
imap <c-e> <c-y>,


" ============ kamykn/popup-menu.nvim ==============
"
hi Pmenu ctermfg=204 ctermbg=207
hi PmenuSel ctermfg=135 ctermbg=200


" ========== Xuyuanp/nerdtree-git-plugin ===========
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" ========== vim-ctrlspace/vim-ctrlspace ===========
let g:CtrlSpaceDefaultMappingKey = "<space>op "


" =============== mhinz/vim-signify ================

" highlight SignifySignAdd ctermfg=2 ctermbg=none
" highlight SignifySignChange ctermfg=7  ctermbg=none
" highlight SignifySignDelete ctermfg=1 ctermbg=none
" highlight SignifySignDeleteFirstLine ctermfg=1 

" ============== Yggdroot/indentLine ===============
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', 'md', 'json']
let g:markdown_syntax_conceal = 0

" ============== luochen1990/rainbow ===============

let g:rainbow_conf = {
      \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \	'ctermfgs': ['1', '2', '3', '4'],
      \	'guis': [''],
      \	'cterms': [''],
      \	'operators': '_,_',
      \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \	'separately': {
      \		'*': {},
      \		'vue': {
      \			'parentheses_options': 'containedin=javascriptVueScript',
      \		},
      \		'markdown': {
      \			'parentheses_options': 'containedin=markdownCode contained', 
      \		},
      \		'lisp': {
      \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
      \		},
      \		'haskell': {
      \			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
      \		},
      \		'vim': {
      \			'parentheses_options': 'containedin=vimFuncBody', 
      \		},
      \		'perl': {
      \			'syn_name_prefix': 'perlBlockFoldRainbow', 
      \		},
      \		'stylus': {
      \			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
      \		},
      \		'css': 0, 
      \	}
      \}

" ============ simnalamburt/vim-mundo ==============
"
nnoremap <F5> :MundoToggle<CR>


" ============ pechorin/any-jump.nvim ==============

nnoremap <space>j :AnyJump<cr>


" ============ puremourning/vimspector =============
"
let g:vimspector_enable_mappings = 'HUMAN'
