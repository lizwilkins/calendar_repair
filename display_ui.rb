require './ui_helper.rb'


def display_calendar
  choice = nil
  until choice == 'x'
    puts "Press 'd' to display events for the day."
    puts "Press 'w' to display events for a range of dates."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'd'
      display_day
    when 'r'
      display_range
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end

def display_day
  puts "Enter the date whose events you want to view (yyyy/mm/dd): "
  p choice = gets.chomp.to_datetime
  events = Event.find(:all, :conditions => { :start => choice } )
  events.each { |event| puts "Event: #{event.name}  Start: #{event.start}  End: #{event.stop}" }
end

def display_range
  puts "View events for a specific range. Enter the beginning date of the range you want to search (yyyy/mm/dd): "
  beginning_date = gets.chomp.to_datetime
  puts "Enter the ending date of the range you want to search (yyyy/mm/dd): "
  ending_date = gets.chomp.to_datetime
  events = Event.find(:all, :conditions => {:start => beginning_date..ending_date})
  events.each { |event| puts "Event: #{event.name}  Start: #{event.start}  End: #{event.stop}" }
end




  
