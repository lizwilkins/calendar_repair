require 'spec_helper'

describe Event do

  context 'associations' do
    it {should belong_to :category}
  end

  context 'callbacks' do
    it 'converts the event name to lowercase' do
      original_name = 'Cook THE books'
      event = FactoryGirl.create(:event, :name => original_name)
      event.name.should eq original_name.downcase
    end

    it 'converts the event name to lowercase' do
      time = '2012-12-12 12:12:00 -0800'
      event = FactoryGirl.create(:event, :start => time)
      event.start.should eq time
    end
  end

  context 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :start}
  end
end