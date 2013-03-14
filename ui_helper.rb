require 'pg'
require 'active_record'
require './lib/event'
database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

require './display_ui.rb'
require './calendar_ui.rb'


