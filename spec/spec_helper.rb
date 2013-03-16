require 'pg'
require 'rspec'
require 'active_record'
require 'shoulda-matchers'
require 'factory_girl'
require './spec/factories'
<<<<<<< HEAD
require 'note'
require 'event'
require 'category'
require 'todo'
=======
require 'event'
require 'category'
>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])


RSpec.configure do |config|
  config.after(:each) do
    Category.all.each {|task| task.destroy}
    Event.all.each {|task| task.destroy}
<<<<<<< HEAD
    Todo.all.each {|task| task.destroy}
    Note.all.each {|task| task.destroy}
=======

>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe
  end
end