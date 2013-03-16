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
    puts "Press 'n' to enter a name for your event (required)."
    puts "Press 't1' to enter the start date and time for your event (required)."
    puts "Press 't2' to enter stop date and time for your event."
    puts "Press 's' to save your event.  You can add a note at this time."
    puts "Press 'v' to view your event."
    puts "Press 'x' to exit."
    choice = gets.chomp
    stop_time = nil
    case choice
    when 'n'
      print "Enter the name of your event:  "
      name = gets.chomp
    when 't1'
      print "Enter the start time of your event (yyyy/mm/dd hh:mm):  "
      start_time = gets.chomp
      if stop_time == nil then stop_time = start_time end
    when 't2'
      print "Enter the stop time of your event (yyyy/mm/dd hh:mm):  "
      stop_time = gets.chomp
    when 'c'
      category_id = add_category
    when 'v'
      puts "#{name}    #{start_time}     #{stop_time}"
    when 's'
      event = Event.create(:name => name, :start => start_time, :stop => stop_time, :category_id => category_id)
      if event
        puts "Entry saved!"
        print "Do you want to add a note to your event (y/n):  " 
        if gets.chomp == 'y'
          puts 'What would you like to note on your event?'
          event.notes.create(:name => gets.chomp)
        end
      else
        puts "'#{event.name}' was not saved (errors)."
        event.errors.full_messages.each {|message| puts message}
      end
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
    puts "Press 'n' to add/mod the name for your event."
    puts "Press 't1' to add/mod the start date and time for your event."
    puts "Press 't2' to add/mod the stop date and time for your event."
    puts "Press 'c' to add/mod the event category."
    puts "Press 'i' to add/mod a note to the event." 
    puts "Press 's' to save the event."
    puts "Press 'v' to view the event."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'n'
      print "Enter the name of your event:  "
      name = gets.chomp
    when 'i'  # does not allow for modification of existing note
      puts 'What would you like to note on your event?'
      event.notes.create(:name => gets.chomp)
    when 't1'
      print "Enter the start time of your event (yyyy/mm/dd hh:mm):  "
      start_time = gets.chomp
    when 't2'
      print "Enter the stop time of your event (yyyy/mm/dd hh:mm):  "
      stop_time = gets.chomp
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
  notes = event.notes
  if notes.length != 0
    notes.each {|note| puts "Note:  #{note.name}"} 
  end
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

# def add_note(event)
#   puts "Here are your notes: "
#   list_notes
#   print "Do you want to assign one of these notes to your event (y/n): "
#   choice = gets.chomp
#   if choice == 'n'
#     add_new_note
#     list_notes
#   end
#   if choice == 'y' || choice == 'n'
#     print "Enter the note ID: "
#     note_id = gets.chomp.to_i
#     note = Note.find(note_id)

#     @note.noteable(event_id)
#   else
#     puts "Invalid input"
#     add_note
#   end
# end
