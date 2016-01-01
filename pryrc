require 'awesome_print'
require 'rubygems'
require 'interactive_editor'

AwesomePrint.pry!
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue
  puts "no awesome_print :("
end

Pry.commands.alias_command 'x',   'exit' rescue nil
Pry.commands.alias_command 'c',   'continue' rescue nil
Pry.commands.alias_command 's',   'step' rescue nil
Pry.commands.alias_command 'n',   'next' rescue nil
