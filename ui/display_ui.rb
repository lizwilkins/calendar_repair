require './ui_helper.rb'

def calendar_menu
  choice = nil
  until choice == 'x'
    puts "Press 'd' to display events for the day."
    puts "Press 'w' to display events for a range of dates."
    puts "Press 'c' to display events by category."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'd'
      display_day
    when 'r'
      display_range
    when 'c'
      display_by_category
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end

def display_day
  print "Enter the date whose events you want to view (yyyy/mm/dd): "
  choice = gets.chomp.to_datetime
  events = Event.find(:all, :conditions => { :start => choice } )
  events.each { |event| puts "Event: #{event.name}  Start: #{event.start}  End: #{event.stop}" }
end

def display_range
  puts "View events for a specific range."
  print "Enter the beginning date of the range you want to search (yyyy/mm/dd): "
  beginning_date = gets.chomp.to_datetime
  print "Enter the ending date of the range you want to search (yyyy/mm/dd): "
  ending_date = gets.chomp.to_datetime
  events = Event.find(:all, :conditions => {:start => beginning_date..ending_date})
  events.each { |event| puts "Event: #{event.name}  Start: #{event.start}  End: #{event.stop}" }
end

def display_by_category
  list_categories
  print "Enter the ID of the category you want to view events for: "
  choice = gets.chomp
  list = Category.find(choice)
  events = list.events  
  events.each { |event| puts "Event: #{event.name}  Start: #{event.start}  End: #{event.stop}" }
end
