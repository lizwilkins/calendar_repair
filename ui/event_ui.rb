require './ui_helper.rb'

def event_menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add an event."
    puts "Press 'l' to list your events."
    puts "Press 'v' to view an event."
    puts "Press 'e' to edit an event."
    puts "Press 'd' to delete an event."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add_event
    when 'e'
      edit_event
    when 'd'
      delete_event
    when 'v'
      view_event
    when 'l'
      list_events
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end

def add_event
  choice = nil
  until choice == 'x'
    puts "Press 'n' to enter a name for your event."
    puts "Press 't1' to enter the start date and time for your event."
    puts "Press 't2' to enter stop date and time for your event."
    puts "Press 'c' to categorize your event" 
    puts "Press 's' to save your event."
    puts "Press 'v' to view your event."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'n'
      name = add_name
    when 't1'
      print "Enter the start time of your event:  "
      start_time = add_time
    when 't2'
      print "Enter the start time of your event:  "
      stop_time = add_time
    when 'c'
      category_id = add_category
    when 'v'
      puts "#{name}    #{start_time}     #{stop_time}"
    when 's'
      save_event(nil, Event.new(:name => name, :start => start_time, :stop => stop_time, :category_id => category_id))
      return
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end

def edit_event
  list_events
  print "Please enter the ID for the event you want to edit: "
  event = Event.find(gets.chomp)
  puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}"
  print "Is the event that you want to edit: y/n "
  if gets.chomp == 'n' then edit_event  end
  choice = nil
  name = event.name
  start_time = event.start
  stop_time = event.stop
  category_id = event.category_id
  until choice == 'x'
    puts "Press 'n' to enter a name for your event."
    puts "Press 't1' to enter the start date and time for your event."
    puts "Press 't2' to enter stop date and time for your event."
    puts "Press 'c' to categorize your event"
    puts "Press 's' to save your event."
    puts "Press 'v' to view your event."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'n'
      name = add_name
    when 't1'
      print "Enter the start time of your event:  "
      start_time = add_time
    when 't2'
      print "Enter the start time of your event:  "
      stop_time = add_time
    when 'c'
      category_id = add_category
    when 'v'
      puts "#{name}    #{start_time}     #{stop_time}"
    when 's'
      save_event(event, Event.new(:name => name, :start => start_time, :stop => stop_time, :category_id => category_id))
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end

def delete_event
  list_events
  print "Please enter the ID for the event you want to delete: "
  event = Event.find(gets.chomp)
  puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}"
  print "Is the event that you want to delete: y/n "
  if gets.chomp == 'y'
    event.destroy 
    puts "Deleted event '#{event.name}'"
  end
end

def add_name
    print "Enter the name of your event:  "
    gets.chomp
end

def add_time
    print "Enter the date of your event (yy/mm/dd hh:mm):  "
    gets.chomp
end

def save_event(event, new_event)
  if event == nil
    Event.new(:name => new_event.name, :start => new_event.start, :stop => new_event.stop, :category_id => new_event.category_id).save
  else
    event.update_attributes(:name => new_event.name, :start => new_event.start, :stop => new_event.stop, :category_id => new_event.category_id)
  end
end

def list_events
  Event.all.each { |event| puts " ID: #{event.id}  Event Name: #{event.name}  Start Time: #{event.start} End Time: #{event.stop}" }
end

def view_event
  puts "Here are your scheduled events: "
  list_events
  print "Please enter the ID for the event you want to view: "
  event = Event.find(gets.chomp)
  puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}"
end

def add_category
  puts "Here are your categories: "
  list_categories
  print "Do you want to assign one of these categories to your event (y/n): "
  choice = gets.chomp
  if choice == 'n'
    add_new_category
    list_categories
  end
  if choice == 'y' || choice == 'n'
    print "Enter the category ID: "
    gets.chomp.to_i
  else
    puts "Invalid input"
    add_category
  end
end
