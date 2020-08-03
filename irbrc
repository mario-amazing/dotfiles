require 'rubygems'
require 'interactive_editor'
require 'irb/ext/save-history'

require "amazing_print"
AmazingPrint.irb!

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = '~/.irb-save-history'
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
