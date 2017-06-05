ruby << EOF

class String
  def camelize
    self.split('_').collect(&:capitalize).join
  end
end

def current_line
  $curbuf.line_number
end

def current_path
  VIM::evaluate 'expand("%:p")'
end

def replace(str)
  $curbuf[current_line] = str
end

def insert(str)
  col = $curwin.cursor.last
  replace [
    ($curbuf.line[0..(col-1)] if col > 0),
    str,
    $curbuf.line[col..-1]
  ].join
end

EOF
