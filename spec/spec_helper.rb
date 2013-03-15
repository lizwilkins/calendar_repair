require 'pg'
require 'rspec'
require 'active_record'
require 'shoulda-matchers'
require 'factory_girl'
require './spec/factories'
require 'event'
require 'category'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])


RSpec.configure do |config|
  config.after(:each) do
    Category.all.each {|task| task.destroy}
    Event.all.each {|task| task.destroy}

  end
end