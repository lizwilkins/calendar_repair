require './ui_helper.rb'

def calendar_menu
  choice = nil
  until choice == 'x'
    puts "Press 'd' to display events for the day."
    puts "Press 'w' to display events for the week"
    puts "Press 'm' to display events for the month"
    puts "Press 'y' to display events for the year"
    puts "Press 'r' to display events for a range of dates."
    puts "Press 'c' to display events by category."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'd'
      display_day
    when 'w'
      display_week
    when 'm'
      display_month
    when 'y'
      display_year
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
  beginning_date = gets.chomp.to_datetime
  ending_date = beginning_date
  date_range(beginning_date, ending_date)
 end

def display_week
  print "Enter the beginning date for the week you want to search (yyyy/mm/dd): "
  beginning_date = gets.chomp.to_date
  ending_date = beginning_date + 7
  date_range(beginning_date, ending_date)
end

def display_month
  puts "Enter the month whose events you want to view (yyyy/mm): "
  beginning_date = (gets.chomp + "/01").to_date
  ending_date = beginning_date + 30
  date_range(beginning_date, ending_date)
end

def display_year
  puts "Enter the year whose events you want to view (yyyy): "
  beginning_date_string = gets.chomp
  beginning_date = (beginning_date_string + "/01/01").to_date
  ending_date = (beginning_date_string + "/12/31").to_date
  date_range(beginning_date, ending_date)
end

def display_range(beginning_date, ending_date)
  puts "View events for a specific range."
  print "Enter the beginning date of the range you want to search (yyyy/mm/dd): "
  beginning_date = gets.chomp.to_datetime
  print "Enter the ending date of the range you want to search (yyyy/mm/dd): "
  ending_date = gets.chomp.to_datetime
end

def date_range(beginning_date, ending_date)
  Event.starts_before(ending_date).ends_after(beginning_date).each { |event| puts "Name: #{event.name}  Start: #{event.start}  End: #{event.stop}" }
end

def display_by_category
  list_categories
  print "Enter the ID of the category you want to view events for: "
  choice = gets.chomp
  list = Category.find(choice)
  events = list.events  
  events.each { |event| puts "Event: #{event.name}  Start: #{event.start}  End: #{event.stop}" }
end
