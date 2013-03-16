require 'spec_helper'

describe Event do

  context 'associations' do
    it {should belong_to :category}
    it {should have_many(:notes).dependent(:destroy)}
  end

  context 'callbacks' do
    it 'converts the event name to lowercase' do
      original_name = 'Cook THE books'
      event = FactoryGirl.create(:event, :name => original_name)
      event.name.should eq original_name.downcase
    end

    it 'shows the start time of an event' do
      time = '2012-12-12 12:12:00 -0800'
      event = FactoryGirl.create(:event, :start => time)
      event.start.should eq time
    end

    it 'orders an event list by datetime stamp' do 
      beginning_date = '2012-12-12'.to_datetime
      ending_date = '2012-12-18'.to_datetime

      date1 = FactoryGirl.create(:event, :start => beginning_date + 1, :stop => ending_date + 1)
      date2 = FactoryGirl.create(:event, :start => beginning_date - 1, :stop => ending_date - 1)
      date3 = FactoryGirl.create(:event, :start => beginning_date + 3, :stop => ending_date + 1)

      Event.all.should match_array [date2, date1, date3]
    end
  end

  context 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :start}
    it {should allow_value('2012/12/12 12:12').for :start}
  end

  context 'range' do 
    it 'returns events that begin in, end in, or span the given date range' do 
      beginning_date = '2012-12-12'.to_datetime
      ending_date = '2012-12-18'.to_datetime

      event_that_starts_in_the_range_but_doesnt_end_in_the_range = FactoryGirl.create(:event, :start => beginning_date + 1, :stop => ending_date + 1)
      event_that_ends_in_the_range_but_doesnt_start_in_the_range = FactoryGirl.create(:event, :start => beginning_date - 1, :stop => ending_date - 1)
      event_that_starts_before_and_ends_after_the_range = FactoryGirl.create(:event, :start => beginning_date - 1, :stop => ending_date + 1)
      out_of_range_event = FactoryGirl.create(:event, :start => ending_date + 1)

      Event.starts_before(ending_date).ends_after(beginning_date).should match_array [event_that_starts_in_the_range_but_doesnt_end_in_the_range,
                                                                   event_that_ends_in_the_range_but_doesnt_start_in_the_range,
                                                                   event_that_starts_before_and_ends_after_the_range]
    end
  end
end