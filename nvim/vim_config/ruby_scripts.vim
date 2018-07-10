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
