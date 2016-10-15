$LOAD_PATH << "~/.rvm/gems/ruby-1.8.7-p374/gems/awesome_print-1.0.2/lib"
require 'awesome_print'
require 'rubygems'
require 'interactive_editor'
require 'irb/ext/save-history'
AwesomePrint.irb!
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = '~/.irb-save-history'
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"



# Rails 2
# if ENV.include?('RAILS_ENV') && ENV['RAILS_ENV'] == 'development'
#     #$LOAD_PATH << "~/.rvm/gems/ruby-1.8.7-p374/gems/rails-2.3.8/lib"
#     require 'active_record'
#     #require 'rails'
#     #ActiveRecord::Base.connection.instance_variable_set :@logger, Logger.new(STDOUT)
#     ActiveRecord::Base.logger = Logger.new(STDOUT)
#     #ActiveRecord::Base.connection_pool.clear_reloadable_connections!
#     #Rails.application.eager_load! # Get all Models in [TAB]
#     ActiveRecord::Base.logger.level = 1 # Avoid log in Rails console
# end

# IRB::Irb.class_eval do
#   def output_value
#     ap @context.last_value
#   end
# end
