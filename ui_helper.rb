require 'pg'
require 'active_record'
require './lib/event.rb'
require './lib/category.rb'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

require './ui/display_ui.rb'
require './ui/event_ui.rb'
require './ui/category_ui.rb'
require './calendar_ui.rb'
