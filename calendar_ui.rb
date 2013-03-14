require './ui_helper.rb'

def welcome
  puts "Welcome to the Calendar!"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press 'l' to list your events."
    puts "Press 'v' to view an event."
    puts "Press 'a' to add an event."
    puts "Press 'e' to edit an event."
    puts "Press 'd' to delete an event."
    puts "Press 'c' to display calendar."
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
    when 'c'
      display_calendar
    when 'x'
      exit
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
    when 'v'
      puts "#{name}    #{start_time}     #{stop_time}"
      #view_event
    when 's'
      save_event(nil, Event.new(:name => name, :start => start_time, :stop => stop_time))
      return
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
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
    Event.new(:name => new_event.name, :start => new_event.start, :stop => new_event.stop).save
  else
    event.update_attributes(:name => new_event.name, :start => new_event.start, :stop => new_event.stop)
  end
end


def list_events
  puts  "Event ID   Event Name   Start Time    End Time"   
  Event.all.each { |event| puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}" }
end

def view_event
  puts "Here are your scheduled events: "
  list_events
  puts "Please enter the ID for the event you want to view: "
  event = Event.find(gets.chomp)
  puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}"
end


def delete_event
  list_events
  puts "Please enter the ID for the event you want to delete: "
  event = Event.find(gets.chomp)
  puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}"
  puts "Is the event that you want to delete: y/n "
  if gets.chomp == 'y'
    event.destroy 
    puts "Deleted event '#{event.name}'"
  end
end

def edit_event
  list_events
  puts "Please enter the ID for the event you want to edit: "
  event = Event.find(gets.chomp)
  puts "#{event.id}    #{event.name}    #{event.start}     #{event.stop}"
  puts "Is the event that you want to edit: y/n "
  if gets.chomp == 'n' then edit_event  end
  choice = nil
  name = event.name
  start_time = event.start
  stop_time = event.end
  until choice == 'x'
    puts "Press 'n' to enter a name for your event."
    puts "Press 't1' to enter the start date and time for your event."
    puts "Press 't2' to enter stop date and time for your event."
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
    when 'v'
      puts "#{name}    #{start_time}     #{stop_time}"
      #view_event(Event.new(:name => name, :start => start_time, :end => stop_time))
    when 's'
      save_event(event, Event.new(:name => name, :start => start_time, :stop => stop_time))
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end

end

  
  


welcome

























