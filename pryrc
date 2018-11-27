Pry.editor = 'vim'
Pry.config.theme = "railscasts"
$LOAD_PATH << '~/.rvm/gems/ruby-2.5.3/gems/awesome_print-1.7.0/lib'
$LOAD_PATH << '~/.rvm/gems/ruby-2.5.3/gems/interactive_editor-0.0.10/lib'

require 'awesome_print'
require 'rubygems'
require 'interactive_editor'

AwesomePrint.pry!
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "no awesome_print :("
end

Pry.commands.alias_command 'x',   'exit' rescue nil
Pry.commands.alias_command 'c',   'continue' rescue nil
Pry.commands.alias_command 's',   'step' rescue nil
Pry.commands.alias_command 'n',   'next' rescue nil
Pry.commands.alias_command 'r!',   'reload!' rescue nil
