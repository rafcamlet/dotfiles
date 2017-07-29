ruby << EOF

class String
  def camelize
    self.split('_').collect(&:capitalize).join
  end
end

def let(k, v)
  if k.class == Symbol
    VIM::command("let l:#{k} = #{v}")
  else
    VIM::command("let #{k} = #{v}")
  end
end

def get(k)
 VIM::evaluate(k.to_s)
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


# Monkey-patching core classes, yay!
class String
  # Shortcut for VIM::command(command)
  # @return [nil]
  def vim!
    VIM::command self
  end

  # Shortcut for VIM::evaluate(command)
  # @return [Object]
  def vim?
    VIM::evaluate self
  end
end

# https://github.com/junegunn/vim-ruby-x
class Object
  # Translates Ruby data structure into Vimscript string representation
  # FIXME: ugly
  # @return [String]
  def to_v
    case self
    when Symbol then to_s.inspect
    when String then inspect
    when Array then '[' << map { |e| e.to_v }.join(', ') << ']'
    when Hash then '{' << map { |k, v| [k.to_v, v.to_v].join ': ' }.join(', ') << '}'
    when Range
      if self.begin.is_a?(Integer) && self.end.is_a?(Integer) && self.end > self.begin
        "range(#{self.begin}, #{self.end - (exclude_end? ? 1 : 0)})"
      else
        to_a.to_v
      end
    when true then 1
    when false then 0
    else
      to_s
    end
  end
end

module VIM
  class << self
    # Returns the value of the variable of the given name
    # @param [#to_s] varname
    def [] varname
      varname = varname.to_s
      exists?(varname) ? evaluate(varname) : nil
    end

    # Updates the variable of the given name
    # @param [#to_s] varname
    # @param [Object] value
    def []= varname, value
      command "let #{varname} = #{value.to_v}"
    end
    alias let []=

      # Unsets the variable
      # @param [#to_s] varname
      def unlet *varnames
        command "unlet! #{varnames.join ' '}"
      end

    # Returns the value of the variable of the given name.
    # If the variable does not exist, returns the default value given
    # @param [#to_s] varname
    # @param [Object] default
    def fetch varname, default
      if exists? varname
        evaluate varname
      else
        default
      end
    end

    # Checks if the variable of the given name exists
    # @param [#to_s] varname
    def exists? varname
      call(:exists, varname) == 1
    end

    # Calls Vim function with the given arguments
    # @param [#to_s] func
    def call func, *args
      evaluate "#{func}(#{args.map { |a| a.to_v }.join ', '})"
    end

    # Executes the given block while allowing it to be interruptible with CTRL-C
    # @param [Numeric] interval
    def interruptible(interval = 0.1)
      main    = Thread.current
      watcher = Thread.new {
        sleep interval while evaluate 'getchar(1)'
        main.raise Interrupt
      }
      begin
        yield
      ensure
        watcher.kill
      end
    end

    # Executes normal mode commands. Mappings will be used.
    # @param [String] cmd
    # @return [nil]
    def normal cmd
      "normal #{cmd}".vim!
    end

    # Executes normal mode commands. Mappings will not be used.
    # @return [nil]
    def normal! cmd
      "normal! #{cmd}".vim!
    end

    # Echoes the message. Highlight group can be optionally specified.
    # @return [nil]
    def echo *args
      args.each_slice(2) do |pair|
        msg, hl = pair
        if hl
          "echohl #{hl} | echon #{msg.to_v} | echohl None".vim!
        else
          "echon #{msg.to_v}".vim!
        end
      end
      'echo'.vim!
    end

    # Echoes the message as an error message
    # @param [#to_s] message
    def error msg
      "echoerr #{msg.to_v}".vim!
    end

    private
    def _echo cmd, msg, hl
      if hl
        "echohl #{hl} | #{cmd} #{msg.to_v} | echohl None".vim!
      else
        "#{cmd} #{msg.to_v}".vim!
      end
    end
  end
end

EOF
