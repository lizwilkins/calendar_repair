#require 'pg'
require 'rspec'
require 'active_record'
require 'event'

RSpec.configure do |config|
  config.after(:all) do
    Task.all.each {|task| task.destroy}
  end
end