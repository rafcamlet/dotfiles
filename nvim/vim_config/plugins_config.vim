" ============ svermeulen/vim-easyclip =============

let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUseCutDefaults = 0
let g:EasyClipUseSubstituteDefaults = 0
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipUsePasteDefaults = 0
let g:EasyClipUseGlobalPasteToggle = 0

" ================= junegunn/fzf ===================

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

let g:fzf_history_dir = '~/.local/share/fzf-history'

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
let g:ale_ruby_flag = 0
let g:ale_lint_delay = 500

let g:ale_linters = { 'ruby': ['ruby'], 'vue': ['eslint'], 'vimwiki': [] }

function! ChangeRubyLinters()
  if g:ale_ruby_flag
    echo 'simple'
    let g:ale_linters = { 'ruby': ['ruby'] }
    let g:ale_ruby_flag = 0
  else
    echo 'full'
    let g:ale_linters = { 'ruby': [
          \ 'rubocop',
          \ 'rails_best_practices',
          \ 'reek',
          \ 'brakeman',
          \ 'ruby'
          \ ] }
    let g:ale_ruby_flag = 1
  end
  ALELint
endfunction

let g:ale_fixers = { 'ruby': ['rubocop'],
      \ 'typescript': ['eslint', 'prettier', 'tslint'],
      \ 'javascript': ['prettier', 'eslint', 'importjs'],
      \ 'vue': ['prettier', 'eslint'],
      \ 'vim': ['trim_whitespace'],
      \ 'c': ['clang-format'],
      \ 'sql': ['pgformatter'],
      \ }

command! ChangeRubyLinters call ChangeRubyLinters()
nnoremap <space>r :ChangeRubyLinters<cr>
nmap <silent> <tab>k <Plug>(ale_previous_wrap)
nmap <silent> <tab>j <Plug>(ale_next_wrap)
nnoremap <tab>a :ALEFix<cr>

" ============ ryanoasis/vim-devicons ==============

autocmd FileType nerdtree setlocal nolist

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
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'my-note', '', 'whid']
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234

" ============= itchyny/lightline.vim ==============

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly'],
      \     [ 'cocstatus', 'file_name']
      \   ],
      \ 'right': [
      \   ['linter_errors', 'linter_warnings', 'linter_ok'],
      \   ['lineinfo'],
      \   ['percent'],
      \ ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'file_name': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
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
" autocmd CursorHold,BufWritePost * call lightline#update()


" ============== alvan/vim-closetag ================

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.vue'

" ============== tpope/vim-markdown ================

hi markdownBold ctermfg=203 cterm=bold
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby']

" ======= thiagoalessio/rainbow_levels.vim =========

nnoremap <silent> <tab>r :RainbowLevelsToggle<cr>

" let g:rainbow_levels = [
"     \{'ctermfg': 84,  'guifg': '#50fa7b'},
"     \{'ctermfg': 117, 'guifg': '#8be9fd'},
"     \{'ctermfg': 61,  'guifg': '#6272a4'},
"     \{'ctermfg': 212, 'guifg': '#ff79c6'},
"     \{'ctermfg': 203, 'guifg': '#ffb86c'},
"     \{'ctermfg': 228, 'guifg': '#f1fa8c'},
"     \{'ctermfg': 15,  'guifg': '#f8f8f2'},
"     \{'ctermfg': 59,  'guifg': '#6b4e32'}]
"     " \{'ctermfg': 231, 'guifg': '#525563'}]

let g:rainbow_levels = [
    \{'ctermfg': 185, 'guifg': '#d9d762'},
    \{'ctermfg': 109, 'guifg': '#86b4bb'},
    \{'ctermfg': 67,  'guifg': '#6c99bb'},
    \{'ctermfg': 98,  'guifg': '#8856d2'},
    \{'ctermfg': 203, 'guifg': '#ef5d32'},
    \{'ctermfg': 215, 'guifg': '#efac32'},
    \{'ctermfg': 188, 'guifg': '#e6e1c4'},
    \{'ctermfg': 59,  'guifg': '#6b4e32'}]


" ================ vimwiki/vimwiki =================

let g:vimwiki_list = [{'path': '~/Dropbox/vim_wiki',
      \ 'syntax': 'markdown', 'ext': '.md'}]

nmap ) <Plug>VimwikiToggleListItem
vmap ) <Plug>VimwikiToggleListItem

nnoremap <plug>MyVimwikiIncreaseLvlWholeItem :VimwikiListChangeLvl increase 1<CR>:call repeat#set("\<Plug>MyVimwikiIncreaseLvlWholeItem")<CR>
map gl <Plug>MyVimwikiIncreaseLvlWholeItem

nnoremap <plug>MyVimwikidecreaseLvlWholeItem :VimwikiListChangeLvl decrease 1<CR>:call repeat#set("\<Plug>MyVimwikidecreaseLvlWholeItem")<CR>
map gh <Plug>MyVimwikidecreaseLvlWholeItem

" map <c-enter> <Plug>VimwikiFollowLink

" autocmd BufEnter */*.md echom '5wow!'
" autocmd BufEnter *vim_wiki* lua print('asdf')

" ============ Valloric/MatchTagAlways =============

let g:mta_filetypes = {
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

" =============== junegunn/goyo.vim ================

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  IndentGuidesDisable
  call lightline#disable()
  syntax on
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  call lightline#enable()
  IndentGuidesEnable
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

" =============== jreybert/vimagit =================

" nnoremap <space><space>g :Magit<cr>

" =============== neoclide/coc.nvim ================

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')


" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>
nnoremap <silent> <space>cl  :<C-u>CocList<CR>
" Remap for rename current word
nmap <space>cr <Plug>(coc-rename)

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
nnoremap <space>gp :Gvsplit production:%<cr>
nnoremap <space>gb :Gblame<cr>
nnoremap <space>gd :Gvdiff
nnoremap <space>gdh :diffget //2<CR>
nnoremap <space>gdl :diffget //3<CR>

" ============ rhysd/git-messenger.vim =============

nnoremap <space>gm :GitMessenger<cr>

" ============ airblade/vim-gitgutter ==============

nmap <tab>l <Plug>GitGutterNextHunk
nmap <tab>h <Plug>GitGutterPrevHunk


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
let g:floaterm_keymap_new = '<space>t'


" ============ skywind3000/vim-quickui =============

" clear all the menus
call quickui#menu#reset()

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

call quickui#menu#install('&Wiki', [
			\ ["Index", 'VimwikiIndex', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ])


call quickui#menu#install('&Plugins', [
			\ ["&Magit", 'Magit', 'S-tage'],
			\ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1
let g:quickui_color_scheme = 'papercol dark'
let g:quickui_border_style = 2
" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>



" ================ xolox/vim-misc ==================

