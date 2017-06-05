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
