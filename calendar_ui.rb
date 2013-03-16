require './ui_helper.rb'

def welcome
  puts "Welcome to the Calendar!"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press 'e' for the event menu."
<<<<<<< HEAD
    puts "Press 't' for the todo menu"
    puts "Press 'c' for the category menu."
    puts "Press 'n' for the note menu"
=======
    puts "Press 'c' for the category menu"
>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe
    puts "Press 'd' to display calendar."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'e'
      event_menu
<<<<<<< HEAD
    when 't'
      todo_menu
=======
>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe
    when 'c'
      category_menu
    when 'd'
      calendar_menu
<<<<<<< HEAD
    when 'n'
      note_menu
=======
>>>>>>> 832332fbba9efc72b380231a0aac99e2952d9cbe
    when 'x'
      exit
    else
      puts "FAIL! Try again!"
    end
  end
end

welcome