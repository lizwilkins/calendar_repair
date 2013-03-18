require 'pg'
require 'active_record'

require './lib/category.rb'
require './lib/note.rb'
require './lib/event.rb'
require './lib/todo.rb'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

require './ui/category_ui.rb'
require './ui/note_ui.rb'
require './ui/event_ui.rb'
require './ui/todo_ui.rb'
require './ui/display_ui.rb'
require './calendar_ui.rb'
