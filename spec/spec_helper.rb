require 'pg'
require 'rspec'
require 'active_record'
require 'shoulda-matchers'
require 'factory_girl'
require './spec/factories'
require 'note'
require 'event'
require 'category'
require 'todo'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])


RSpec.configure do |config|
  config.after(:each) do
    Category.all.each {|task| task.destroy}
    Event.all.each {|task| task.destroy}
    Todo.all.each {|task| task.destroy}
    Note.all.each {|task| task.destroy}
  end
end