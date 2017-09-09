function! Neonews()
ruby << EOF
  require 'rubygems'
  require 'open-uri'
  require 'nokogiri'
  require 'action_view'

  include ActionView::Helpers::DateHelper

  url = 'https://github.com/neovim/neovim/wiki/Related-projects'
  html = open(url)
  doc = Nokogiri::HTML(html)
  css =  '#wiki-wrapper > div.gh-header > div > div.gh-header-meta > relative-time'

  last_date = Date.strptime(doc.css(css).text, '%b %d, %Y')
  time_ago = time_ago_in_words(Date.strptime(doc.css(css).text, '%b %d, %Y'))

  show = ->(str) { VIM::command("call WinAppend('#{str}')") }

  [
    'Neovim plugins - Ostatnia zmiana:',
    '',
    last_date,
    time_ago
  ].each &show
EOF
  return ''
endfunction

command! Neonews call Neonews()



function! InsertClass()

ruby << EOF

  current_path =~ Regexp.new('.*app/[^/]*/(.*)\.rb$')
  if $1
    class_name = $1.split('/').map(&:camelize).join('::')
    insert class_name
  end

EOF

endfunction

command! InsertClass call InsertClass()


"=============================================

ruby << EOF
require 'fuzzy_match'
require 'forwardable'

class FindLastFile
  extend Forwardable

  def_delegators :@fuzzy, :find, :find_all

  def initialize
    @fuzzy = FuzzyMatch.new(
      File.read(File.expand_path('~/.vim_file_list')).lines.map(&:strip).uniq
    )
  end

end
EOF

augroup find_last_file_group
  autocmd!
  autocmd BufRead * call system('echo ' . expand("%:p") . ' >> ~/.vim_file_list')
augroup END

function! FindLastFileComplete(A,L,P)
  let l:result = []
  ruby let :result, FindLastFile.new.find_all(get('a:A')).first(10)
  return l:result
endfunction

function! FindLastFile(name)
ruby << EOF
 file_name = FindLastFile.new.find(VIM::evaluate('a:name'))

 VIM::command("e #{file_name}")
EOF
endfunction

command! -nargs=? -bang -complete=customlist,FindLastFileComplete FindLastFile call FindLastFile(<q-args>)


function! TestFindLastFileComplete(A)
 let l:result = []
ruby << EOF
 list = FindLastFile.new.find_all(VIM::evaluate('a:A'))
 VIM::command("let l:result = #{list}")
EOF
 return l:result
endfunction


function! WOW(A)
call fzf#run({
      \   'source':  TestFindLastFileComplete(a:A),
      \   'sink':    'e'
      \ })
endfunction

command! -nargs=? WOW call WOW(<q-args>)
