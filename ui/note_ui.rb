require './ui_helper'

def note_menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a note."
    puts "Press 'l' to list your notes."
    puts "Press 'e' to edit a note."
    puts "Press 'd' to delete a note"
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      name = add_new_note
    when 'l'
      list_notes
    when 'e'
      edit_note
    when 'd'
      delete_note
    when 'x'
      return
    else
      puts "FAIL! Try again!"
    end
  end
end

def add_new_note
  print "Enter the note text: "
  Note.create(:name => gets.chomp)
end

def list_notes
  Note.all.each { |note| puts "ID: #{note.id}  Note: #{note.name}" }
end

def edit_note
  list_notes
  print "Please enter the ID for the note you want to edit: "
  note = Note.find(gets.chomp)
  puts "#{note.id}    #{note.name}"
  print "Is this the note that you want to edit: y/n "
  if gets.chomp == 'y'
    print "Enter the note text: "
    note.update_attributes(:name => gets.chomp)
  else
    edit_note
  end
end

def delete_note
  list_notes
  print "Please enter the ID for the note you want to delete: "
  note = Note.find(gets.chomp)
  puts "#{note.id}    #{note.name}"
  print "Is this the note that you want to delete: y/n "
  if gets.chomp == 'y'
    note.destroy 
    puts "Deleted note '#{note.name}'"
  end
end
