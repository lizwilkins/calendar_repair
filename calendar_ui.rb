require './ui_helper.rb'

def welcome
  puts "Welcome to the Calendar!"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press 'd' to display calendar."
    puts "Press 'e' for the event menu."
    puts "Press 't' for the todo menu"
    puts "Press 'c' for the category menu."
    puts "Press 'n' for the note menu"
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'e'
      event_menu
    when 't'
      todo_menu
    when 'c'
      category_menu
    when 'd'
      calendar_menu
    when 'n'
      note_menu
    when 'x'
      exit
    else
      puts "FAIL! Try again!"
    end
  end
end

welcome
